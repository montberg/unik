import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultPanel extends StatefulWidget {
  final String title;
  final double percentage;
  final String description;

  const ResultPanel(
      {Key? key,
        required this.title,
        required this.percentage,
        required this.description})
      : super(key: key);

  @override
  _ResultPanelState createState() => _ResultPanelState();
}

class _ResultPanelState extends State<ResultPanel> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ExpansionTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Text(widget.title),
        leading: Stack(
          children: [
            CircularProgressIndicator(color: Colors.grey.withOpacity(0.5), strokeWidth: 12, value: 1),
            CircularProgressIndicator(color: Colors.blue, strokeWidth: 12, value: widget.percentage),
          ],
        ),
        onExpansionChanged: (bool expanded){
          setState(() {
          });
        },
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.description, style: GoogleFonts.montserrat(), textAlign: TextAlign.justify,),
          )
        ],
      ),
    );
  }
}
