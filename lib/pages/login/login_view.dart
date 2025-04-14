import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saporidiitalia/pages/login/login_controller.dart';
import 'package:saporidiitalia/utils/color.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),
            _buildLogo(),
            const SizedBox(height: 40),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTabs(),
                        const SizedBox(height: 30),
                        Obx(() => controller.isLoginTab.value
                            ? _buildLoginForm()
                            : _buildSignupForm()),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              "assets/icons/mainLogo3.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 15),
        Text(
          "Sapori Di Italia",
          style: GoogleFonts.italiana(
            textStyle: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: white,
            ),
          ),
        ),
        Text(
          "Order Today!",
          style: GoogleFonts.italiana(
            textStyle: const TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 253, 227, 154),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTabs() {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
          color: primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: controller.switchToLoginTab,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    color: controller.isLoginTab.value
                        ? primary
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      "Login",
                      style: GoogleFonts.italiana(
                        textStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: controller.isLoginTab.value ? white : primary,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: controller.switchToSignupTab,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    color: !controller.isLoginTab.value
                        ? primary
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      "Register",
                      style: GoogleFonts.italiana(
                        textStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: !controller.isLoginTab.value ? white : primary,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Login Form
  Widget _buildLoginForm() {
    return Form(
      key: controller.loginFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildEmailField(),
          const SizedBox(height: 20),
          _buildPasswordField(),
          const SizedBox(height: 10),
          _buildRememberMeAndForgotPassword(),
          const SizedBox(height: 30),
          _buildLoginButton(),
          const SizedBox(height: 25),
          _buildSocialDivider("Or Login With"),
          const SizedBox(height: 25),
          _buildSocialButtons(isLogin: true),
        ],
      ),
    );
  }

  // Signup Form
  Widget _buildSignupForm() {
    return Form(
      key: controller.signupFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildNameField(),
          const SizedBox(height: 20),
          _buildSignupEmailField(),
          const SizedBox(height: 20),
          _buildSignupPasswordField(),
          const SizedBox(height: 20),
          _buildConfirmPasswordField(),
          const SizedBox(height: 15),
          _buildTermsAndConditions(),
          const SizedBox(height: 25),
          _buildSignupButton(),
          const SizedBox(height: 25),
          _buildSocialDivider("Or Sign Up With"),
          const SizedBox(height: 25),
          _buildSocialButtons(isLogin: false),
        ],
      ),
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      controller: controller.emailController,
      keyboardType: TextInputType.emailAddress,
      cursorColor: primary,
      decoration: InputDecoration(
        hintText: "Enter Your Email...",
        hintStyle: GoogleFonts.italiana(color: black),
        filled: true,
        fillColor: primary.withOpacity(0.1),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color.fromARGB(255, 253, 227, 154)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color.fromARGB(255, 253, 227, 154)),
        ),
      ),
      validator: controller.validateEmail,
    );
  }

  Widget _buildPasswordField() {
    return Obx(
      () => TextFormField(
        cursorColor: primary,
        controller: controller.passwordController,
        obscureText: !controller.isPasswordVisible.value,
        decoration: InputDecoration(
          hintText: "Enter Your Password... ",
          hintStyle: GoogleFonts.italiana(color: black),
          filled: true,
          fillColor: primary.withOpacity(0.1),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Color.fromARGB(255, 253, 227, 154)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Color.fromARGB(255, 253, 227, 154)),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              controller.isPasswordVisible.value
                  ? Icons.visibility_off
                  : Icons.visibility,
              color: primary,
            ),
            onPressed: controller.togglePasswordVisibility,
          ),
        ),
        validator: controller.validatePassword,
      ),
    );
  }

  Widget _buildRememberMeAndForgotPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: controller.forgotPassword,
          child: Text(
            "Forgot Password?",
            style: GoogleFonts.italiana(
              textStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: primary,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return Obx(
      () => SizedBox(
        width: double.infinity,
        height: 55,
        child: ElevatedButton(
          onPressed: controller.isLoading.value ? null : controller.login,
          style: ElevatedButton.styleFrom(
            backgroundColor: primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 0,
          ),
          child: controller.isLoading.value
              ? const CircularProgressIndicator(color: white)
              : Text(
                  "Login",
                  style: GoogleFonts.italiana(
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: white,
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  Widget _buildNameField() {
    return TextFormField(
      cursorColor: primary,
      controller: controller.nameController,
      decoration: InputDecoration(
        hintText: "Enter Your Full Name...",
        hintStyle: GoogleFonts.italiana(color: black),
        filled: true,
        fillColor: primary.withOpacity(0.1),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color.fromARGB(255, 253, 227, 154)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color.fromARGB(255, 253, 227, 154)),
        ),
      ),
      validator: controller.validateName,
    );
  }

  Widget _buildSignupEmailField() {
    return TextFormField(
      cursorColor: primary,
      controller: controller.signupEmailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: "Enter New Email...",
        hintStyle: GoogleFonts.italiana(color: black),
        filled: true,
        fillColor: primary.withOpacity(0.1),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color.fromARGB(255, 253, 227, 154)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color.fromARGB(255, 253, 227, 154)),
        ),
      ),
      validator: controller.validateEmail,
    );
  }

  Widget _buildSignupPasswordField() {
    return Obx(
      () => TextFormField(
        cursorColor: primary,
        controller: controller.signupPasswordController,
        obscureText: !controller.isSignupPasswordVisible.value,
        decoration: InputDecoration(
          hintText: "Enter New Password...",
          hintStyle: GoogleFonts.italiana(color: black),
          filled: true,
          fillColor: primary.withOpacity(0.1),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Color.fromARGB(255, 253, 227, 154)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Color.fromARGB(255, 253, 227, 154)),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              controller.isSignupPasswordVisible.value
                  ? Icons.visibility_off
                  : Icons.visibility,
              color: primary,
            ),
            onPressed: controller.toggleSignupPasswordVisibility,
          ),
        ),
        validator: controller.validatePassword,
      ),
    );
  }

  Widget _buildConfirmPasswordField() {
    return Obx(
      () => TextFormField(
        cursorColor: primary,
        controller: controller.confirmPasswordController,
        obscureText: !controller.isConfirmPasswordVisible.value,
        decoration: InputDecoration(
          hintText: "Confirm New Password...",
          hintStyle: GoogleFonts.italiana(color: black),
          filled: true,
          fillColor: primary.withOpacity(0.1),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Color.fromARGB(255, 253, 227, 154)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Color.fromARGB(255, 253, 227, 154)),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              controller.isConfirmPasswordVisible.value
                  ? Icons.visibility_off
                  : Icons.visibility,
              color: primary,
            ),
            onPressed: controller.toggleConfirmPasswordVisibility,
          ),
        ),
        validator: controller.validateConfirmPassword,
      ),
    );
  }

  Widget _buildTermsAndConditions() {
    return Row(
      children: [
        Obx(
          () => Checkbox(
            value: controller.agreeToTerms.value,
            onChanged: (value) => controller.toggleAgreeToTerms(),
            activeColor: primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Text(
                "I agree to the ",
                style: GoogleFonts.italiana(
                  textStyle: const TextStyle(
                    fontSize: 14,
                    color: black,
                  ),
                ),
              ),
              GestureDetector(
                onTap: controller.showTermsAndConditions,
                child: Text(
                  "Terms & Conditions",
                  style: GoogleFonts.italiana(
                    textStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: primary,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSignupButton() {
    return Obx(
      () => SizedBox(
        width: double.infinity,
        height: 55,
        child: ElevatedButton(
          onPressed: controller.isLoading.value ? null : controller.signup,
          style: ElevatedButton.styleFrom(
            backgroundColor: primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 0,
          ),
          child: controller.isLoading.value
              ? const CircularProgressIndicator(color: white)
              : Text(
                  "Register",
                  style: GoogleFonts.italiana(
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: white,
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  Widget _buildSocialDivider(String text) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: black.withOpacity(0.3),
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            text,
            style: GoogleFonts.italiana(
              textStyle: TextStyle(
                fontSize: 14,
                color: black.withOpacity(0.7),
              ),
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: black.withOpacity(0.3),
            thickness: 1,
          ),
        ),
      ],
    );
  }

  Widget _buildSocialButtons({required bool isLogin}) {
    return Column(
      children: [
        _buildSocialButton(
          text: isLogin ? "Login With Facebook" : "Sign Up With Facebook",
          color: const Color(0xFF3b5998),
          icon: Icons.facebook,
          onTap: () {
            Get.snackbar(
              'Facebook',
              '${isLogin ? "Login" : "Signup"} functionality coming soon',
              snackPosition: SnackPosition.BOTTOM,
            );
          },
        ),
        const SizedBox(height: 10),
        _buildSocialButton(
          text: isLogin ? "Login With Apple" : "Sign Up With Apple",
          color: const Color(0xFFA2AAAD),
          icon: Icons.apple,
          onTap: () {
            Get.snackbar(
              'Apple',
              '${isLogin ? "Login" : "Signup"} functionality coming soon',
              snackPosition: SnackPosition.BOTTOM,
            );
          },
        ),
        const SizedBox(height: 10),
        _buildSocialButton(
          text: isLogin ? "Login With Google" : "Sign Up With Google",
          color: const Color(0xFFEA4335),
          icon: Icons.g_mobiledata,
          onTap: () {
            Get.snackbar(
              'Google',
              '${isLogin ? "Login" : "Signup"} functionality coming soon',
              snackPosition: SnackPosition.BOTTOM,
            );
          },
        ),
      ],
    );
  }

  Widget _buildSocialButton({
    required String text,
    required Color color,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: white),
            const SizedBox(width: 10),
            Text(
              text,
              style: GoogleFonts.italiana(
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
