import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/add_patient_controller.dart';
import '../../../core/input_validator.dart';
import '../../widgets/my_button.dart';
import '../../widgets/my_textfield.dart';

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
            textController: controller.nom,
            validator: InputValidator.validateName,
          ),
          SizedBox(height: screenHeight * 0.02),
          MyTextField(
            labelText: 'prénom',
            hintText: 'prénom',
            textController: controller.prenom,
            validator: InputValidator.validateName,
          ),
          SizedBox(height: screenHeight * 0.02),
          MyTextField(
            labelText: 'age',
            hintText: 'age',
            textController: controller.age,
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
                isExpanded: true,
                value: controller.sexe.value,
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
            controller: controller.antecedent,
          ),
          SizedBox(height: screenHeight * 0.02),
          Obx(() {
              if (controller.isLoading.value) {
                return const CircularProgressIndicator();
              }
              return MyButton(
                      text: 'Ajouter',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          controller.onAdd(context);
                        }
                      },
                    );
                  }),
          ],
      ),
    );
  }
}
