import 'package:firebase_database/firebase_database.dart';
import 'package:my_patients/model/notify_data.dart';

class Patient {
  String name;
  String lastName;
  String id;
  int age;
  String gender;
  var tension;
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
      name: json['name']?? "",
      lastName: json['lastName']?? "",
      id: json['id']?? "",
      age: json['age']?? 0,
      gender: json['gender']?? "",
      antecedent: json['antecedent']?? "",
      tension: json['RLTtension']?? {},
      historique: json['historique'] ?? {},
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
      // print(data);
      // Reverse to show last added first
      final reversedEntries = data.entries.toList()
        ..sort((a, b) => b.key.compareTo(a.key));
        // print(reversedEntries); 
      final reversedMap = {for (var e in reversedEntries) e.key: e.value};
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
        "RLTtension": "",
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
      await Notify.removeNotificationsForHistorique(
        userID: userID,
        patient: patient,
      );
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

  static Stream<Map<String, dynamic>> listenToPatient(String patientId, userID) {
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

  static Stream<Map<String, dynamic>> listenToPatientTension(
      String patientId, String userID) {
    final ref = FirebaseDatabase.instance.ref(
      'users/$userID/patients/$patientId/RLTtension',
    ).orderByKey();
    return ref.onValue.map((event) {
      if (event.snapshot.exists) {
        if (event.snapshot.value is Map) {
          final data = Map<String, dynamic>.from(event.snapshot.value as Map);
          // print(data);
          // Reverse to show last added first
          final reversedEntries = data.entries.toList()
            ..sort((a, b) => b.key.compareTo(a.key));
            // print(reversedEntries); 
          final reversedMap = {for (var e in reversedEntries) e.key: e.value};
          // final tensionData = Map<String, dynamic>.from(event.snapshot.value as Map);
          return {"status": "success", "data": reversedMap, "message": ""};
        } else {
          return {"status": "error", "data": {}, "message": "Tension data is not in the expected format"};
        }
      } else {
        return {"status": "error", "data": {}, "message": "No tension data found"};
      }
    });
  }

  static Future<bool> addHistorique({
    required Patient patient,
    required String key,
    required String userID,
    required double tension,
  }) async {
    try {
      final ref = FirebaseDatabase.instance.ref(
        'users/$userID/patients/${patient.id}/historique',
      );

      await ref.child(key).set({"tension": tension});
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
