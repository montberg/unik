import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key}) : super(key: key);
  //final String name;
  //final String status;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.account_circle,
          size: 100,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AutoSizeText("Дарья Сергиенко"),
            SizedBox(height: 10,),
            AutoSizeText("Статус: абитуриент"),
          ],
        ),
      ],
    );
  }
}
