import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/bottomNavigationBarController.dart';

class BottomNavBar extends StatelessWidget{
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBarController c = Get.find();
    return Obx(() => BottomNavigationBar(
      onTap: c.changeTabIndex,
      currentIndex: c.tabIndex.value,
      unselectedItemColor: c.color.value.withOpacity(0.5),
      selectedItemColor: c.color.value,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      unselectedLabelStyle: Get.textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w400, fontSize: 10),
      selectedLabelStyle: Get.textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w400, fontSize: 12),
      items: [
        BottomNavigationBarItem(
          icon: Container(
            margin: const EdgeInsets.only(bottom: 7),
            child: const Icon(
              Icons.home,
              size: 30.0,
            ),
          ),
          label: 'Главная',
        ),
        BottomNavigationBarItem(
          icon: Container(
            margin: const EdgeInsets.only(bottom: 7),
            child: const Icon(
              Icons.search,
              size: 30.0,
            ),
          ),
          label: 'ВУЗы/ССУЗы',
        ),
        BottomNavigationBarItem(
          icon: Container(
            margin: const EdgeInsets.only(bottom: 7),
            child: const Icon(
              Icons.location_history,
              size: 30.0,
            ),
          ),
          label: 'Помощник',
        ),
        BottomNavigationBarItem(
          icon: Container(
            margin: const EdgeInsets.only(bottom: 7),
            child: const Icon(
              Icons.settings,
              size: 30.0,
            ),
          ),
          label: 'Профиль',
        ),
      ],
    ));

  }

}

