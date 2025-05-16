import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_patients/controller/authController.dart';
import 'package:my_patients/view/signUpPage/signup_page.dart';
import 'package:my_patients/widgets/my_button.dart';
import 'package:my_patients/widgets/my_textfield.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key, required this.formKey, required this.controller});

  final GlobalKey<FormState> formKey;
  final AuthController controller;
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
          color: const Color.fromARGB(255, 255, 255, 255),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(101, 0, 0, 0),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 0),
            ),
          ],
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
                hintText: 'Enter your email',
                textController: controller.emailController,
                validator: controller.validEmail,
              ),
              SizedBox(height: screenHeight * 0.02),
              MyTextField(
                labelText: 'Password',
                hintText: 'Enter your password',
                obscureText: true,
                textController: controller.passwordController,
                validator: controller.validPassword,
              ),
              SizedBox(height: screenHeight * 0.02),
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {
                    print('Forgot Password tapped');
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              MyButton(
                text: 'Login',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    // Validate the form
                    controller.login();
                  }
                },
              ),
              SizedBox(height: screenHeight * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account?'),
                  GestureDetector(
                    onTap: () {
                      print('Sign Up tapped');
                      Get.to(() => SignUpPage());
                      controller.emailController.clear(); 
                      controller.passwordController.clear();
                      controller.confirmPasswordController.clear();
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
