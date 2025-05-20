import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_patients/controller/authController.dart';
import 'package:my_patients/core/constants/colors.dart';
import 'package:my_patients/core/input_validator.dart';
import 'package:my_patients/view/loginPage/login_page.dart';
import 'package:my_patients/view/widgets/my_button.dart';
import 'package:my_patients/view/widgets/my_textfield.dart';

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
          color: AppColors.authFormColor.withOpacity(0.8),
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
              MyTextField(
                labelText: 'Confirmez mot de passe',
                hintText: 'Confirmez votre mot de passe',
                obscureText: true,
                textController: controller.confirmPasswordController,
                validator: (value) => InputValidator.validateConfirmPassword(value, controller.passwordController.text),
              ),
              SizedBox(height: screenHeight * 0.02),
              Obx(
                ()=> controller.isLoading.value?CircularProgressIndicator():
                MyButton(
                  text: 'S\'inscrire',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      // Validate the form
                      controller.signUp(context);
                    }
                  },
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('J\'ai un compte ? '),
                  GestureDetector(
                    onTap: () {
                      print('Login tapped');
                      Get.offAll(() => LoginPage()); // Navigate to LoginPage
                      controller.emailController.clear();
                      controller.passwordController.clear();
                      controller.confirmPasswordController.clear();
                    },
                    child: const Text(
                      'Se connecter',
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
