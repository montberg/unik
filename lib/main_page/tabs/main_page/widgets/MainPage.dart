import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../auth_page/User.dart';
import '../../../../global_widgets/button.dart';
import '../../../../global_widgets/userInfo.dart';
import '../../../widgets/ColouredCard.dart';
import '../controllers/goto_carrier_guidance.dart';
import '../controllers/goto_courses.dart';
import '../controllers/goto_exam_calculator.dart';
import '../controllers/goto_planning.dart';
import '../controllers/goto_tutors.dart';

class MainPageWidget extends StatelessWidget {
  final User user;

  const MainPageWidget({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gotoCarrierGuidance = GotoCarrierGuidance();
    final gotoUniversities = GotoUniversities();
    final gotoExamCalculator = GotoExamCalculator();
    final gotoPlanning = GotoPlanning();
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: 150,
            child: UserInfo(user: user),
          ),
          const Divider(
            thickness: 1,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  children: [
                    Expanded(
                        child: ColouredCard(
                      icon: Icons.text_snippet_outlined,
                      text: 'тесты',
                      color: Color(0xff8c74d4),
                      onTap: () => gotoCarrierGuidance.execute(),
                    )),
                    SizedBox(width: 8),
                    Expanded(
                        child: ColouredCard(
                      icon: Icons.schedule,
                      onTap: () => gotoPlanning.execute(),
                      text: 'планировщик поступления',
                      color: Color(0xff00bfff),
                    )),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: ColouredCard(
                          height: 120,
                      iconSize: 90,
                      iconAlign: Alignment.centerRight,
                      iconPadding: EdgeInsets.only(right: 10),
                      icon: Icons.calculate_outlined,
                      onTap: () => gotoExamCalculator.execute(),
                      text: 'калькулятор ЕГЭ',
                      color: Color(0xff00ced1),
                    )),
                    //SizedBox(width: 8),
                    //Expanded(
                    //    child: ColouredCard(
                    //  icon: Icons.person_rounded,
                    //  onTap: () => gotoTutors.execute(),
                    //  text: 'репетиторы',
                    //  color: Color(0xffffa07a),
                    //)),
                  ],
                ),
                ColouredCard(
                    onTap: () => gotoUniversities.execute(),
                    icon: Icons.account_balance,
                    text: 'список \nуниверситетов',
                    color: Colors.teal,
                    height: 120,
                    iconSize: 80,
                    iconPadding: EdgeInsets.only(right: 10),
                    iconAlign: Alignment.centerRight)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
