import 'package:flutter/material.dart';
import 'package:my_patients/view/loginPage/widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  // Renamed HomePage to LoginPage
  const LoginPage({super.key});

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
              LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
