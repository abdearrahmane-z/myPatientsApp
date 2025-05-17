import 'package:get/get.dart';
import 'package:my_patients/view/detailPage/detail_page.dart';

class NotificationController  extends GetxController {

  Map<String, Map<String, String>> notification = {
    "PatientID1": {"patient":"Patient 1","title": "Appointment ", "time": "10:00 AM", "date": "2023-10-01"},
    "PatientID2": {"patient":"Patient 2","title": "Appointment ", "time": "11:00 AM", "date": "2023-10-01"},
    "PatientID3": {"patient":"Patient 3","title": "Appointment ", "time": "12:00 PM", "date": "2023-10-01"},
    "PatientID4": {"patient":"Patient 4","title": "Appointment ", "time": "1:00 PM", "date": "2023-10-01"},
    "PatientID5": {"patient":"Patient 5","title": "Appointment ", "time": "2:00 sPM", "date": "2023-10-01"},
  };

  void onNotificationTap(String patientID) {
    Get.to(DetailPage(id: patientID));
  }

  // List<String> notification = [];
}