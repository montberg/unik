import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unik/auth_page/splash_screen/SplashScreen.dart';
import 'assets/themes.dart';
void main() {
  Get.put(ThemeController());
  runApp(GetMaterialApp(home: SplashScreen(), theme: ThemeController.getLightTheme, darkTheme: ThemeController.getDarkTheme));
}