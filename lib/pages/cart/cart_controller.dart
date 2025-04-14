import 'package:get/get.dart';
import 'package:saporidiitalia/data/product_data.dart';

class CartController extends GetxController {
  final RxList<Map<String, dynamic>> cartItems = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    addToCart(PRODUCTS.firstWhere((product) => product['id'] == '3'));
    addToCart(PRODUCTS.firstWhere((product) => product['id'] == '5'));
    addToCart(PRODUCTS.firstWhere((product) => product['id'] == '10'));

    if (cartItems.length > 1) {
      incrementQuantity(cartItems[1]['id']);
    }
  }

  void addToCart(Map<String, dynamic> product) {
    final existingIndex =
        cartItems.indexWhere((item) => item['id'] == product['id']);

    if (existingIndex != -1) {
      incrementQuantity(product['id']);
    } else {
      final cartItem = {
        'id': product['id'],
        'title': product['title'],
        'price': double.parse(product['price']),
        'quantity': 1,
        'image': product['image'],
      };
      cartItems.add(cartItem);
    }
  }

  double get subtotal {
    return cartItems.fold(
        0, (sum, item) => sum + (item['price'] * item['quantity']));
  }

  final deliveryFee = 2.99;

  double get total {
    return subtotal + deliveryFee;
  }

  void incrementQuantity(String id) {
    final index = cartItems.indexWhere((item) => item['id'] == id);
    if (index != -1) {
      cartItems[index]['quantity']++;
      cartItems.refresh();
    }
  }

  void decrementQuantity(String id) {
    final index = cartItems.indexWhere((item) => item['id'] == id);
    if (index != -1 && cartItems[index]['quantity'] > 1) {
      cartItems[index]['quantity']--;
      cartItems.refresh();
    }
  }

  void removeItem(String id) {
    cartItems.removeWhere((item) => item['id'] == id);
  }

  void clearCart() {
    cartItems.clear();
  }

  void checkout() {
    Get.snackbar(
      'Checkout',
      'Checkout Functionality...',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
