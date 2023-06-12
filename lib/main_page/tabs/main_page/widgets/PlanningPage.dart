import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../universities/University.dart';

List<String> examNameList = const [
  "Русский язык",
  "Математика",
  "Обществознание",
  "История",
  "Химия",
  "Физика",
  "Информатика и ИКТ",
  "Биология",
  "География",
  "Иностранный язык",
  "Индивидуальные достижения",
];

List<Widget> resultUser = [];

class PlanningCard extends StatelessWidget {
  final Speciality data;
  const PlanningCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<Widget> resultUniversity = [];
    List<String?> listString = [];
    data.points.forEach((key, value) {
      resultUniversity.add(Text("$key:$value"));
      listString.add(key);
    });
    List<dynamic> sums = [];
    int maxSum = 0;
    Future<void> _loadPickedExams() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      Map<String, dynamic> output = {};
      var list = prefs.getStringList("examMarks");

      if (list != null) {
        for (int i = 0; i < list.length; i++) {
          output[examNameList[i]] = list[i];
        }
        resultUser.clear();
        //print(data.subjects);
        //print(output);
        List<Map<String, dynamic>> outputList = [];
        output.forEach((key, value) {
          if(key!="Математика" && key!="Русский язык" && value != ""){
            outputList.add({key:value});
          }
        });
       //print(outputList);
        outputList.forEach((element) {
          element["Математика"] = output["Математика"];
          element["Русский язык"] = output["Русский язык"];
        });
        //print(outputList);
        Map<String, dynamic> thirdMap = {};


        data.points.forEach((key, value) {
          if (output.containsKey(key)) {
            thirdMap[key] = output[key];
          }
        });
        //print(thirdMap);
        thirdMap.forEach((key, value) {
          resultUser.add(Text("$value"));
        });
        List<Map<String, dynamic>> result = [];

        for (Map<String, dynamic> map in outputList) {
          bool match = true;
          for (String key in data.subjects) {
            if (!map.containsKey(key)) {
              match = false;
              break;
            }
          }
          if (match) {
            print(match);
            result.add(map);
          }
        }
        for (var element in outputList) {
          element.forEach((key, value) {
            if(key!="Русский язык" && key!="Математика" && data.subjects.contains(key)){
              result.add(element);
            }
          });
        }
       // print(result);

        for (Map<String, dynamic> item in result) {
          int sum = 0;
          item.forEach((key, value) {
              sum += int.parse(value);
          });
          if (sum >= maxSum) {
            maxSum = sum;
          }
        }
      }
    }
    return FutureBuilder(
        future: _loadPickedExams(),
        builder: (context, snapshot) {
          return Material(
            elevation: 4,
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
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
                              child: AutoSizeText("${data.code} \n${data.name}",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800),
                                  maxLines: 5),
                            ),
                          ],
                        ),
                      ],
                    ),
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
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text("Баллы университета"),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Бюджетный набор: "),
                                      Text(data.pointsSumBudget.toString(), style: GoogleFonts.montserrat(fontWeight: FontWeight.w800),),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Общий набор: "),
                                      Text(data.pointsSum.toString(), style: GoogleFonts.montserrat(fontWeight: FontWeight.w800),),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("Ваши баллы"),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  //...resultUser
                                  Text("$maxSum", style: GoogleFonts.montserrat(fontWeight: FontWeight.w800, fontSize: 25)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
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
          );
        });
  }

}

class PlanningPage extends StatefulWidget {
  const PlanningPage({Key? key}) : super(key: key);

  @override
  State<PlanningPage> createState() => _PlanningPageState();
}

class _PlanningPageState extends State<PlanningPage> {
  Future<List<Widget>> loadList() async {
    final List<Widget> children = [];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? a = prefs.getStringList("savedSpecs");
    a?.forEach((element) {
      children
          .add(Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: PlanningCard(data: Speciality.fromJson(jsonDecode(element))),
          ));
    });
    return children;
  }

  late Future<List<Widget>> list;
  @override
  void initState() {
    list = loadList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //floatingActionButton: FloatingActionButton(
      //  onPressed: () async {
      //    final SharedPreferences prefs = await SharedPreferences.getInstance();
      //    prefs.clear();
      //  },
      //),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: BackButton(
          color: Colors.black,
        ),
        title: AutoSizeText("Планировщик поступления",
            style: GoogleFonts.montserrat(
                fontSize: 24, fontWeight: FontWeight.w800, color: Colors.black),
            maxLines: 1),
      ),
      body: FutureBuilder<List<Widget>>(
          future: loadList(),
          builder: (context, snapshot) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: snapshot.data ?? [Text("Пусто")],
                ),
              ),
            );
          }),
    );
  }
}
