import 'package:get/get.dart';
import 'package:my_patients/core/testData.dart';
import 'package:my_patients/model/patients_data.dart';

class HomeController extends GetxController {
  var patients = <Patient>[];
  Map<String, dynamic> data = {};
  Map<String, dynamic> result = {};
  RxBool isLoading = true.obs;
  RxBool isError = false.obs;

  @override
  void onInit() async {
    super.onInit();
    await loadPatients();
    print("init");
  }

  loadPatients() async {
    isLoading.value = true;
    result = await Patient.getData();
    print(result['status']);
    print(result['data']);
    // Safely convert and update patients list
    if (result['data'] != null && result['data'] is Map) {
      data = Map<String, dynamic>.from(result['data'] as Map);
      patients =
          data.entries.map((entry) {
            entry.value["id"] = entry.key;
            return Patient.fromJson(Map<String, dynamic>.from(entry.value));
          }).toList();
    } else {
      patients.clear();
    }
    isLoading.value = false;
  }

  // void navigateToDetailPage(String id) {
  //   Get.to(() => DetailPage(id: id));
  // }

  void addPatient() {
    print(result['message']);
  }
}
