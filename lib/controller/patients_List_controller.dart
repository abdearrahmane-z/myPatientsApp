import 'package:get/get.dart';
import 'package:my_patients/core/testData.dart';
import 'package:my_patients/model/patients_page_data.dart';

class HomeController extends GetxController {
  var patients = <Patient>[];
  Map<String, dynamic> data = Testdata().json;
  RxBool isLoading = true.obs;
  RxBool isError = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadPatients();
  }

  void loadPatients() {
    isLoading.value = true;
    patients =
        Testdata().json.entries.map((entry) {
          return Patient.fromJson(entry.value);
        }).toList();
    isLoading.value = false;
  }

  // void navigateToDetailPage(String id) {
  //   Get.to(() => DetailPage(id: id));
  // }

  void addPatient() {
    isLoading.value = !isLoading.value;
    
  }
  
}
