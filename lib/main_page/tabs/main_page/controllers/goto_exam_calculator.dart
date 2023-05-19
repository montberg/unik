
import 'package:get/get.dart';

import '../widgets/ExamCalculatorPage.dart';

class GotoExamCalculator {
    void execute(){
      Get.to(()=>ExamCalculator());
      print("перешли на калькулятор экзаменов");
    }
}