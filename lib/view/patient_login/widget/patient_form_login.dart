import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_patients/view/loginPage/login_page.dart';

import '../../../controller/authController.dart';
import '../../widgets/my_button.dart';
import '../../widgets/my_textfield.dart';

class PatientFormLogin extends StatelessWidget {
  PatientFormLogin({super.key});
  final controller = Get.find<AuthController>();

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyTextField(
                labelText: 'code',
                hintText: 'Entrez votre code',
                textController: controller.code,
              ),
              SizedBox(height: screenHeight * 0.02),
              Obx(
                () =>
                    controller.isLoading.value
                        ? CircularProgressIndicator()
                        : MyButton(
                          text: 'Se connecter',
                          onPressed: () {
                            controller.patientLogin(context);
                          },
                        ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Médecin login?', style: TextStyle(color: Colors.white),),
                  GestureDetector(
                    onTap: () {
                      // print('Sign Up tapped');
                      Get.off(() => LoginPage());
                      controller.code.clear();
                    },
                    child: const Text(
                      ' Connexion ',
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