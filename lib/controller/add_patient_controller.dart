import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPatientController extends GetxController {
  final TextEditingController nom = TextEditingController();
  final TextEditingController prenom = TextEditingController();
  final TextEditingController age = TextEditingController();
  final TextEditingController antecedent = TextEditingController();
  var sexe = "Male".obs;


  void onAdd() async {

    // final DatabaseReference ref = FirebaseDatabase.instance.ref('patients').push();
    // await ref.set({
    //   "id": ref.key,
    //   "nom": nom.text,
    //   "prenom": prenom.text,
    //   "age": age.text,
    //   "sexe": sexe.value,
    //   "antecedent": antecedent.text,
    //   "tension": 0,
    // });
  }



}
