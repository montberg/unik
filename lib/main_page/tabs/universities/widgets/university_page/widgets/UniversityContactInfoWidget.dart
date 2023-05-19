import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unik/assets/color_const.dart';

import '../../../University.dart';

class UniversityContactInfoWidget extends StatelessWidget {

  Contacts contactInfo;
  UniversityContactInfoWidget({Key? key, required this.contactInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.zero,
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            ContactInfoBlockWidget(icon: Icons.place, title: "Адрес университета", subtitle: "г. ${contactInfo.city.toString()}, ул. ${contactInfo.address.toString()}"),
            SizedBox(height: 10,),
            ContactInfoBlockWidget(icon: Icons.phone, title: "Номер телефона", subtitle: contactInfo.phoneNumber),
            SizedBox(height: 10,),
            ContactInfoBlockWidget(icon: Icons.alternate_email, title: "Электронная почта", subtitle: contactInfo.emailAddress),
          ],
        ),
      ),
    );
  }
}

class ContactInfoBlockWidget extends StatelessWidget {
  IconData icon;
  String title;
  String subtitle;
  ContactInfoBlockWidget({Key? key, required this.icon, required this.title, required this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Get.theme.primaryColor,
                borderRadius: BorderRadius.circular(5)
              ),
            ),
            Icon(icon, color: AppColors.onPrimaryLight, size: 40,)
          ],
        ),
        SizedBox(width: 20,),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(title, minFontSize: 0, style: TextStyle(fontWeight: FontWeight.w600),),
              const SizedBox(height: 5),
              AutoSizeText(subtitle, minFontSize: 0, maxLines: 1, maxFontSize: 15, style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black.withOpacity(0.5)))
            ],
          ),
        )
      ],
    );
  }
}
