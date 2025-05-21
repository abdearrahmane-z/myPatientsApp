import 'package:firebase_database/firebase_database.dart';

class Notify {
  final String id;
  final String patientName;
  final String notificationMessage;
  final String date;
  final String time;

  Notify({
    required this.id,
    required this.patientName,
    required this.notificationMessage,
    required this.date,
    required this.time,
  });


  factory Notify.fromJson(Map<String, dynamic> json) {
    return Notify(
      id: json['patientId'],
      patientName: json['patient'],
      notificationMessage: json['notificationMessage'],
      date: json['date'],
      time: json['time'],
    );
  }
  static List<Notify> listNotificationFromJson(Map<String, dynamic> json) {
    List<Notify> notifications = [];
    json.forEach((key, value) {
      DateTime date = DateTime.parse(key);
      String formattedDate = '${date.day}-${date.month}-${date.year}';
      String formattedTime = '${date.hour}:${date.minute}';
      value['date'] = formattedDate; 
      value['time'] = formattedTime; 
      notifications.add(Notify.fromJson(value));
    });
    return notifications;
  }

  //get data from firebase
  static Stream<Map<String, dynamic>> getNotification() {

    final ref = FirebaseDatabase.instance.ref('notifications');
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



}
