import 'package:firebase_database/firebase_database.dart';

class Patient {
  String name;
  String lastName;
  String id;
  int age;
  String gender;
  double tension;
  String antecedent;

  var data;

  Patient({
    required this.name,
    required this.lastName,
    required this.id,
    required this.age,
    required this.gender,
    required this.antecedent,
    required this.tension,
    this.data,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      name: json['name'],
      lastName: json['lastName'],
      id: json['id'],
      age: json['age'],
      gender: json['gender'],
      antecedent: json['antecedent'],
      tension: json['RLTtension'].toDouble(),
      data: json['data'],
    );
  }
  static List<Patient> listPatients(Map<String, dynamic> json) {
    var patients = <Patient>[];
    json.forEach((key, value) {
      patients.add(Patient.fromJson(value));
    });
    return patients;
  }

  //get data from firebase
  static Future<Map<String, dynamic>> getData() async {
    Map<String, dynamic> result = {"status": "", "data": {}, "message": ""};
    try {
      final ref = FirebaseDatabase.instance.ref('patients');
      final snapshot = await ref.get();

      if (snapshot.exists) {
        final data = Map<String, dynamic>.from(snapshot.value as Map);
        result['data'] = data;
        result['status'] = "success";
      } else {
        result['status'] = "error";
        result['message'] = "No patients found";
      }
    } catch (e) {
      print('Error fetching patients: $e');
      result['status'] = "error";
      result['message'] = e.toString();
    }
    return result;
  }

  static Future<bool> addPatient({
    required String nom,
    required String prenom,
    required String sexe,
    required String antecedent,
    required int age,
  }) async {
    final databaseRef = FirebaseDatabase.instance.ref();
    try {
      await databaseRef.child("patients").push().set({
        "id": databaseRef.key,
        "name": nom,
        "lastName": prenom,
        "age": age,
        "gender": sexe,
        "antecedent": antecedent,
        "RLTtension": 0,
        "data": "",
      });
      return true;
    } catch (error) {
      print(error);
      return false;
    }
  }

  static Future<bool> removePatient(String patientId) async {
  final databaseRef = FirebaseDatabase.instance.ref();
  try {
    await databaseRef.child("patients").child(patientId).remove();
    return true;
  } catch (error) {
    print('Error removing patient: $error');
    return false;
  }
}
}
