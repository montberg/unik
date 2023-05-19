import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:crypto/crypto.dart';

import '../User.dart';


class AuthController{


  static String _encryptPassword(String password) {
    var bytes = utf8.encode(password); // data being hashed
    var digest = sha256.convert(bytes);
    return digest.toString();
  }

  static void logout() async {
    AndroidOptions _getAndroidOptions() => const AndroidOptions(
      encryptedSharedPreferences: true,
    );
    final storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
    //удаляем всё
    storage.deleteAll();
  }

  static void _saveDataToLocalStorage(String login, String password, User user) async {
    //получаем доступ к хранилищу
    AndroidOptions _getAndroidOptions() => const AndroidOptions(
      encryptedSharedPreferences: true,
    );
    final storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
    //запоминаем данные
    await storage.write(key: "login", value: login);
    await storage.write(key: "password", value: password);
  }

  static Future<User?> _tryLoginOnServer(String login, String encryptedPassword) async {
    await Future.delayed(Duration(seconds: 1));
    //успешный вход
    return User(0, 'Дарья Сергиенко', 'Абитуриент');
  }

  static Future<User?> loginInApp(String login, String password) async {
    //получаем данные с сервера
    var user = await _tryLoginOnServer(login, _encryptPassword(password));
    if (user != null) {
      _saveDataToLocalStorage(login, password, user);
      return user;
    } else {
      return null;
    }
  }

}