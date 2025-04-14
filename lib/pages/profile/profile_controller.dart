import 'package:get/get.dart';

class ProfileController extends GetxController {
  final RxMap<String, dynamic> userData = {
    'name': 'Joe Ward',
    'email': 'joewrrd@gmail.com',
    'phone': '+961 76000623',
    'address': 'Koura, Lebanon',
    'profileImage':
        'assets/images/F6BAF086-9F94-4A0F-A571-ADB7D625BB09_1_201_a.heic',
  }.obs;

  final RxList<Map<String, dynamic>> orderHistory = [
    {
      'id': 'ORD-1234',
      'date': '15 Jun 2023',
      'status': 'Delivered',
      'amount': 35.50,
      'items': 3,
    },
    {
      'id': 'ORD-1235',
      'date': '02 May 2023',
      'status': 'Delivered',
      'amount': 27.80,
      'items': 2,
    },
    {
      'id': 'ORD-1236',
      'date': '18 Apr 2023',
      'status': 'Delivered',
      'amount': 42.90,
      'items': 4,
    },
  ].obs;

  void editProfile() {
    Get.snackbar(
      'Profile',
      'Edit Profile Functionality...',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void logout() {
    Get.snackbar(
      'Logout',
      'Logout Functionality...',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
