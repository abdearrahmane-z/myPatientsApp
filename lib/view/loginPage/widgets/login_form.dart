import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_patients/controller/authController.dart';
import 'package:my_patients/core/constants/colors.dart';
import 'package:my_patients/core/input_validator.dart';
import 'package:my_patients/view/forget_pass_page/forget_pass_page.dart';
import 'package:my_patients/view/signUpPage/signup_page.dart';
import 'package:my_patients/view/widgets/my_button.dart';
import 'package:my_patients/view/widgets/my_textfield.dart';

import '../../patient_login/patient_login.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.formKey,
    required this.controller,
    required this.context,
  });

  final GlobalKey<FormState> formKey;
  final AuthController controller;
  final BuildContext context;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 700), // Set max width to 700
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        margin: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          // boxShadow: [
          //   BoxShadow(
          //     color: Color.fromARGB(101, 0, 0, 0),
          //     spreadRadius: 1,
          //     blurRadius: 10,
          //     offset: const Offset(0, 0),
          //   ),
          // ],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Form(
          // Attach the form key
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyTextField(
                labelText: 'Email',
                hintText: 'Entrez votre email',
                textController: controller.emailController,
                validator: InputValidator.validateEmail,
              ),
              SizedBox(height: screenHeight * 0.02),
              MyTextField(
                labelText: 'Mot de passe',
                hintText: 'Entrez votre mot de passe',
                obscureText: true,
                textController: controller.passwordController,
                validator: InputValidator.validatePassword,
              ),
              SizedBox(height: screenHeight * 0.02),
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => ForgetPassPage());
                  },
                  child: Text(
                    'Mot de passe oublié ?',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Obx(
                () =>
                    controller.isLoading.value
                        ? CircularProgressIndicator()
                        : MyButton(
                          text: 'Se connecter',
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              // Validate the form
                              controller.login(context);
                            }
                          },
                        ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Vous n\'avez pas de compte ?', style: TextStyle(color: Colors.white),),
                  GestureDetector(
                    onTap: () {
                      // print('Sign Up tapped');
                      Get.to(() => SignUpPage());
                      controller.emailController.clear();
                      controller.passwordController.clear();
                      controller.confirmPasswordController.clear();
                    },
                    child: const Text(
                      'S\'inscrire',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
              TextButton(
                onPressed: () {
                  Get.to(() => PatientLogin());
                },
                child: const Text(
                  'Patient Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    decoration: TextDecoration.underline, 
                    decorationColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
