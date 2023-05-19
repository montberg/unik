import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unik/auth_page/registration_page/widgets/RegistrationPage.dart';
import '../../main_page/main_scaffold.dart';
import '../User.dart';
import '../login_page/widgets/LoginPage.dart';

Rx<Widget> currentWidget = (LoginPage() as Widget).obs;
var currwa = 1.obs;
var str = "Регистрация".obs;
var str2 = "Нет аккаунта? ".obs;

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}
final visible = true.obs;
class VisibilityController extends GetxController{

  void makeVisible(){
    print("made visible");
    visible.value = true;
  }
  void makeInvisible(){
    print("made invisible");
    visible.value = false;
  }
}

class _AuthPageState extends State<AuthPage> {
  @override
  void initState() {
    VisibilityController().makeInvisible();
    super.initState();
  }

  @override
  void dispose() {
    VisibilityController().dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    print("buildStarted");
    VisibilityController().makeInvisible();

    return Scaffold(
            body: Center(
              child: Stack(
                children: [
                  Obx(
                    () => AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      child: currentWidget.value,
                    ),
                  ),
                  Obx(
                    () => Align(
                      child: Padding(
                        padding: const EdgeInsets.all(50.0),
                        child: Text.rich(TextSpan(children: [
                          TextSpan(
                            text: str2.value,
                            style: GoogleFonts.montserrat(fontSize: 16),
                          ),
                          TextSpan(
                            style: GoogleFonts.montserrat(
                                decoration: TextDecoration.underline,
                                fontSize: 16),
                            text: str.value,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                if (currwa.value == 2) {
                                  print("переход на логин");
                                  currwa.value = 1;
                                  currentWidget.value = LoginPage();
                                  str.value = "Регистрация";
                                  str2.value = "Нет аккаунта? ";
                                } else if (currwa == 1) {
                                  currwa.value = 2;
                                  print("переход на регистрацию");
                                  currentWidget.value = RegistrationPage();
                                  str.value = "Вход";
                                  str2.value = "Уже есть аккаунт? ";
                                }
                              },
                          ),
                        ])),
                      ),
                      alignment: Alignment.bottomCenter,
                    ),
                  ),
                  Obx(()=>Visibility(
                    visible: visible.value,
                    child: Stack(alignment: Alignment.center, children: [
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: Colors.black.withOpacity(0.7),
                      ),
                      const SizedBox(
                        width: 150,
                        height: 150,
                        child: Card(
                          child: Center(child: CircularProgressIndicator()),
                        ),
                      )
                    ]),
                  )),
                ],
              ),
            ),
          );

  }
}
