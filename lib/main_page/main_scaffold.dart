import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:unik/auth_page/User.dart';

import '../assets/themes.dart';

import '../global_widgets/navigation_bar/controller/bottomNavigationBarController.dart';
import '../global_widgets/navigation_bar/widgets/bottomNavigationBar.dart';
import 'tabs/main_page/widgets/MainPage.dart';
import 'tabs/profile_page/widgets/ProfilePage.dart';
import 'tabs/universities/interfaces/IUniversityListLoader.dart';
import 'tabs/universities/widgets/UniversitiesPage.dart';


class MainScaffold extends StatelessWidget {
  final c = Get.put(ThemeController());
  final BottomNavigationBarController landingPageController =
      Get.put(BottomNavigationBarController(), permanent: false);
  final User user;

  MainScaffold({Key? key, required this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(

     // floatingActionButton: FloatingActionButton(
     //   child: Obx(() => Icon(c.icon.value)),
     //   onPressed: () {
     //     c.changeTheme();
     //     BottomNavigationBarController w = Get.find();
     //     w.changeColor();
     //   },
     // ),
      backgroundColor: Color(0xfff0efef),
      bottomNavigationBar:
          const BottomNavBar(),
      body: Obx(() => SafeArea(
        top: true,
        child: IndexedStack(
          index: landingPageController.tabIndex.value,
          children: [
            MainPageWidget(user: user),
            UniversitiesPage(filter: Filter()),
            ProfilePageWidget(user: user),
          ]
        ),
      ))
    );
  }
}
