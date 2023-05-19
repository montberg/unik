import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

final _formKey = GlobalKey<FormState>();
final _loginController = TextEditingController();
final _password1 = TextEditingController();
final _password2 = TextEditingController();
class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: SizedBox(
            width: 300,
            height: 430,
            child: Card(
              elevation: 20,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "РЕГИСТРАЦИЯ",
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w800, fontSize: 22),
                    ),
                    TextFormField(
                      controller: _loginController,
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
                      controller: _password1,
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
                        if(value.isNotEmpty && _password1.text != _password2.text) return "Пароли должны совпадать";
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                    ),
                    TextFormField(
                      controller: _password2,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Повторите пароль",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                      style: GoogleFonts.montserrat(
                          fontSize: 19, fontWeight: FontWeight.w500),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Поле не может быть пустым";
                        }
                        if(value.isNotEmpty && _password1.text != _password2.text) return "Пароли должны совпадать";
                        return null;
                      },
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _loginController.clear();
                            _password1.clear();
                            _password2.clear();
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.transparent),
                          child: Center(
                              child: AutoSizeText(
                            "ЗАРЕГЕСТРИРОВАТЬСЯ",
                            minFontSize: 0,
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w800, fontSize: 15),
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
