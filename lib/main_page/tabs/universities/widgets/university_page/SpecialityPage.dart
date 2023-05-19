import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unik/global_widgets/button.dart';

import '../../University.dart';

class SpecialityPage extends StatelessWidget {
  final Speciality speciality;

  const SpecialityPage({Key? key, required this.speciality}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: AutoSizeText("Специальность",
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
              Text(speciality.code,
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w800,
                      fontSize: 25,
                      color: Colors.black.withOpacity(0.5))),
              SizedBox(
                height: 10,
              ),
              Text(speciality.name,
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w800, fontSize: 25)),
              SizedBox(
                height: 20,
              ),
              // SizedBox(
              //   height: 20,
              // ),
              Text("Действия",
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w800,
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 20)),
              SizedBox(
                height: 20,
              ),
              Button(
                onPressed: (){
                 // Get.to();
                },
                child: AutoSizeText(
                  "Поиск по универам",
                  maxLines: 2,
                  style: GoogleFonts.montserrat(color: Colors.black),
                ),
                isChevronBlack: true,
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
              SizedBox(
                width: double.infinity,
                child: Card(
                    margin: EdgeInsets.zero,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        speciality.description,
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.montserrat(),
                      ),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              // Text("Цены",
              //     style: GoogleFonts.montserrat(
              //         fontWeight: FontWeight.w800,
              //         color: Colors.black.withOpacity(0.5),
              //         fontSize: 20)),
              // SizedBox(
              //   height: 20,
              // ),
              // Text(speciality.price.toString(),
              //     style: GoogleFonts.montserrat(
              //         fontWeight: FontWeight.w800,
              //         color: Colors.black.withOpacity(1),
              //         fontSize: 25)),
            ],
          ),
        ),
      ),
    );
  }
}
