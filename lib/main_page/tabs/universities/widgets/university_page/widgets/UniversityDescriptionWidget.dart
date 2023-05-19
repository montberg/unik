import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class UniversityDescriptionWidget extends StatelessWidget {
  final String? desc;
  const UniversityDescriptionWidget({Key? key, required this.desc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Описание университета",
        style: GoogleFonts.montserrat(
        fontWeight: FontWeight.w800,
        color: Colors.black.withOpacity(0.5),
        fontSize: 20),
        ),
        const SizedBox(
          height: 20,
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              desc ?? "Описание отсутствует",
              textAlign: TextAlign.justify,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 4,
          margin: EdgeInsets.zero,
        ),
      ],
    );
  }
}
