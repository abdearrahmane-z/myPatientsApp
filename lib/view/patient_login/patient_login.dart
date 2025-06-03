import 'package:flutter/material.dart';
import 'package:my_patients/core/constants/constant.dart';
import 'package:my_patients/view/patient_login/widget/patient_form_login.dart';

class PatientLogin extends StatelessWidget {
  const PatientLogin({super.key});

  @override
  Widget build(BuildContext context) {
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
                      appName,
                      style: TextStyle(
                        
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Italianno',
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.05),
                    PatientFormLogin(),
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