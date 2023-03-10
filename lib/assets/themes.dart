import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'color_const.dart';

class ThemeController extends GetxController {

  var icon = Icons.nightlight.obs;
  var isDarkMode = false.obs;
  changeTheme(){
    Get.changeTheme(Get.isDarkMode ? Themes.lightTheme : Themes.darkTheme);
    isDarkMode.value = Get.isDarkMode;
    icon.value = Get.isDarkMode ? Icons.nightlight : Icons.wb_sunny;
  }

}

class Themes {
  static final lightTheme = Get.theme.copyWith(
    textTheme: theme.apply(bodyColor: AppColors.textColorLight, displayColor: AppColors.textColorLight),
    appBarTheme: appBarThemeLight,
    textButtonTheme: btnThemeLight,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    canvasColor: AppColors.btnColorLight,
    iconTheme: iconThemeLight,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryLight,
      onPrimary: AppColors.onPrimaryLight,
      secondary: AppColors.secondaryLight,
      onSecondary: AppColors.onSecondaryLight,
    ),
  );

  static final darkTheme = Get.theme.copyWith(
      textTheme: theme.apply(bodyColor: AppColors.textColorDark, displayColor: AppColors.textColorDark, decorationColor: AppColors.textColorDark),
      textButtonTheme: btnThemeDark,
      appBarTheme: appBarThemeDark,
      iconTheme: iconThemeDark,
      scaffoldBackgroundColor: AppColors.backgroundDark,
      canvasColor: AppColors.btnColorDark,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primaryDark,
        secondary: AppColors.secondaryDark,
        onSecondary: AppColors.onSecondaryDark,
        background: AppColors.backgroundDark,
    ));

  static final iconThemeLight = Get.theme.iconTheme.copyWith(color: Colors.black);
  static final iconThemeDark = Get.theme.iconTheme.copyWith(color: Colors.white);

  static final btnThemeLight = TextButtonThemeData(
      style: TextButton.styleFrom(backgroundColor: AppColors.btnColorLight)
  );

  static final btnThemeDark = TextButtonThemeData(
      style: TextButton.styleFrom(backgroundColor: AppColors.btnColorDark)
  );

  static final appBarThemeLight = Get.theme.appBarTheme.copyWith(
      backgroundColor: AppColors.btnColorLight,
      centerTitle: true,
      titleTextStyle: Get.textTheme.headline2
  );
  static final appBarThemeDark = Get.theme.appBarTheme.copyWith(
      backgroundColor: AppColors.btnColorDark,
      centerTitle: true,
      titleTextStyle: Get.textTheme.button
  );
}

final TextTheme theme = Get.textTheme.copyWith(
  headline1: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w300),
  headline2: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w300),
  headline3: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w400),
  headline4: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w400),
  headline5: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w400),
  headline6: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 0.5), //button titles
  subtitle1: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w600),
  subtitle2: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w600, height: 2, letterSpacing: 0.5),
  bodyText1: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.w300, letterSpacing: 1.0),
  bodyText2: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.w300), //user info text
  button: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w800),
  caption: GoogleFonts.montserrat(fontSize: 13, fontWeight: FontWeight.w400),
  overline: GoogleFonts.montserrat(fontSize: 13, fontWeight: FontWeight.w400),
);
