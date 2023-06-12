import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unik/auth_page/controllers/AuthController.dart';
import 'package:unik/main_page/main_scaffold.dart';
import '../../User.dart';
import '../../widgets/AuthPage.dart';

final _formKey = GlobalKey<FormState>();

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var loginTextController = TextEditingController();
  var passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: SizedBox(
            width: 300,
            height: 350,
            child: Card(
              elevation: 20,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "ВХОД",
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w800, fontSize: 22),
                    ),
                    TextFormField(
                      controller: loginTextController,
                      decoration: InputDecoration(
                          hintText: "Логин",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                      style: GoogleFonts.montserrat(
                          fontSize: 19, fontWeight: FontWeight.w500),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Поле не может быть пустым";
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                    ),
                    TextFormField(
                      controller: passwordTextController,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Пароль",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                      style: GoogleFonts.montserrat(
                          fontSize: 19, fontWeight: FontWeight.w500),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Поле не может быть пустым";
                        }
                        return null;
                      },
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        onPressed: () {
                          //if (_formKey.currentState!.validate()) {

                          //}
                          if (mounted) {
                            VisibilityController().makeVisible();
                            Future<User?> user = AuthController.loginInApp(
                                loginTextController.text,
                                passwordTextController.text);
                            user.then((value) {
                              if (value == null) return;
                              Get.off(() => MainScaffold(user: value));
                            });
                            //VisibilityController().makeInvisible();
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.transparent),
                          child: Center(
                              child: Text(
                            "ВОЙТИ",
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w800, fontSize: 22),
                          )),
                          width: double.infinity,
                          height: 50,
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
