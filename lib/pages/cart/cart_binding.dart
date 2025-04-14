import 'package:get/get.dart';
import 'package:saporidiitalia/pages/cart/cart_controller.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CartController());
  }
}
