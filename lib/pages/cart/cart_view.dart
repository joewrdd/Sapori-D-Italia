import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saporidiitalia/pages/cart/cart_controller.dart';
import 'package:saporidiitalia/routes/app_route_name.dart';
import 'package:saporidiitalia/utils/color.dart';

class CartView extends GetView<CartController> {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'My Cart',
          style: GoogleFonts.italiana(
            textStyle: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: black,
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: black),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline, color: black),
            onPressed: controller.clearCart,
          ),
        ],
      ),
      body: Obx(() {
        if (controller.cartItems.isEmpty) {
          return _buildEmptyCart();
        } else {
          return _buildCartItems();
        }
      }),
      bottomNavigationBar: Obx(() {
        if (controller.cartItems.isEmpty) {
          return const SizedBox.shrink();
        } else {
          return _buildCheckoutSection();
        }
      }),
    );
  }

  Widget _buildEmptyCart() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            size: 100,
            color: primary.withOpacity(0.3),
          ),
          const SizedBox(height: 20),
          Text(
            'Your Cart Is Empty',
            style: GoogleFonts.italiana(
              textStyle: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: black,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Looks like you haven\'t added any items to your cart yet.',
            textAlign: TextAlign.center,
            style: GoogleFonts.italiana(
              fontSize: 16,
              color: black.withOpacity(0.9),
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () => Get.toNamed('/home'),
            style: ElevatedButton.styleFrom(
              backgroundColor: primary,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text(
              'Explore Menu',
              style: GoogleFonts.italiana(
                textStyle: const TextStyle(
                  fontSize: 16,
                  color: white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartItems() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        ...controller.cartItems.map((item) => _buildCartItem(item)).toList(),
        const SizedBox(height: 20),
        _buildPromoCodeSection(),
        const SizedBox(height: 20),
        _buildOrderSummary(),
      ],
    );
  }

  Widget _buildCartItem(Map<String, dynamic> item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: black.withOpacity(0.05),
            offset: const Offset(0, 4),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage('assets/images/${item['image']}'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['title'],
                  style: GoogleFonts.italiana(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: black,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  '\$${item['price'].toStringAsFixed(2)}',
                  style: GoogleFonts.italiana(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              InkWell(
                onTap: () => controller.decrementQuantity(item['id']),
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.remove,
                    size: 16,
                    color: primary,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  '${item['quantity']}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: black,
                  ),
                ),
              ),
              InkWell(
                onTap: () => controller.incrementQuantity(item['id']),
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.add,
                    size: 16,
                    color: white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPromoCodeSection() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: secodPrimary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.discount_outlined,
            color: primary,
            size: 24,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              cursorColor: primary,
              decoration: InputDecoration(
                hintText: 'Enter Promo Code...',
                hintStyle: GoogleFonts.italiana(
                  color: black.withOpacity(0.9),
                  fontSize: 14,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Apply',
              style: GoogleFonts.italiana(
                textStyle: const TextStyle(
                  color: white,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderSummary() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: black.withOpacity(0.05),
            offset: const Offset(0, 4),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Order Summary',
            style: GoogleFonts.italiana(
              textStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: black,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Subtotal',
                style: GoogleFonts.italiana(
                  textStyle: TextStyle(
                    fontSize: 14,
                    color: black.withOpacity(0.7),
                  ),
                ),
              ),
              Text(
                '\$${controller.subtotal.toStringAsFixed(2)}',
                style: GoogleFonts.italiana(
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    color: black,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Delivery Fee',
                style: GoogleFonts.italiana(
                  textStyle: TextStyle(
                    fontSize: 14,
                    color: black.withOpacity(0.7),
                  ),
                ),
              ),
              Text(
                '\$${controller.deliveryFee.toStringAsFixed(2)}',
                style: GoogleFonts.italiana(
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    color: black,
                  ),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Divider(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: GoogleFonts.italiana(
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: black,
                  ),
                ),
              ),
              Text(
                '\$${controller.total.toStringAsFixed(2)}',
                style: GoogleFonts.italiana(
                  textStyle: const TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: primary,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCheckoutSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x29000000),
            offset: Offset(0, -3),
            blurRadius: 6,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total',
                  style: GoogleFonts.italiana(
                    textStyle: const TextStyle(
                      fontSize: 14,
                      color: black,
                    ),
                  ),
                ),
                Text(
                  '\$${controller.total.toStringAsFixed(2)}',
                  style: GoogleFonts.italiana(
                    textStyle: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: () => Get.toNamed(AppRouteName.checkout),
              style: ElevatedButton.styleFrom(
                backgroundColor: primary,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Checkout',
                style: GoogleFonts.italiana(
                  textStyle: const TextStyle(
                    color: white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
