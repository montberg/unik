import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'SpecialityTile.dart';

class SpecialitiesPage extends StatelessWidget {
  const SpecialitiesPage({Key? key, required this.specialities}) : super(key: key);
  final List<int> specialities;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: BackButton(color: Colors.black), title: Text("Список специальностей", style: GoogleFonts.montserrat(fontWeight: FontWeight.w700, fontSize: 19) ,),),
      body: ListView.separated(itemBuilder: (context, index)=>SpecialityTile.byId(specialities[index]), separatorBuilder: (context, index) => SizedBox(height: 3,), itemCount: specialities.length),
    );
  }
}
