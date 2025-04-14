import 'package:get/get.dart';

class DetailController extends GetxController {
  var params = Get.arguments;
  var data;

  @override
  void onInit() {
    if (params != null) {
      data = params["data"];
    }
    super.onInit();
  }
}
