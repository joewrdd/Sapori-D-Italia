import 'package:get/get.dart';
import 'package:saporidiitalia/pages/cart/cart_controller.dart';

class CheckoutController extends GetxController {
  final cartController = Get.find<CartController>();

  final RxString selectedPaymentMethod = 'Credit Card'.obs;

  final RxString selectedDeliveryOption = 'Standard'.obs;

  final RxMap<String, String> deliveryAddress = {
    'name': 'Joe Ward',
    'street': 'Street 33',
    'city': 'Koura',
    'state': '',
    'country': 'Lebanon',
    'zipCode': '',
    'phone': '+961 76000623',
  }.obs;

  double get deliveryCost {
    switch (selectedDeliveryOption.value) {
      case 'Express':
        return 4.99;
      case 'Next Day':
        return 7.99;
      case 'Standard':
      default:
        return 2.99;
    }
  }

  double get total {
    return cartController.subtotal + deliveryCost;
  }

  void selectPaymentMethod(String method) {
    selectedPaymentMethod.value = method;
  }

  void selectDeliveryOption(String option) {
    selectedDeliveryOption.value = option;
  }

  void updateAddress(Map<String, String> newAddress) {
    deliveryAddress.assignAll(newAddress);
  }

  void placeOrder() {
    Get.snackbar(
      'Order Placed',
      'Your order has been successfully placed!',
      snackPosition: SnackPosition.BOTTOM,
    );

    Get.offAllNamed('/root');

    cartController.clearCart();
  }
}
