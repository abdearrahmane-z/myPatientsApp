import 'package:firebase_database/firebase_database.dart';

class Patient {
  String name;
  String lastName;
  String id;
  int age;
  String gender;
  double tension;
  String antecedent;

  var historique;

  Patient({
    required this.name,
    required this.lastName,
    required this.id,
    required this.age,
    required this.gender,
    required this.antecedent,
    required this.tension,
    this.historique,
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
      historique: json['historique'],
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
  static Stream<Map<String, dynamic>> getData() {
    final ref = FirebaseDatabase.instance.ref('patients');
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
        "historique": "",
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

static Stream<Map<String, dynamic>> testStream(String patientId){
  final ref = FirebaseDatabase.instance.ref('patients/$patientId');
    return ref.onValue.map((event) {
    if (event.snapshot.exists) {
      final data = Map<String, dynamic>.from(event.snapshot.value as Map);
      return {
        "status": "success",
        "data": data,
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
static Stream<Patient?> listenToPatientById(String patientId) {
  final ref = FirebaseDatabase.instance.ref('patients/$patientId');
  return ref.onValue.map((event) {
    if (event.snapshot.exists) {
      final data = Map<String, dynamic>.from(event.snapshot.value as Map);
      return Patient.fromJson(data);
    } else {
      return null;
    }
  });
}
}
