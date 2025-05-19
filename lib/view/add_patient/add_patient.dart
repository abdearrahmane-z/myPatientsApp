import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_patients/controller/add_patient_controller.dart';
import 'package:my_patients/core/constants/colors.dart';
import 'package:my_patients/core/constants/text_styles.dart';
import 'package:my_patients/core/input_validator.dart';
import 'package:my_patients/view/widgets/my_button.dart';
import 'package:my_patients/view/widgets/my_textfield.dart';

class AddPatient extends StatelessWidget {
  const AddPatient({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
          child: Padding(
            padding: EdgeInsets.all(20.spMin),
            child: AddPatientForm(formKey: formKey, controller: controller),
          ),
        ),
      ),
    );
  }
}

class AddPatientForm extends StatelessWidget {
  const AddPatientForm({
    super.key,
    required this.formKey,
    required this.controller,
  });

  final GlobalKey<FormState> formKey;
  final AddPatientController controller;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MyTextField(
            labelText: 'nom',
            hintText: 'nom',
            textController: TextEditingController(),
            validator: InputValidator.validateName,
          ),
          SizedBox(height: screenHeight * 0.02),
          MyTextField(
            labelText: 'prénom',
            hintText: 'prénom',
            textController: TextEditingController(),
            validator: InputValidator.validateName,
          ),
          SizedBox(height: screenHeight * 0.02),
          MyTextField(
            labelText: 'age',
            hintText: 'age',
            textController: TextEditingController(),
            validator: InputValidator.validateAge,
          ),
          SizedBox(height: screenHeight * 0.02),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Obx(
              () => DropdownButton(
                hint: Text(controller.sexeHint.value),
                isExpanded: true,
                value: controller.sexe.value.isEmpty?null:controller.sexe.value,
                items: const [
                  DropdownMenuItem(value: "Male", child: Text('Male')),
                  DropdownMenuItem(value: "Female", child: Text('Female')),
                ],
                onChanged: (value) {
                  if (value != null) {
                    controller.sexe.value = value;
                  }
                },
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          TextFormField(
            maxLines: 3,
            validator: InputValidator.validateMedicalHistory,
            decoration: InputDecoration(
              labelText: 'Antécédents',
              hintText: 'Antécédents',
              border: OutlineInputBorder(),
            ),
            controller: TextEditingController(),
          ),
          SizedBox(height: screenHeight * 0.02),
          MyButton(
            text: 'Ajouter',
            onPressed: () {
              if (formKey.currentState!.validate()) {
                // Process the data
              }
            },
          ),
        ],
      ),
    );
  }
}

extension on Object? {
  get sexe => null;
}
