import 'package:get/get.dart';
import 'package:saporidiitalia/pages/profile/profile_controller.dart';
import 'package:saporidiitalia/pages/home/home_controller.dart';

class RootController extends GetxController {
  var tabIndex = 0.obs;
  List tabs = [];

  onRender() {
    tabs = [
      "assets/icons/home.svg", // Tab 0: Home Tab
      "assets/icons/account.svg", // Tab 1: Profile/Account Tab
    ];
  }

  @override
  void onInit() {
    onRender();

    if (!Get.isRegistered<HomeController>()) {
      Get.put(HomeController());
    }

    if (!Get.isRegistered<ProfileController>()) {
      Get.put(ProfileController());
    }

    super.onInit();
  }
}
