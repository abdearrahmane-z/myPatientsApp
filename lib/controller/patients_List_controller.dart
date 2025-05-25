// ignore_for_file: use_build_context_synchronously

import 'package:get/get.dart';
import 'package:my_patients/controller/analyse_tension_controller.dart';
import 'package:my_patients/controller/user_controller.dart';
import 'package:my_patients/model/patients_data.dart';

class HomeController extends GetxController {
  var patients = <Patient>[].obs;
  Map<String, dynamic> data = {};
  RxBool isLoading = true.obs;
  RxBool isError = false.obs;
  UserContrller user = Get.find();
  AnalyseTensionController analyseController = Get.find();
  // AnalyseTensionController analyseController = Get.put(
  //   AnalyseTensionController(), permanent: true,
  // );

  @override
  void onInit() async {
    super.onInit();

    await loadPatients();
  }

  loadPatients() async {
    isLoading.value = true;
    Patient.getData(user.userID).listen((result) {
      if (result['data'] != null && result['data'] is Map && result['data'].isNotEmpty) {
        data = Map<String, dynamic>.from(result['data'] as Map);

        int index = 0;
        patients.value =
            data.entries.map((entry) {
              entry.value["id"] = entry.key;
              final patient = Patient.fromJson(
              Map<String, dynamic>.from(entry.value),
            );
            analyseController.analyseTension(patient, index);
            index++;
            return patient;
          }).toList();
    } else {
      patients.clear();
    }
    isLoading.value = false;
  });
  }
}
