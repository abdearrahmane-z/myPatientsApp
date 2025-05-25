import 'package:get/get.dart';
import 'package:my_patients/controller/user_controller.dart';
import 'package:my_patients/core/data_analyse/data_analyse.dart';
import 'package:my_patients/core/notification/notify_service.dart';
import 'package:my_patients/model/notify_data.dart';

import '../model/patients_data.dart';

class AnalyseTensionController extends GetxController {
  UserContrller user = Get.find();
  double tension = 0.0;
  List<Patient> listeningPatients = [];

  void analyseTension(Patient patient, int index) async {
    // Listen to changes for this patient
    if (listeningPatients.any((p) => p.id == patient.id)) {
      print("Already listening to patient: ${patient.name}");
      // Already listening to this patient
      return;
    }
    print("Listening to patient: ${patient.name}");
    listeningPatients.add(patient);
    Patient.listenToPatientTension(patient.id, user.userID).listen((
      result,
    ) async {
      var rlTension = result["data"];
      if (rlTension != null && rlTension.isNotEmpty && rlTension is Map) {
        // Update tension value
        
        final tensionMap = Map<String, dynamic>.from(rlTension);
        Map<String, dynamic> lastTension =
            tensionMap.isNotEmpty
                ? {tensionMap.keys.first: tensionMap.values.first}
                : {};
        print("Last Tension: $lastTension");
        tension = lastTension.values.first["tension"].toDouble();
        if (0 < tension && tension < DataAnalyse.minTension ||
            tension > DataAnalyse.maxTension) {
          // Generate key in the required format
          final key = lastTension.keys.first;
          // print("Key: $key");
          // print("Tension: $tension");
          // Show local notification
          NotifyService().showNotify(
            id: index,
            title: patient.name,
            body: "Tension anormale: $tension",
          );
          // Add notification and historique in the database
          await Notify.addNotification(
            userID: user.userID,
            key: key,
            notificationMessage: "Tension anormale: $tension",
            patient: patient,
          );
          await Patient.addHistorique(
            userID: user.userID,
            patient: patient,
            key: key,
            tension: tension,
          );
        }


      }
    
    });
  }
}
