import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ExamsCard.dart';

class ExamCalculator extends StatefulWidget {
  const ExamCalculator({Key? key}) : super(key: key);

  @override
  State<ExamCalculator> createState() => _ExamCalculatorState();
}
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
class _ExamCalculatorState extends State<ExamCalculator> {
  Future<List<int?>?> _loadPickedExams() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var list = prefs.getStringList("examMarks");

    if (list != null) {
      var output = list.map((e) => int.tryParse(e)).toList();
      return output;
    }
    return null;
  }

  late Future<List<int?>?> _pickedExamsList;
  @override
  void initState() {
    _pickedExamsList = _loadPickedExams();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Калькулятор экзаменов",
            style: GoogleFonts.montserrat(
                fontSize: 19,
                fontWeight: FontWeight.w800,
                color: Colors.black)),
        centerTitle: true,
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: FutureBuilder(
          future: _pickedExamsList,
          builder: (context, AsyncSnapshot<List<int?>?> snapshot) {
            print(snapshot.data);
            return snapshot.hasData
                ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _ExamCalculator(points: snapshot.data!, exams: examNameList, dop: snapshot.data?.last,),
                )
                : _ExamsPicker();
          }),
    );
  }
}

class _ExamCalculator extends StatelessWidget {
  const _ExamCalculator({Key? key, required this.points, required this.exams, required this.dop}) : super(key: key);
  final int? dop;
  final List<int?> points;
  final List<String> exams;
  @override
  Widget build(BuildContext context) {
    List<List<int>> result = [];
    List<List<String>> examsNames = [];
    for (int i = 2; i < points.length-1; i++) {
      if (points[i] != null) {
        result.add([points[0] ?? 0, points[1]??0, points[i]??0]);
        examsNames.add([exams[0], exams[1], exams[i]]);
      }
    }
    return Scaffold(
      body: GridView.builder(itemBuilder: (context, index) {
        return ExamsCard(exams: examsNames[index], points: result[index], dop: dop);
      },
      itemCount: result.length, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blue,
        onPressed: () async {
          await _clearPointsData().then((value) {
            Get.back();
            Get.to(() => const ExamCalculator());
          });
        },
        label: Text("Удалить баллы"),
        icon: Icon(Icons.delete),
      ),
    );
  }

  Future<void> _clearPointsData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("examMarks");
  }
}

class _ExamsPicker extends StatelessWidget {
  _ExamsPicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController russkiyyazik = TextEditingController();
    TextEditingController math = TextEditingController();
    TextEditingController obshestvoznanie = TextEditingController();
    TextEditingController istoria = TextEditingController();
    TextEditingController himiya = TextEditingController();
    TextEditingController fizika = TextEditingController();
    TextEditingController informatica = TextEditingController();
    TextEditingController biologia = TextEditingController();
    TextEditingController geographia = TextEditingController();
    TextEditingController inostranniyyazik = TextEditingController();
    TextEditingController individualniedostijenia = TextEditingController();
    List<TextEditingController> controllers = [
      russkiyyazik,
      math,
      obshestvoznanie,
      istoria,
      himiya,
      fizika,
      informatica,
      biologia,
      geographia,
      inostranniyyazik,
      individualniedostijenia
    ];
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 78,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(
              left: 16.0, right: 16.0, bottom: 16.0, top: 5),
          child: TextButton(
            style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 30),
            onPressed: () {
              var counter = 0;
              for (int i = 0; i < controllers.length - 1; i++) {
                if (controllers[i].text.isNotEmpty) counter++;
              }
              if(controllers[0].text.isEmpty || controllers[1].text.isEmpty ){
                Get.snackbar(
                  "Ошибка",
                  "Русский язык и математика обязательны для заполнения",
                  isDismissible: true,
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.red,
                );
              }
              if (counter >= 3) {
                try {
                  _writePointsToSharedPrefs(controllers).then((value) {
                    Get.back();
                    Get.to(() => const ExamCalculator());
                  });
                } on Exception catch (e, s) {
                  Get.snackbar(
                    "Ошибка",
                    s.toString(),
                    isDismissible: true,
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.red,
                  );
                  if (kDebugMode) {
                    print(s);
                  }
                }
              } else {
                Get.snackbar(
                  "Ошибка",
                  "Как минимум три поля должны быть заполнены",
                  //icon: Icon(Icons.person, color: Colors.white),
                  //padding: EdgeInsets.all(16),
                  isDismissible: true,
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.red,
                );
              }
            },
            child: Text(
              "Продолжить",
              style: GoogleFonts.montserrat(fontSize: 20),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controllers.length,
                itemBuilder: (context, index) {
                  var isReadOnly = false;
                  var type = TextInputAction.next;
                  var visible = false;
                  if (index == controllers.length - 2) {
                    visible = true;
                  }
                  if (index == controllers.length - 1) {
                    type = TextInputAction.done;
                    visible = false;
                  }
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 16.0, right: 16.0, top: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(examNameList[index],
                                style: GoogleFonts.montserrat(fontSize: 19)),
                            SizedBox(
                              width: 60,
                              height: 30,
                              child: TextField(
                                readOnly: isReadOnly,
                                onChanged: (text) {
                                  if (index == controllers.length) return;
                                  if (int.tryParse(text)! > 100) {
                                    controllers[index].text = '100';
                                    controllers[index].selection =
                                        TextSelection.fromPosition(TextPosition(
                                            offset: controllers[index]
                                                .text
                                                .length));
                                  }
                                  _getPoints(controllers);
                                },
                                controller: controllers[index],
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(3),
                                ],
                                keyboardType: TextInputType.number,
                                textInputAction: type,
                                textAlignVertical: TextAlignVertical.center,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Visibility(
                          child: SizedBox(
                            height: 10,
                          ),
                          visible: visible,
                        ),
                        Visibility(
                          child: const Divider(
                            thickness: 2,
                          ),
                          visible: visible,
                        ),
                      ],
                    ),
                  );
                }),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("ИТОГО",
                      style: GoogleFonts.montserrat(
                          fontSize: 23, fontWeight: FontWeight.w800)),
                  Obx(() => Text(counter.value.toString(),
                      style: GoogleFonts.montserrat(
                          fontSize: 23, fontWeight: FontWeight.w800))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  var counter = 0.obs;
  void _getPoints(List<TextEditingController> controllers) {
    counter.value = 0;
    for (TextEditingController controller in controllers) {
      if (controller.text.isNotEmpty) {
        counter.value = counter.value + int.parse(controller.text);
      }
    }
  }

  Future<void> _writePointsToSharedPrefs(
      List<TextEditingController> list) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var listOfStrings = list.map((e) => e.text).toList();
    prefs.setStringList("examMarks", listOfStrings);
  }
}
