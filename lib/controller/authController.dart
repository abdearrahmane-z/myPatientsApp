import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_patients/view/home/HomePage.dart';
import 'package:my_patients/view/loginPage/login_page.dart';

class AuthController extends GetxController {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  RxBool isLoading = false.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void login(BuildContext context) async {
    isLoading.value = true;
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      isLoading.value = false;
      Get.off(() => Home());
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message ?? "La connexion a échoué"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void signUp(BuildContext context) async {
    isLoading.value = true;
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      isLoading.value = false;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Succès de l'inscription"),
          backgroundColor: Colors.green,
        ),
      );
      Get.off(() => Home());
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message ?? "Échec de l'inscription"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void recoverPassword(BuildContext context) async {
    final email = emailController.text.trim();
    try {
      isLoading.value = true;
      await _auth.sendPasswordResetEmail(email: email);
      isLoading.value = false;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("E-mail de réinitialisation du mot de passe envoyé"),
          backgroundColor: Colors.green,
        ),
      );
      Get.off(() => LoginPage());
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message ?? "La récupération a échoué"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
