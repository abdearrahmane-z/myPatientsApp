import 'package:flutter/material.dart';
import 'package:my_patients/view/signUpPage/widgets/signUp_from.dart';

class SignUpPage extends StatelessWidget {
  // Renamed HomePage to SignUpPage
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "My Patients",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, fontFamily: 'Italianno'),
              ),
               SizedBox(height: screenHeight * 0.05),
              SignUpForm(),
            ],
          ),
        ),
      ),
    );
  }
}
