import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_patients/controller/authController.dart';
import 'package:my_patients/core/constants/colors.dart';
import 'package:my_patients/core/constants/text_styles.dart';
import 'package:my_patients/view/widgets/my_button.dart';
import 'package:my_patients/view/widgets/my_textfield.dart';

class ForgetPassPage extends StatelessWidget {
  const ForgetPassPage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController controller = Get.put(AuthController());
    double heigh = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Mot de passe oublié", style: AppTextStyles.appBarText),
          backgroundColor: AppColors.appBarColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 700),
            child: Column(
              children: [
                Text("Entrez votre email pour envoyer un lien de réinitialisation de mot de passe",style: AppTextStyles.detailText,textAlign: TextAlign.center,),
                SizedBox(height: heigh*0.02,),
                MyTextField(
                  labelText: "Email",
                  hintText: "Email",
                  textController: controller.emailController,
                ),
                SizedBox(height: heigh*0.02,),
                Obx(
                  ()=> controller.isLoading.value? CircularProgressIndicator():
                  MyButton(text: "Envoyer", onPressed: ()=>controller.recoverPassword(context))
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
