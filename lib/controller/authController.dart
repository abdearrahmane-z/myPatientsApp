import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_patients/view/home/home_page.dart';

class AuthController extends GetxController {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(email);
  }

  bool isValidPassword(String password) {
    return password.length >=
        6; // Example: Password must be at least 6 characters
  }

  bool isValidConfirmPassword(String password, String confirmPassword) {
    return password == confirmPassword;
  }

  String? validEmail(String? email) {
    if (email == null || email.isEmpty) {
      return "Email cannot be empty";
    } else if (!isValidEmail(email)) {
      return "Invalid email format";
    }
    return null;
  }

  String? validPassword(String? password) {
    if (password == null || password.isEmpty) {
      return "Password cannot be empty";
    } else if (!isValidPassword(password)) {
      return "Password must be at least 6 characters";
    }
    return null;
  }

  String? validConfirmPassword(String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return "Confirm Password cannot be empty";
    } else if (!isValidConfirmPassword(
      passwordController.text,
      confirmPassword,
    )) {
      return "Passwords do not match";
    }
    return null;
  }

  void login() {
    final email = emailController.text;
    final password = passwordController.text;
    print(email);
    print(password);
  }

  void signUp() {
    final email = emailController.text;
    final password = passwordController.text;
    print(email);
    print(password);
    Get.off(HomePage());
  }
}
