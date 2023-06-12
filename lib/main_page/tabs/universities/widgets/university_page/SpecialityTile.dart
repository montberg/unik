import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unik/main_page/tabs/universities/University.dart';
import 'package:unik/main_page/tabs/universities/widgets/university_page/SpecialityPage.dart';

import '../../controllers/FakeSpecialityListLoader.dart';

class SpecialityTile extends StatefulWidget {
  final String code;
  final String title;
  final int id;
  final Speciality? speciality;
  const SpecialityTile(
      {Key? key,
      required this.code,
      required this.title,
      required this.id,
      this.speciality})
      : super(key: key);

  @override
  State<SpecialityTile> createState() => _SpecialityTileState();

  static SpecialityTile byId(int id) {
    return specialityList.where((element) => element.id == id).first;
  }

  static SpecialityTile bySpeciality(Speciality speciality, int id) {
    return SpecialityTile(
        code: speciality.code,
        title: speciality.name,
        id: id,
        speciality: speciality);
  }
}

class _SpecialityTileState extends State<SpecialityTile> {
  late IconData _icon;
  Future<void> getIcon() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? a = prefs.getStringList("savedSpecs");
    a?.forEach((element) {
      print(element);
      if ((jsonDecode(element))['id'] == widget.speciality?.id) {
        _icon = Icons.favorite;
      }
    });
  }

  @override
  void initState() {
    _icon = Icons.favorite_border;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> result = [];
    int pointsSum = 0;
    widget.speciality?.points.forEach((key, value) {
      result.add(Text("$key:$value"));
      pointsSum+=value;
    });
    return FutureBuilder(
        future: getIcon(),
        builder: (context, snapshot) {
          return Material(
            elevation: 4,
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                if (widget.speciality != null) {
                  Get.to(SpecialityPage(speciality: widget.speciality!));
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                width: 250,
                                child: AutoSizeText(
                                    "${widget.code} \n${widget.title}",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800),
                                    maxLines: 5),
                              ),
                            ],
                          ),
                          FloatingActionButton(
                              onPressed: () async {
                                print(widget.id);
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                List<String>? a =
                                    prefs.getStringList("savedSpecs");
                                int counter = 0;
                                a?.forEach((element) {
                                  if ((jsonDecode(element))['id'] ==
                                      widget.speciality?.id) {
                                    counter++;
                                  }
                                });
                                a ??= [];
                                if (counter == 0) {
                                  a.add(
                                      jsonEncode(widget.speciality?.toJson()));
                                  await prefs.setStringList('savedSpecs', a);
                                  print("saved data to prefs");
                                    setState(() {
                                    _icon = Icons.favorite;
                                    });
                                } else if (counter == 1) {
                                  a.removeWhere((element) =>
                                      jsonDecode(element)['id'] ==
                                      widget.speciality?.id);
                                  await prefs.setStringList('savedSpecs', a);
                                  setState(() {
                                    _icon = Icons.favorite_border;
                                  });
                                }
                              },
                              child: Icon(_icon)),
                        ],
                      ),
                      Text("~${widget.speciality?.price} руб.",
                          style: GoogleFonts.montserrat(fontSize: 15)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text("2022"),
                                Text("Проходные баллы"),
                                SizedBox(
                                  height: 10,
                                ),
                                //...result,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Бюджетный набор: "),
                                    Text(widget.speciality!.pointsSumBudget.toString(), style: GoogleFonts.montserrat(fontWeight: FontWeight.w800),),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Общий набор: "),
                                    Text(widget.speciality!.pointsSum.toString(), style: GoogleFonts.montserrat(fontWeight: FontWeight.w800),),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
