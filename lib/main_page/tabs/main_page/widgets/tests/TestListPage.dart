import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unik/main_page/tabs/main_page/widgets/tests/TestPage.dart';

import '../../../../../global_widgets/button.dart';

class TestListPage extends StatelessWidget {
  const TestListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: BackButton(color: Colors.black,), title: Text("Тестирование", style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w700),),),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(
                  "Тесты профориентации помогут Вам определить ваши таланты и профессиональные склонности и выбрать подходящий университет и факультет.",
                  style: GoogleFonts.montserrat(
                      fontSize: 20, fontWeight: FontWeight.w400),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 20,),
                Button(
                  isChevronBlack: true,
                  child: AutoSizeText(
                    "Опросник профессиональных склонностей Л.Йовайши",
                    style: GoogleFonts.montserrat(
                        color: Colors.black, fontWeight: FontWeight.w700),
                    maxLines: 2,
                  ),
                  onPressed: () {
                    Get.to(TestDescription());
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
