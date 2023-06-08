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

    Future<void> _loadPickedExams() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      Map<String, dynamic> output = {};
      var list = prefs.getStringList("examMarks");

      if (list != null) {
        for (int i = 0; i < list.length; i++) {
          output[examNameList[i]] = list[i];
        }
        resultUser.clear();
        print(output);
        print(data.points);

        Map<String, dynamic> thirdMap = {};


        data.points.forEach((key, value) {
          if (output.containsKey(key)) {
            thirdMap[key] = output[key];
          }
        });

        print(thirdMap);
        thirdMap.forEach((key, value) {
          resultUser.add(Text("$value"));
          //listString.add(key);
        });

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
                                  ...resultUniversity
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("Ваши баллы"),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ...resultUser
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
          .add(PlanningCard(data: Speciality.fromJson(jsonDecode(element))));
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
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: BackButton(
          color: Colors.black,
        ),
        title: Text("Планировщик поступления"),
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
