import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_patients/core/fonctions/show_message.dart';
import 'package:my_patients/model/patients_data.dart';

class HomeController extends GetxController {
  var patients = <Patient>[].obs;
  Map<String, dynamic> data = {};
  RxBool isLoading = true.obs;
  RxBool isError = false.obs;

  @override
  void onInit() async {
    super.onInit();
    await loadPatients();
    print("init");
  }

  loadPatients() async {
    // isLoading.value = true;
    Patient.getData().listen((result) {
      isLoading.value = true;
      if (result['data'] != null && result['data'] is Map) {
        data = Map<String, dynamic>.from(result['data'] as Map);
        patients.value =
            data.entries.map((entry) {
              entry.value["id"] = entry.key;
              return Patient.fromJson(Map<String, dynamic>.from(entry.value));
            }).toList();
      } else {
        patients.clear();
      }
      isLoading.value = false;
    });
    
    // Safely convert and update patients list
  }

  // void navigateToDetailPage(String id) {
  //   Get.to(() => DetailPage(id: id));
  // }

  void onRemove(BuildContext context, String id) async {
    await Patient.removePatient(id)
        ? ShowMessage.show(context, "Supprimé avec succès", Colors.green)
        : ShowMessage.show(context, "erreur supprimer le patient", Colors.red);
  }
}
