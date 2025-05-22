import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_patients/controller/authController.dart';
import 'package:my_patients/core/constants/colors.dart';
import 'package:my_patients/core/constants/text_styles.dart';
import 'package:my_patients/core/input_validator.dart';
import 'package:my_patients/view/widgets/my_button.dart';
import 'package:my_patients/view/widgets/my_textfield.dart';

class ForgetPassPage extends StatelessWidget {
  ForgetPassPage({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AuthController controller = Get.put(AuthController());
    double heigh = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: AppColors.secondaryColor,
          title: Row(
            children: [
              Image.asset(
                'assets/images/logo.png', // Make sure this path is correct and added in pubspec.yaml
                height: 40,
              ),
              const SizedBox(width: 10),
              Text(
                "Mes patients",
                style: AppTextStyles.appBarText,
              ),
            ],
          ),
          backgroundColor: AppColors.appBarColor,
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/bg1.jpg', // Make sure this path is correct and added in pubspec.yaml
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                margin: const EdgeInsets.all(10),
                constraints: BoxConstraints(maxWidth: 700),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Entrez votre email pour envoyer un lien de réinitialisation de mot de passe",
                        style: AppTextStyles.detailText,
                        textAlign: TextAlign.center,
                        
                      ),
                      SizedBox(height: heigh * 0.02),
                      MyTextField(
                        labelText: "Email",
                        hintText: "Email",
                        textController: controller.emailController,
                        validator: InputValidator.validateEmail,
                      ),
                      SizedBox(height: heigh * 0.02),
                      Obx(
                        () =>
                            controller.isLoading.value
                                ? CircularProgressIndicator()
                                : MyButton(
                                  text: "Envoyer",
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      controller.recoverPassword(context);
                                    }
                                  },
                                ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
