import 'package:get/get.dart';
import 'package:unik/main_page/tabs/main_page/widgets/PlanningPage.dart';

class GotoPlanning {
  void execute(){
    Get.to(PlanningPage());
    print("перешли к планировщику");
  }
}