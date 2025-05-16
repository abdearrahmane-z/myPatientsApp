import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_patients/controller/authController.dart';
import 'package:my_patients/view/loginPage/login_page.dart';
import 'package:my_patients/widgets/my_button.dart';
import 'package:my_patients/widgets/my_textfield.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key, required this.formKey, required this.controller});
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
          key: formKey, // Attach the form key
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
              MyTextField(
                labelText: 'Confirm Password',
                hintText: 'Confirm your password',
                obscureText: true,
                textController: controller.confirmPasswordController,
                validator: controller.validConfirmPassword,
              ),
              SizedBox(height: screenHeight * 0.02),
              MyButton(
                text: 'Sign Up',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    // Validate the form
                    controller.signUp();
                  }
                },
              ),
              SizedBox(height: screenHeight * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('I have an account?'),
                  GestureDetector(
                    onTap: () {
                      print('Login tapped');
                      Get.offAll(() => LoginPage()); // Navigate to LoginPage
                      controller.emailController.clear();
                      controller.passwordController.clear();
                      controller.confirmPasswordController.clear();
                    },
                    child: const Text(
                      'Login',
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
