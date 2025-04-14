import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saporidiitalia/routes/app_route_name.dart';

class LoginController extends GetxController {
  final loginFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final signupFormKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final signupEmailController = TextEditingController();
  final signupPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final RxBool isPasswordVisible = false.obs;
  final RxBool isSignupPasswordVisible = false.obs;
  final RxBool isConfirmPasswordVisible = false.obs;
  final RxBool isLoading = false.obs;
  final RxBool rememberMe = false.obs;
  final RxBool agreeToTerms = false.obs;
  final RxBool isLoginTab = true.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleSignupPasswordVisibility() {
    isSignupPasswordVisible.value = !isSignupPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  void toggleRememberMe() {
    rememberMe.value = !rememberMe.value;
  }

  void toggleAgreeToTerms() {
    agreeToTerms.value = !agreeToTerms.value;
  }

  void switchToLoginTab() {
    isLoginTab.value = true;
  }

  void switchToSignupTab() {
    isLoginTab.value = false;
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Your Name';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Your Email';
    }
    if (!GetUtils.isEmail(value)) {
      return 'Please Enter A Valid Email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Your Password';
    }
    if (value.length < 6) {
      return 'Password Must Be At Least 6 Characters';
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Confirm Your Password';
    }
    if (value != signupPasswordController.text) {
      return 'Passwords Do Not Match';
    }
    return null;
  }

  Future<void> login() async {
    if (loginFormKey.currentState!.validate()) {
      try {
        isLoading.value = true;

        await Future.delayed(const Duration(seconds: 2));

        Get.offAllNamed(AppRouteName.root);
      } catch (e) {
        Get.snackbar(
          'Error',
          'Login failed. Please try again.',
          snackPosition: SnackPosition.BOTTOM,
        );
      } finally {
        isLoading.value = false;
      }
    }
  }

  Future<void> signup() async {
    if (signupFormKey.currentState!.validate()) {
      if (!agreeToTerms.value) {
        Get.snackbar(
          'Terms & Conditions',
          'Please agree to the Terms and Conditions to continue',
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }

      try {
        isLoading.value = true;

        await Future.delayed(const Duration(seconds: 2));

        switchToLoginTab();
      } catch (e) {
        Get.snackbar(
          'Error',
          'Registration failed. Please try again.',
          snackPosition: SnackPosition.BOTTOM,
        );
      } finally {
        isLoading.value = false;
      }
    }
  }

  void forgotPassword() {
    Get.snackbar(
      'Password Reset',
      'Password reset functionality will be implemented soon.',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void showTermsAndConditions() {
    Get.snackbar(
      'Terms & Conditions',
      'Terms and conditions details will be shown here',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();

    nameController.dispose();
    signupEmailController.dispose();
    signupPasswordController.dispose();
    confirmPasswordController.dispose();

    super.onClose();
  }
}
