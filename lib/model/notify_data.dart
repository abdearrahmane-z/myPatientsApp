import 'package:firebase_database/firebase_database.dart';
import 'package:my_patients/model/patients_data.dart';

class Notify {
  final String id;
  final String patientID;
  final String patientName;
  final String notificationMessage;
  final String date;
  final String time;

  Notify({
    required this.id,
    required this.patientID,
    required this.patientName,
    required this.notificationMessage,
    required this.date,
    required this.time,
  });


  factory Notify.fromJson(Map<String, dynamic> json) {
    return Notify(
      id: json['id'],
      patientID: json['patientId'],
      patientName: json['patient'],
      notificationMessage: json['notificationMessage'],
      date: json['date'],
      time: json['time'],
    );
  }
  // static List<Notify> listNotificationFromJson(Map<String, dynamic> json) {
  //   List<Notify> notifications = [];
  //   json.forEach((key, value) {
  //     DateTime date = DateTime.parse(key);
  //     String formattedDate = '${date.day}-${date.month}-${date.year}';
  //     String formattedTime = '${date.hour}:${date.minute}';
  //     value['date'] = formattedDate; 
  //     value['time'] = formattedTime; 
  //     notifications.add(Notify.fromJson(value));
  //   });
  //   return notifications;
  // }

  //get data from firebase
  static Stream<Map<String, dynamic>> getNotification(userID) {

    final ref = FirebaseDatabase.instance.ref('users/$userID/notifications');
        return ref.onValue.map((event) {
    if (event.snapshot.exists) {
      final data = Map<String, dynamic>.from(event.snapshot.value as Map);
      // Reverse to show last added first
      final reversedEntries = data.entries.toList().reversed;
      final reversedMap = {for (var e in reversedEntries) e.key: e.value};
      return {
        "status": "success",
        "data": reversedMap,
        "message": "",
      };
    } else {
      return {
        "status": "error",
        "data": {},
        "message": "No patients found",
      };
    }
  });
}

static Future<bool> addNotification({
  required String notificationMessage,
  required Patient patient,
  required String key,
  required String userID
}) async {
  try {
    final ref = FirebaseDatabase.instance.ref('users/$userID/notifications');
    await ref.child(key).set({
      "notificationMessage": notificationMessage,
      "patient": patient.name,
      "patientId": patient.id,
    });
    return true;
  } catch (e) {
    print('Error adding notification: $e');
    return false;
  }
}


static Future<void> removeNotificationsForHistorique({
  required String userID,
  required Patient patient,
}) async {
  final databaseRef = FirebaseDatabase.instance.ref();
  if (patient.historique != null && patient.historique is Map) {
    final historiques = Map<String, dynamic>.from(patient.historique);
    for (final key in historiques.keys) {
      // Remove notification with the same key as historique
      await databaseRef.child("users/$userID/notifications").child(key).remove();
    }
  }
}





}
