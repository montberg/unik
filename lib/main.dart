import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:unik/auth_page/splash_screen/SplashScreen.dart';
import 'assets/themes.dart';
import 'main_page/tabs/main_page/widgets/ExamCalculatorPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  Get.put(ThemeController());
  runApp(GetMaterialApp(
    getPages: [
      GetPage(name: '/calculator', page: ()=>const ExamCalculator())
    ],
      home: SplashScreen(),
      theme: ThemeController.getLightTheme,
      darkTheme: ThemeController.getDarkTheme),
  );
}
