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
    double screenHeight = MediaQuery.of(context).size.height;
    AddPatientController controller = Get.put(AddPatientController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Add Patient', style: AppTextStyles.appBarText),
          backgroundColor: AppColors.appBarColor.withOpacity(0.8),
        ),
        body: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 700),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20.spMin),
                child: AddPatientForm(formKey: _formKey, controller: controller),
              ),
            ),
          ),
      ),
    );
  }
}


