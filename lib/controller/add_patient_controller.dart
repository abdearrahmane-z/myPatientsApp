import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_patients/controller/patients_List_controller.dart';
import 'package:my_patients/view/home/home_page.dart';

class AddPatientController extends GetxController {
  final TextEditingController nom = TextEditingController();
  final TextEditingController prenom = TextEditingController();
  final TextEditingController age = TextEditingController();
  final TextEditingController antecedent = TextEditingController();

  final HomeController hcontroller = Get.find();
  var sexe = "Male".obs;

  var isLoading = false.obs;

  final databaseRef = FirebaseDatabase.instance.ref();

  void onAdd(BuildContext context) async {
    isLoading.value = true;
    databaseRef
        .child("patients")
        .push()
        .set({
          "id": databaseRef.key,
          "name": nom.text,
          "lastName": prenom.text,
          "age": age.text,
          "gender": sexe.value,
          "antecedent": antecedent.text,
          "RLTtension": 0,
          "data": "",
        })
        .then((_) {
          isLoading.value = false;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Sent OK'), backgroundColor: Colors.green),
          );
          Get.offAll(() => HomePage());
          hcontroller.loadPatients();
        })
        .catchError((error) {
          isLoading.value = false;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to send'),
              backgroundColor: Colors.red,
            ),
          );
          print(error);
        });
  }
}
