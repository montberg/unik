import 'package:get/get.dart';
import 'package:unik/auth_page/controllers/AuthController.dart';
import '../../../../auth_page/widgets/AuthPage.dart';

class GotoSettings {
  void execute() async {
    AuthController.logout();
    Get.offAll(() => const AuthPage());
  }
}
