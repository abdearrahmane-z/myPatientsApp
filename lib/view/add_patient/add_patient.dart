import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_patients/controller/add_patient_controller.dart';
import 'package:my_patients/core/constants/colors.dart';
import 'package:my_patients/core/constants/text_styles.dart';

import 'widgets/add_patieny_form.dart';

class AddPatient extends StatelessWidget {
  AddPatient({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AddPatientController controller = Get.put(AddPatientController());
    return SafeArea(
      child: Scaffold(
        appBar:AppBar(
          foregroundColor: AppColors.secondaryColor,
          title: Row(
            children: [
              Image.asset(
                'assets/images/logo.png', // Make sure this path is correct and added in pubspec.yaml
                height: 40,
              ),
              const SizedBox(width: 10),
              Text(
                "Ajouter un patient",
                style: AppTextStyles.appBarText,
              ),
            ],
          ),
          backgroundColor: AppColors.appBarColor,
        ),
        body: Center(
          child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 700),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(20.spMin),
                  child: AddPatientForm(formKey: _formKey, controller: controller),
                ),
              ),
            ),
        ),
      ),
    );
  }
}


