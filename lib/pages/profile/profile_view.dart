import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saporidiitalia/pages/profile/profile_controller.dart';
import 'package:saporidiitalia/utils/color.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                _buildProfileHeader(),
                const SizedBox(height: 25),
                _buildProfileMenu(),
                const SizedBox(height: 25),
                _buildOrderHistory(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Obx(() => Row(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: primary.withOpacity(0.1),
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(controller.userData['profileImage']),
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
                    controller.userData['name'],
                    style: GoogleFonts.italiana(
                      textStyle: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    controller.userData['email'],
                    style: GoogleFonts.italiana(
                      fontSize: 14,
                      color: black.withOpacity(0.9),
                    ),
                  ),
                  const SizedBox(height: 5),
                  InkWell(
                    onTap: controller.editProfile,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: secodPrimary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Edit Profile',
                        style: GoogleFonts.italiana(
                          textStyle: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                            color: primary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Widget _buildProfileMenu() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Account Settings',
          style: GoogleFonts.italiana(
            textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: black,
            ),
          ),
        ),
        const SizedBox(height: 15),
        _buildMenuItem(
          icon: Icons.location_on_outlined,
          title: 'Delivery Address',
          subtitle: 'Manage your delivery addresses',
          onTap: () {},
        ),
        _buildMenuItem(
          icon: Icons.payment_outlined,
          title: 'Payment Methods',
          subtitle: 'Manage your payment options',
          onTap: () {},
        ),
        _buildMenuItem(
          icon: Icons.notifications_outlined,
          title: 'Notifications',
          subtitle: 'Set your notification preferences',
          onTap: () {},
        ),
        _buildMenuItem(
          icon: Icons.favorite_outline,
          title: 'Favorites',
          subtitle: 'View your favorite items',
          onTap: () {},
        ),
        _buildMenuItem(
          icon: Icons.help_outline,
          title: 'Help & Support',
          subtitle: 'Contact customer support',
          onTap: () {},
        ),
        _buildMenuItem(
          icon: Icons.logout,
          title: 'Logout',
          subtitle: 'Sign out from your account',
          onTap: controller.logout,
          showDivider: false,
        ),
      ],
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    bool showDivider = true,
  }) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
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
                            fontWeight: FontWeight.w900,
                            color: black,
                          ),
                        ),
                      ),
                      Text(
                        subtitle,
                        style: GoogleFonts.italiana(
                          fontSize: 12,
                          color: black.withOpacity(0.9),
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: black.withOpacity(0.3),
                  size: 16,
                ),
              ],
            ),
          ),
        ),
        if (showDivider)
          Divider(
            color: black.withOpacity(0.1),
            height: 1,
          ),
      ],
    );
  }

  Widget _buildOrderHistory() {
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order History',
              style: GoogleFonts.italiana(
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: black,
                ),
              ),
            ),
            const SizedBox(height: 15),
            ...controller.orderHistory
                .map((order) => _buildOrderItem(order))
                .toList(),
          ],
        ));
  }

  Widget _buildOrderItem(Map<String, dynamic> order) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Order ${order['id']}',
                style: GoogleFonts.italiana(
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: black,
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  order['status'],
                  style: GoogleFonts.italiana(
                    textStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: primary,
                    ),
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
                '${order['date']}',
                style: GoogleFonts.italiana(
                  fontSize: 14,
                  color: black,
                ),
              ),
              Text(
                '${order['items']} items',
                style: GoogleFonts.italiana(
                  fontSize: 14,
                  color: black.withOpacity(0.9),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Amount',
                style: GoogleFonts.italiana(
                  textStyle: TextStyle(
                    fontSize: 14,
                    color: black.withOpacity(0.6),
                  ),
                ),
              ),
              Text(
                '\$${order['amount'].toStringAsFixed(2)}',
                style: GoogleFonts.italiana(
                  textStyle: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: primary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: secodPrimary.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  'View Details',
                  style: GoogleFonts.italiana(
                    textStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: primary,
                    ),
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
