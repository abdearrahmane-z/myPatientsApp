import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_patients/controller/patients_List_controller.dart';
import 'package:my_patients/controller/user_controller.dart';
import 'package:my_patients/view/home/HomePage.dart';
import 'package:my_patients/view/loginPage/login_page.dart';

class AuthController extends GetxController {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  RxBool isLoading = false.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final databaseRef = FirebaseDatabase.instance.ref();
  UserContrller user = Get.put(UserContrller(), permanent: true);

  void login(BuildContext context) async {
    isLoading.value = true;
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      String userId = userCredential.user?.uid ?? '';
      user.userID = userId;
      isLoading.value = false;

      Get.off(() => Home());
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("La connexion a échoué"),
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
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      createUserInDatabase(
        userId: userCredential.user!.uid,
        email: userCredential.user!.email!,
      );
      isLoading.value = false;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Succès de l'inscription"),
          backgroundColor: Colors.green,
        ),
      );
      Get.off(() => LoginPage());
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Échec de l'inscription"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void createUserInDatabase({
    required String userId,
    required String email,
  }) async {
    try {
      await databaseRef.child("users").child(userId).set({
        "id": userId,
        "email": email,
        // Add other fields as needed
      });
      print("User created in RTDB");
    } catch (e) {
      print("Error creating user in RTDB: $e");
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
          content: Text("La récupération a échoué"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
