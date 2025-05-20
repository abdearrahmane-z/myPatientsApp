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
      id: json['id'],
      patientName: json['patient'],
      notificationMessage: json['notificationMessage'],
      date: json['date'],
      time: json['time'],
    );
  }
  static List<Notify> ListNotificationFromJson(Map<String, dynamic> json) {
    List<Notify> notifications = [];
    json.forEach((key, value) {
      value['id'] = key; // Add the key as the id
      print(value);
      notifications.add(Notify.fromJson(value));
    });
    return notifications;
  }

  //get data from firebase
  static Future<Map<String, dynamic>> getNotification() async {
    Map<String, dynamic> result = {"status": "", "data": {}, "message": ""};
    try {
      final ref = FirebaseDatabase.instance.ref('notifications');
      final snapshot = await ref.get();

      if (snapshot.exists) {
        final data = Map<String, dynamic>.from(snapshot.value as Map);
        result['data'] = data;
        result['status'] = "success";
      } else {
        result['status'] = "error";
        result['message'] = "No notifications found";
      }
    } catch (e) {
      print('Error fetching notifications: $e');
      result['status'] = "error";
      result['message'] = e.toString();
    }
    return result;
  }



}
