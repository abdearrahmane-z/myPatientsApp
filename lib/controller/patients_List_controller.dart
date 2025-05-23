// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_patients/controller/user_controller.dart';
import 'package:my_patients/core/data_analyse/data_analyse.dart';
import 'package:my_patients/core/fonctions/show_message.dart';
import 'package:my_patients/core/notification/notify_service.dart';
import 'package:my_patients/model/notify_data.dart';
import 'package:my_patients/model/patients_data.dart';

class HomeController extends GetxController {
  var patients = <Patient>[].obs;
  Map<String, dynamic> data = {};
  RxBool isLoading = true.obs;
  RxBool isError = false.obs;
  UserContrller user = Get.find();

  @override
  void onInit() async {
    super.onInit();
    print("userID:");
    print(user.userID);
    await loadPatients();
    print("init");
  }

  loadPatients() async {
    Patient.getData(user.userID).listen((result) {
      isLoading.value = true;
      if (result['data'] != null && result['data'] is Map) {
        final oldData = data;
        data = Map<String, dynamic>.from(result['data'] as Map);
        int index = 0;
        patients.value =
            data.entries.map((entry) {
              entry.value["id"] = entry.key;
              final patient = Patient.fromJson(
                Map<String, dynamic>.from(entry.value),
              );
              if (oldData.isNotEmpty &&
                  oldData[entry.key]["RLTtension"] != patient.tension) {
                analyseTension(patient, index);
              }
              index++;
              return patient;
            }).toList();
      } else {
        patients.clear();
      }
      isLoading.value = false;
    });
  }

  void onRemove(BuildContext context, Patient patient) async {
    await Patient.removePatient(patient, user.userID)
        ? ShowMessage.show(context, "Supprimé avec succès", Colors.green)
        : ShowMessage.show(context, "erreur supprimer le patient", Colors.red);
  }

  analyseTension(Patient patient, int index) async {
    if (0 < patient.tension && patient.tension < DataAnalyse.minTesnion ||
        patient.tension > DataAnalyse.maxTesnion) {
      final now = DateTime.now().toUtc().add(
        const Duration(hours: 1),
      ); // Add +1 hour
      final key =
          "${now.year.toString().padLeft(4, '0')}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}T"
          "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}Z";

      NotifyService().showNotify(id: index, title: patient.name, body: "pic");
      if (await Notify.addNotification(
            userID: user.userID,
            key: key,
            notificationMessage: "notificationMessage",
            patient: patient,
          ) &&
          await Patient.addHistorique(userID: user.userID,patient: patient, key: key)) {
        print("sent ok");
      } else {
        print("sent error");
      }
    }
  }
}
