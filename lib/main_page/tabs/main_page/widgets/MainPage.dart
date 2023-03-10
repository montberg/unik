import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:auto_size_text/auto_size_text.dart';


import '../../../../global_widgets/button.dart';
import '../../../../global_widgets/userInfo.dart';
import '../controllers/goto_carier_guidance.dart';
import '../controllers/goto_courses.dart';
import '../controllers/goto_exam_calculator.dart';
import '../controllers/goto_planning.dart';
import '../controllers/goto_tutors.dart';

class MainPageWidget extends StatelessWidget {
  const MainPageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gotoCarrierGuidance = GotoCarierGuidance();
    final gotoCourses = GotoCourses();
    final gotoExamCalculator = GotoExamCalculator();
    final gotoPlanning = GotoPlanning();
    final gotoTutors = GotoTutors();
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            height: 150,
            child: UserInfo(),
          ),
          const Divider(
            thickness: 1,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  children: [
                    Button(
                      onPressed: () => gotoCarrierGuidance.execute(),
                      isChevronBlack: true,
                      child: AutoSizeText("ТЕСТ НА ПРОФОРИЕНТАЦИЮ"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Button(
                      onPressed: () => gotoPlanning.execute(),
                      isChevronBlack: true,
                      child: AutoSizeText("ПЛАНИРОВЩИК ПОСТУПЛЕНИЯ"),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Button(
                      onPressed: () => gotoExamCalculator.execute(),
                      isChevronBlack: true,
                      child: AutoSizeText.rich(
                        TextSpan(children: [
                          TextSpan(
                              text: "КАЛЬКУЛЯТОР ЕГЭ"),
                        ]),
                        textAlign: TextAlign.justify,
                        maxLines: 1,
                        minFontSize: 0,
                      ),
                    ),
                    // ignore: prefer_const_constructors
                    SizedBox(height: 10),
                    Button(
                      onPressed: () => gotoTutors.execute(),
                      isChevronBlack: true,
                      child: AutoSizeText("ПОДГОТОВКА К ЕГЭ/ОГЭ"),
                    ),
                  ],
                ),
                Button(
                  onPressed: () => gotoCourses.execute(),
                  isChevronBlack: true,
                  child: AutoSizeText.rich(
                    TextSpan(children: [
                      TextSpan(
                          text: "СПИСОК УНИВЕРСИТЕТОВ"),
                    ]),
                    textAlign: TextAlign.justify,
                    maxLines: 1,
                    minFontSize: 0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
