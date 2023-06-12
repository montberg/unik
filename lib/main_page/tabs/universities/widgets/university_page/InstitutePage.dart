import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unik/main_page/tabs/universities/controllers/FakeSpecialityListLoader.dart';
import 'package:unik/main_page/tabs/universities/widgets/university_page/SpecialityTile.dart';

import '../../University.dart';
import 'widgets/UniversityContactInfoWidget.dart';

class InstitutePage extends StatelessWidget {
  final Institute institute;
  final String universityName;
  final int universityId;
  const InstitutePage(
      {Key? key, required this.institute, required this.universityName, required this.universityId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: AutoSizeText("Институт",
            style: GoogleFonts.montserrat(
                fontSize: 24, fontWeight: FontWeight.w800, color: Colors.white),
            maxLines: 1),
        leading: BackButton(),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(institute.name,
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w800, fontSize: 25)),
              SizedBox(
                height: 30,
              ),
              UniversityContactInfoWidget(
                contactInfo: institute.instituteContacts,
              ),
              SizedBox(
                height: 20,
              ),
              Text("Список специальностей",
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w800,
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 20)),
              SizedBox(
                height: 20,
              ),
              ListView.separated(
                itemBuilder: (context, index) {
                  return SpecialityTile.bySpeciality(institute.specialities[index], universityId);
                },
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: institute.specialities.length,
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                  height: 7,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text("Описание",
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w800,
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 20)),
              SizedBox(
                height: 20,
              ),
              Card(
                  margin: EdgeInsets.zero,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      institute.description,
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.montserrat(),
                    ),
                  )),
              SizedBox(height: 30),
              Align(
                child: AutoSizeText(
                  universityName,
                  maxLines: 2,
                  maxFontSize: 16,
                  minFontSize: 11,
                  style: GoogleFonts.montserrat(
                      color: Colors.black.withOpacity(0.5),
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                alignment: Alignment.center,
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.center,
                child: Text(
                  '2023',
                  style: GoogleFonts.montserrat(
                    fontSize: 15,
                      color: Colors.black.withOpacity(0.5),
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
