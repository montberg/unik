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

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.zero,
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        tileColor: Colors.white,
        title: AutoSizeText("$code $title",
            style: GoogleFonts.montserrat(fontSize: 17), maxLines: 3),
        subtitle: speciality==null ? null : Text("~${speciality?.price} руб.", style: GoogleFonts.montserrat(fontSize: 15)),
        onTap: () {
          if(speciality!=null) {
            Get.to(SpecialityPage(speciality: speciality!));
          }
        },
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
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
