import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_patients/controller/authController.dart';
import 'package:my_patients/view/signUpPage/widgets/signUp_from.dart';

class SignUpPage extends StatelessWidget {
  // Renamed HomePage to SignUpPage
  SignUpPage({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AuthController controllerA = Get.put(AuthController());
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueAccent,
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
                      "Mes Patients",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50.spMin,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Italianno',
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.05),
                    SignUpForm(formKey: _formKey,controller: controllerA,),
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
