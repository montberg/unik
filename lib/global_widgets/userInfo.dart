import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unik/auth_page/User.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key, required this.user}) : super(key: key);
  final User user;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.person, size: 120),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AutoSizeText("Привет, ${user.name.split(" ")[0]}!", style: GoogleFonts.montserrat(fontSize: 20),),
            //SizedBox(height: 10,),
            //AutoSizeText("Статус: ${user.status}"),
          ],
        ),
      ],
    );
  }
}
