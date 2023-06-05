
import 'package:get/get.dart';

import '../widgets/ExamCalculatorPage.dart';

class GotoExamCalculator {
    void execute(){
      Get.toNamed("/calculator");
      print("перешли на калькулятор экзаменов");
    }
}