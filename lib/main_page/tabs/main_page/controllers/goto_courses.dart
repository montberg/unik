import 'package:get/get.dart';
import 'package:unik/global_widgets/navigation_bar/controller/bottomNavigationBarController.dart';

class GotoUniversities {
    void execute(){
      //Get.to(NextScreen());

      final BottomNavigationBarController c = Get.find();
      c.changeTabIndex(1);
      print("перешли к универам");
    }
}