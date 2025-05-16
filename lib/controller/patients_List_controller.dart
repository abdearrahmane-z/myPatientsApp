import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_patients/core/testPatient.dart';
import 'package:my_patients/view/home/widgets/itemForm.dart';


class HomeController extends GetxController {
   List<Widget> myPatients = patients.map((patient) {
    return ItemForm(
      name: patient.name,
      details: patient.details,
      time: patient.time,
      data: patient.data,
      id: patient.id,
    );
  }).toList();

  void addPatient(Widget patient) {
    myPatients.add(patient);
    update();
  }

  void removePatient(Widget patient) {
    patients.remove(patient);
    update();
  }


}