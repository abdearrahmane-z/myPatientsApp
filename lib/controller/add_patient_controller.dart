import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_patients/controller/patients_List_controller.dart';
import 'package:my_patients/controller/user_controller.dart';
import 'package:my_patients/core/fonctions/show_message.dart';
import 'package:my_patients/core/notification/notify_service.dart';
import 'package:my_patients/model/patients_data.dart';
import 'package:my_patients/view/home/HomePage.dart';

class AddPatientController extends GetxController {
  final TextEditingController nom = TextEditingController();
  final TextEditingController prenom = TextEditingController();
  final TextEditingController age = TextEditingController();
  final TextEditingController antecedent = TextEditingController();

  final UserContrller user = Get.find();
  final HomeController hcontroller = Get.find();
  var sexe = "Male".obs;

  var isLoading = false.obs;

  final databaseRef = FirebaseDatabase.instance.ref();

  void onAdd(BuildContext context) async {
    isLoading.value = true;
    if (await Patient.addPatient(
      userID: user.userID,
      nom: nom.text,
      prenom: prenom.text,
      sexe: sexe.value,
      age: int.parse(age.text),
      antecedent: antecedent.text,
    )) {
      isLoading.value = false;
      // ignore: use_build_context_synchronously
      ShowMessage.show(context, "Patient ajouté avec succès", Colors.green);
      hcontroller.loadPatients();
      Get.offAll(() => Home());
    } else {
      isLoading.value = false;
      ShowMessage.show(context, "Échec de l'ajout du patient", Colors.red);
    }
  }
}
