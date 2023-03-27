import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UniversityDescriptionWidget extends StatelessWidget {
  final String? desc;
  const UniversityDescriptionWidget({Key? key, required this.desc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Описание университета",
          style: Get.textTheme.button!
              .copyWith(color: Color(0x333333).withOpacity(0.7), fontSize: 19),
        ),
        SizedBox(
          height: 20,
        ),
        Text(desc ?? "Описание отсутствует", textAlign: TextAlign.justify, style: TextStyle(fontWeight: FontWeight.w700),),
      ],
    );
  }
}
