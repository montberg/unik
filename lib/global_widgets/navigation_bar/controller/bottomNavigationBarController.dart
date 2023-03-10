import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationBarController extends GetxController {
  var tabIndex = 0.obs;
  Rx<Color> color = (Get.isDarkMode ? Colors.white : Colors.black).obs;
  //var color = Get.theme.colorScheme.onPrimary.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  void changeColor(){
    color.value = Get.isDarkMode ? Colors.black : Colors.white;
  }
}