import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_patients/controller/authController.dart';
import 'package:my_patients/view/loginPage/widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AuthController controllerA = Get.put(AuthController());
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/bg1.jpg', // Make sure this path is correct and added in pubspec.yaml
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logo.png', // Make sure this path is correct and added in pubspec.yaml
                      height: screenHeight * 0.18,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Text(
                      "My Patients",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Italianno',
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.05),
                    LoginForm(formKey: _formKey, controller: controllerA, context: context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}