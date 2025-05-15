import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_patients/controller/authController.dart';
import 'package:my_patients/view/loginPage/widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  // Renamed HomePage to LoginPage
  LoginPage({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AuthController controllerA = Get.put(AuthController(), permanent: true);
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "My Patients",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Italianno',
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
                LoginForm(formKey: _formKey, controller: controllerA,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
