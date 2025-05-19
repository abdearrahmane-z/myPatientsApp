import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_patients/view/home/home_page.dart';

class AuthController extends GetxController {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
      
  void login() {
    final email = emailController.text;
    final password = passwordController.text;
    print(email);
    print(password);
    Get.off(() => HomePage());
  }

  void signUp() {
    final email = emailController.text;
    final password = passwordController.text;
    print(email);
    print(password);
    // Get.off(HomePage());
  }
}
