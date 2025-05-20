import 'package:get/get.dart';
import 'package:my_patients/model/patients_data.dart';

class DetailPageController extends GetxController {
  RxDouble rlTension = 0.0.obs;
  RxMap<dynamic, dynamic> historique = {}.obs;
  Map<String, dynamic> data = {};

  listentToPatient(String id) {
    Patient.testStream(id).listen((result) {
      data = result;
      var patienJson = data["data"];
      if (patienJson["data"] != {}) {
        patienJson["id"] = id;
        Patient patient = Patient.fromJson(patienJson);
        rlTension.value = patient.tension;
        historique.value = patient.historique ?? {};
      }
    });
  }
  // final DetailPageRepository _detailPageRepository;
  // final DetailPageState _state;

  // DetailPageController(this._detailPageRepository, this._state);

  // @override
  // void onInit() {
  //   super.onInit();
  //   fetchDetailData();
  // }

  // void fetchDetailData() async {
  //   try {
  //     _state.isLoading.value = true;
  //     var data = await _detailPageRepository.fetchDetailData();
  //     _state.detailData.value = data;
  //   } catch (e) {
  //     _state.errorMessage.value = e.toString();
  //   } finally {
  //     _state.isLoading.value = false;
  //   }
  // }
}
