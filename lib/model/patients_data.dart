import 'package:firebase_database/firebase_database.dart';
import 'package:my_patients/model/notify_data.dart';

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
  static Stream<Map<String, dynamic>> getData(String userID) {
    final ref = FirebaseDatabase.instance.ref('users/$userID/patients');
    return ref.onValue.map((event) {
      if (event.snapshot.exists) {
        final data = Map<String, dynamic>.from(event.snapshot.value as Map);
        // Reverse to show last added first
        final reversedEntries = data.entries.toList().reversed;
        final reversedMap = {for (var e in reversedEntries) e.key: e.value};
        print(reversedMap);
        return {"status": "success", "data": reversedMap, "message": ""};
      } else {
        return {"status": "error", "data": {}, "message": "No patients found"};
      }
    });
  }

  static Future<bool> addPatient({
    required String userID,
    required String nom,
    required String prenom,
    required String sexe,
    required String antecedent,
    required int age,
  }) async {
    final databaseRef = FirebaseDatabase.instance.ref();
    try {
      await databaseRef.child("users/$userID/patients").push().set({
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

  static Future<bool> removePatient(Patient patient, userID) async {
    final databaseRef = FirebaseDatabase.instance.ref();
    try {
      await Notify.removeNotificationsForHistorique(userID: userID, patient: patient);
      await databaseRef
          .child("users/$userID/patients")
          .child(patient.id)
          .remove();
      return true;
    } catch (error) {
      print('Error removing patient: $error');
      return false;
    }
  }

  static Stream<Map<String, dynamic>> testStream(String patientId, userID) {
    final ref = FirebaseDatabase.instance.ref(
      'users/$userID/patients/$patientId',
    );
    return ref.onValue.map((event) {
      if (event.snapshot.exists) {
        final data = Map<String, dynamic>.from(event.snapshot.value as Map);
        return {"status": "success", "data": data, "message": ""};
      } else {
        return {"status": "error", "data": {}, "message": "No patients found"};
      }
    });
  }

  static Future<bool> addHistorique({
    required Patient patient,
    required String key,
    required String userID,
  }) async {
    try {
      final ref = FirebaseDatabase.instance.ref(
        'users/$userID/patients/${patient.id}/historique',
      );

      await ref.child(key).set({"tension": patient.tension});
      return true;
    } catch (e) {
      print('Error adding historique: $e');
      return false;
    }
  }

  // static Stream<Patient?> listenToPatientById(String patientId) {
  //   final ref = FirebaseDatabase.instance.ref('patients/$patientId');
  //   return ref.onValue.map((event) {
  //     if (event.snapshot.exists) {
  //       final data = Map<String, dynamic>.from(event.snapshot.value as Map);
  //       return Patient.fromJson(data);
  //     } else {
  //       return null;
  //     }
  //   });
  // }
}
