import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../assets/themes.dart';

import '../global_widgets/navigation_bar/controller/bottomNavigationBarController.dart';
import '../global_widgets/navigation_bar/widgets/bottomNavigationBar.dart';
import 'tabs/main_page/widgets/MainPage.dart';
import 'tabs/profile_page/widgets/ProfilePage.dart';
import 'tabs/universities/widgets/UniversitiesPage.dart';





class MainScaffold extends StatelessWidget {
  var c = Get.put(ThemeController());
  final BottomNavigationBarController landingPageController =
      Get.put(BottomNavigationBarController(), permanent: false);
  MainScaffold({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Obx(() => Icon(c.icon.value)),
          onPressed: () {
            c.changeTheme();
            BottomNavigationBarController w = Get.find();
            w.changeColor();
          },
        ),
        bottomNavigationBar:
            const BottomNavBar(),
        body: Obx(() => IndexedStack(
          index: landingPageController.tabIndex.value,
          children: [
            MainPageWidget(),
            UniversitiesPage(),
            Placeholder(),
            ProfilePageWidget(),
          ],
        )),
      ),
    );
  }
}
