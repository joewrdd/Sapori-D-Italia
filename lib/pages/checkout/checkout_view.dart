import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saporidiitalia/pages/checkout/checkout_controller.dart';
import 'package:saporidiitalia/utils/color.dart';

class CheckoutView extends GetView<CheckoutController> {
  const CheckoutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Checkout',
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
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDeliveryAddress(),
            const SizedBox(height: 25),
            _buildDeliveryOptions(),
            const SizedBox(height: 25),
            _buildPaymentMethod(),
            const SizedBox(height: 25),
            _buildOrderSummary(),
          ],
        ),
      ),
      bottomNavigationBar: _buildPlaceOrderButton(),
    );
  }

  Widget _buildDeliveryAddress() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Delivery Address',
          style: GoogleFonts.italiana(
            textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: black,
            ),
          ),
        ),
        const SizedBox(height: 15),
        Container(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() => Text(
                        controller.deliveryAddress['name'] ?? '',
                        style: GoogleFonts.italiana(
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: black,
                          ),
                        ),
                      )),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Edit',
                        style: GoogleFonts.italiana(
                          textStyle: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: primary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Obx(() => Text(
                    controller.deliveryAddress['street'] ?? '',
                    style: GoogleFonts.italiana(
                      textStyle: const TextStyle(
                        fontSize: 14,
                        color: black,
                      ),
                    ),
                  )),
              const SizedBox(height: 5),
              Obx(() => Text(
                    '${controller.deliveryAddress['city'] ?? ''}, ${controller.deliveryAddress['zipCode'] ?? ''}',
                    style: GoogleFonts.italiana(
                      textStyle: const TextStyle(
                        fontSize: 14,
                        color: black,
                      ),
                    ),
                  )),
              const SizedBox(height: 5),
              Obx(() => Text(
                    controller.deliveryAddress['country'] ?? '',
                    style: GoogleFonts.italiana(
                      textStyle: const TextStyle(
                        fontSize: 14,
                        color: black,
                      ),
                    ),
                  )),
              const SizedBox(height: 10),
              Obx(() => Text(
                    'Phone: ${controller.deliveryAddress['phone']}',
                    style: GoogleFonts.italiana(
                      textStyle: const TextStyle(
                        fontSize: 14,
                        color: black,
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDeliveryOptions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Delivery Options',
          style: GoogleFonts.italiana(
            textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: black,
            ),
          ),
        ),
        const SizedBox(height: 15),
        Container(
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
            children: [
              _buildDeliveryOption(
                'Standard',
                '3-5 Business Days',
                '\$2.99',
              ),
              const Divider(height: 20),
              _buildDeliveryOption(
                'Express',
                '1-2 Business Days',
                '\$4.99',
              ),
              const Divider(height: 20),
              _buildDeliveryOption(
                'Next Day',
                'Next Business Day',
                '\$7.99',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDeliveryOption(String title, String description, String price) {
    return InkWell(
      onTap: () => controller.selectDeliveryOption(title),
      child: Row(
        children: [
          Obx(() => Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: controller.selectedDeliveryOption.value == title
                        ? primary
                        : black.withOpacity(0.3),
                    width: 2,
                  ),
                ),
                child: controller.selectedDeliveryOption.value == title
                    ? Container(
                        margin: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: primary,
                        ),
                      )
                    : null,
              )),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.italiana(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: black,
                    ),
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 12,
                    color: black.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),
          Text(
            price,
            style: GoogleFonts.italiana(
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: primary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethod() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Payment Method',
          style: GoogleFonts.italiana(
            textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: black,
            ),
          ),
        ),
        const SizedBox(height: 15),
        Container(
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
            children: [
              _buildPaymentOption(
                'Credit Card',
                'Visa, Mastercard, Amex',
                Icons.credit_card,
              ),
              const Divider(height: 20),
              _buildPaymentOption(
                'PayPal',
                'Pay with your PayPal account',
                Icons.account_balance_wallet,
              ),
              const Divider(height: 20),
              _buildPaymentOption(
                'Cash on Delivery',
                'Pay when you receive your order',
                Icons.money,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentOption(String title, String description, IconData icon) {
    return InkWell(
      onTap: () => controller.selectPaymentMethod(title),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: primary,
              size: 22,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.italiana(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: black,
                    ),
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 12,
                    color: black.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),
          Obx(() => Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: controller.selectedPaymentMethod.value == title
                        ? primary
                        : black.withOpacity(0.3),
                    width: 2,
                  ),
                ),
                child: controller.selectedPaymentMethod.value == title
                    ? Container(
                        margin: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: primary,
                        ),
                      )
                    : null,
              )),
        ],
      ),
    );
  }

  Widget _buildOrderSummary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Order Summary',
          style: GoogleFonts.italiana(
            textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: black,
            ),
          ),
        ),
        const SizedBox(height: 15),
        Container(
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
            children: [
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
                  Obx(() => Text(
                        '\$${controller.cartController.subtotal.toStringAsFixed(2)}',
                        style: GoogleFonts.italiana(
                          textStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: black,
                          ),
                        ),
                      )),
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
                  Obx(() => Text(
                        '\$${controller.deliveryCost.toStringAsFixed(2)}',
                        style: GoogleFonts.italiana(
                          textStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: black,
                          ),
                        ),
                      )),
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
                  Obx(() => Text(
                        '\$${controller.total.toStringAsFixed(2)}',
                        style: GoogleFonts.italiana(
                          textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: primary,
                          ),
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPlaceOrderButton() {
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
      child: ElevatedButton(
        onPressed: controller.placeOrder,
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          'Place Order',
          style: GoogleFonts.italiana(
            textStyle: const TextStyle(
              color: white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
