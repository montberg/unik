import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unik/main_page/tabs/universities/University.dart';
import 'package:unik/main_page/tabs/universities/widgets/university_page/SpecialityPage.dart';

import '../../controllers/FakeSpecialityListLoader.dart';

class SpecialityTile extends StatelessWidget {
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
  Widget build(BuildContext context) {

    List<Widget> result = [];
    speciality?.points.forEach((key, value) {
      result.add(Text("$key:$value"));
    });

    return Material(
      elevation: 4,
      //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          if (speciality != null) {
            Get.to(SpecialityPage(speciality: speciality!));
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
                          child: AutoSizeText("$code \n$title",
                              style: GoogleFonts.montserrat(
                                  fontSize: 16, fontWeight: FontWeight.w800),
                              maxLines: 5),
                        ),
                      ],
                    ),
                    FloatingActionButton(
                        onPressed: () {
                          print(id);
                        },
                        child: Icon(Icons.favorite_border_outlined)),
                  ],
                ),
                Text("~${speciality?.price} руб.",
                    style: GoogleFonts.montserrat(fontSize: 15)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("2022"),
                          SizedBox(height: 10,),
                          ...result
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
  }

  static SpecialityTile byId(int id) {
    return specialityList.where((element) => element.id == id).first;
  }

  static SpecialityTile bySpeciality(Speciality speciality) {
    return SpecialityTile(
        code: speciality.code,
        title: speciality.name,
        id: 0,
        speciality: speciality);
  }
}
