import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main_page/main_scaffold.dart';
import 'assets/themes.dart';
void main() {
  runApp(
      GetMaterialApp(
        home: MainScaffold(),
        darkTheme: Themes.darkTheme,
        theme: Themes.lightTheme,
        themeMode: ThemeMode.system,
        //debugShowMaterialGrid: false,
      )
  );
}