import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:my_patients/controller/user_controller.dart';
import 'package:my_patients/model/detailPageData.dart';
import 'package:my_patients/model/patients_data.dart';

class DetailPageController extends GetxController {
  RxBool edit = false.obs;
  RxDouble rlTension = 0.0.obs;
  RxList<HistoriqueItem> historiquePics = <HistoriqueItem>[].obs;
  RxList<HistoriqueItem> historiqueTension = <HistoriqueItem>[].obs;
  Map<String, dynamic> data = {};
  UserContrller user = Get.find();
  late Patient patient;

  //init textController
  final TextEditingController name = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController age = TextEditingController();
  final TextEditingController antecedent = TextEditingController();

  listentToPatient(String id) {
    
    Patient.listenToPatient(id, user.userID).listen((result) {
      // data = result;
      var patienJson = result["data"];
      if (patienJson["data"] != {}) {
        patienJson["id"] = id;
        // Convert to Map<String, dynamic>
        final patientMap = Map<String, dynamic>.from(patienJson as Map);
        patient = Patient.fromJson(patientMap);
        //get hitsorique pics
        if (patient.historique != null && patient.historique is Map && patient.historique.isNotEmpty) {
          data = Map<String, dynamic>.from(patient.historique as Map);
          historiquePics.value = HistoriqueItem.getHistoriquesList(data);
        }

        // get hitsorique tension
        if (patient.tension != null && patient.tension is Map && patient.tension.isNotEmpty) {
          data = Map<String, dynamic>.from(patient.tension as Map);
          print(data);
          historiqueTension.value = HistoriqueItem.getHistoriquesList(data);
          rlTension.value = historiqueTension.first.tension;
        }

        // rlTension.value = patient.tension;
        // Ensure historique is a Map<String, dynamic>
        // if (patient.historique == null ||
        //     patient.historique == "" ||
        //     patient.historique is! Map) {
        //   historique.value = [];
        // } else {
        //   print(patient.historique);
        //   final hist = Map<String, dynamic>.from((patient.historique as Map).map(
        //     (key, value) => MapEntry(key.toString(), value),
        //   ));
        //   historique.value =
        //       hist.entries.map((entery) {
        //         entery.value["id"] = entery.key;
        //         return HistoriqueItem.fromJson(entery.value);
        //       }).toList();
        // }
      }
    });
  }

  void onEditiPatinet() {
    if (!edit.value) {
      edit.value = true;
      name.text = patient.name;
      lastName.text = patient.lastName;
      age.text = patient.age.toString();
      antecedent.text = patient.antecedent;
    } else {
      print(name.text);
      edit.value = false;
    }
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
