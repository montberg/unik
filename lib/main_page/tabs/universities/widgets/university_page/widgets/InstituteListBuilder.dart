import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unik/global_widgets/button.dart';

import '../../../University.dart';

class InstitutesListBuilder extends StatelessWidget {
  final List<Institute> institutes;
  const InstitutesListBuilder({Key? key, required this.institutes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Text("Институты и направления",
              style: Get.textTheme.button!.copyWith(
                  color: const Color(0x333333).withOpacity(0.7), fontSize: 19)),
        ),
        const SizedBox(
          height: 20,
        ),
        _buildSpecialities(institutes),
      ],
    );
  }

  Column _buildSpecialities(List<Institute> institutes) {
    List<Widget> _instituteWidgetList = [];
    for (int i = 0; i < institutes.length; i++) {
      _instituteWidgetList.add(Button(
        isChevronBlack: true,
        child: AutoSizeText(institutes[i].name.toString(),
            softWrap: true, maxLines: 2, minFontSize: 0),
        onPressed: () {
          if (kDebugMode) {
            print(institutes[i].name);
          }
        },
      ));
    }
    return Column(children: _instituteWidgetList);
  }
}
