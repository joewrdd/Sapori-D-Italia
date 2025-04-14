import 'package:get/get.dart';
import 'package:saporidiitalia/pages/home/home_controller.dart';

class SeeAllBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
