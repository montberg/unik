import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unik/global_widgets/button.dart';

import '../../../University.dart';
import '../InstitutePage.dart';

class InstitutesListBuilder extends StatelessWidget {
  final List<Institute>? institutes;

  final String universityName;

  final int universityId;
  const InstitutesListBuilder({Key? key, required this.institutes, required this.universityName, required this.universityId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(universityId);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Text("Институты и направления",
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w800,
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 20)),
        ),
        const SizedBox(
          height: 20,
        ),
        institutes != null ? _buildSpecialities(institutes, universityName, universityId) : const SizedBox()
      ],
    );
  }

  Column _buildSpecialities(List<Institute>? institutes, String universityName, int universityId) {
    List<Widget> _instituteWidgetList = [];
    if(institutes==null) return Column(children: []);
    for (int i = 0; i < institutes.length; i++) {
      _instituteWidgetList.add(Button(
        isChevronBlack: true,
        child: AutoSizeText(institutes[i].name.toString(),
            softWrap: true, maxLines: 2, minFontSize: 0),
        onPressed: () {
          if (kDebugMode) {
            print(institutes[i].name);
          }
          _goToInstitutePage(institutes[i], universityName, universityId);
        },
      ));
    }
    return Column(children: _instituteWidgetList);
  }

  void _goToInstitutePage(Institute institute, String universityName, int id) {
    Get.to(InstitutePage(institute: institute, universityName: universityName, universityId: id,));
  }
}


