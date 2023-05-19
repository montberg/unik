import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:unik/auth_page/controllers/AuthController.dart';
import 'package:unik/auth_page/widgets/AuthPage.dart';
import 'package:unik/main_page/main_scaffold.dart';
import 'package:unik/main_page/tabs/main_page/widgets/MainPage.dart';

import '../../assets/themes.dart';
import '../User.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("lib/assets/images/splash.png"),
              fit: BoxFit.fitWidth),
        ),
      ),
    );
  }

  void startTimer() {
    Timer(const Duration(seconds: 2), () {
      navigateUser(); //It will redirect  after 3 seconds
    });
  }

  void navigateUser() async {
    AndroidOptions _getAndroidOptions() => const AndroidOptions(
      encryptedSharedPreferences: true,
    );
    final storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
    var login = await storage.read(key: "login");
    var password = await storage.read(key: "password");
    if(login!=null && password !=null){
      User? userinfo = await AuthController.loginInApp(login, password);
      if(userinfo!=null){
        Get.off(()=>MainScaffold(user: userinfo));
      }
    }else {
      Get.off(()=>const AuthPage());
    }

  }
}