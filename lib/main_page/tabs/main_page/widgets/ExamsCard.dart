import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unik/main_page/tabs/universities/widgets/UniversitiesPage.dart';

import '../../universities/interfaces/IUniversityListLoader.dart';

Color generateRandomPastelColor() {
  Random random = Random();
  int r = 128 + random.nextInt(128);
  int g = 128 + random.nextInt(128);
  int b = 128 + random.nextInt(128);
  return Color.fromARGB(255, r, g, b);
}
Color invertColor(Color color) {
  return Color.fromARGB(
    color.alpha,
    255 - color.red,
    255 - color.green,
    255 - color.blue,
  );
}
Color getTextColorForBackground(Color backgroundColor) {
  double brightness = backgroundColor.computeLuminance();
  return brightness < 0.5 ? Colors.white : Colors.black;
}

class ExamsCard extends StatelessWidget {
  const ExamsCard(
      {Key? key, required this.exams, required this.points, this.dop})
      : super(key: key);
  final List<String> exams;
  final List<int> points;
  final int? dop;
  @override
  Widget build(BuildContext context) {
    int count = 0;
    for (int i in points) {
      count = count + i;
    }
    if (dop != null) {
      count = count + dop!;
    }
    var backgroundColor = generateRandomPastelColor();
    var textColor = getTextColorForBackground(backgroundColor);
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Material(
        color: backgroundColor,
        elevation: 10,
        child: InkWell(
          onTap: (){
            Map<String, int> results = {};
            for (int i = 0; i < exams.length; i++) {
              results[exams[i]] = points[i];
            }
            Filter filter = Filter(points: results);
            Get.to(()=>UniversitiesPage(filter: filter));
          },
          child: Card(
            elevation: 0,
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Text(
                      count.toString(),
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w800, fontSize: 23, color: textColor),
                    ),
                    SizedBox(
                      child: CircularProgressIndicator(
                        value: (count / 300 <= 1) ? count / 300 : 1,
                        strokeWidth: 10,
                        color: textColor,
                      ),
                      width: 80,
                      height: 80,
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: exams
                      .map((e) => Text(e,
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w700, fontSize: 16, color: textColor)))
                      .toList(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
