import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return Card(
      elevation: 10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Text(
                count.toString(),
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w800, fontSize: 23),
              ),
              SizedBox(
                child: CircularProgressIndicator(
                  value: (count / 300 <= 1) ? count / 300 : 1,
                  strokeWidth: 10,
                  color: Colors.blue,
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
                        fontWeight: FontWeight.w700, fontSize: 16)))
                .toList(),
          )
        ],
      ),
    );
  }
}
