import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPatientController extends GetxController {
  final TextEditingController nom = TextEditingController();
  final TextEditingController prenom = TextEditingController();
  final TextEditingController age = TextEditingController();
  final TextEditingController antecedent = TextEditingController();
  var sexe = "".obs;
  var sexeHint = "sexe".obs;


}
