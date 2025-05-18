import 'package:get/get.dart';
import 'package:my_patients/core/testData.dart';
import 'package:my_patients/model/patients_page_data.dart';
import 'package:my_patients/view/detailPage/detail_page.dart';

class HomeController extends GetxController {
  var patients = <Patient>[];
  RxBool isLoading = true.obs;

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
