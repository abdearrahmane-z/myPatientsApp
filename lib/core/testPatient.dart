class testPatient {
  String name;
  String details;
  String time;
  String id;
  Map<String, dynamic>? data;

  testPatient({
    required this.name,
    required this.details,
    required this.time,
    required this.id,
    this.data,
  });
}

List<testPatient> patients = [
  testPatient(name: "John Doe", details: "Flu symptoms", time: "10:00 AM", id: "1", data: {"temperature": 98.6}),
  testPatient(name: "Jane Smith", details: "Check-up", time: "11:00 AM", id: "2", data: {"bloodPressure": "120/80"}),
  testPatient(name: "Alice Johnson", details: "Follow-up", time: "12:00 PM", id: "3", data: {"cholesterol": "200"}),
  testPatient(name: "Bob Brown", details: "Blood test", time: "1:00 PM", id: "4", data: {"hemoglobin": "15"}),
  testPatient(name: "Charlie Davis", details: "X-ray", time: "2:00 PM", id: "5", data: {"fracture": "none"}),
  testPatient(name: "Diana Evans", details: "MRI scan", time: "3:00 PM", id: "6", data: {"tumor": "benign"}),
  testPatient(name: "Ethan Foster", details: "Vaccination", time: "4:00 PM", id: "7", data: {"vaccine": "COVID-19"}),
  testPatient(name: "Fiona Green", details: "Physical therapy", time: "5:00 PM", id: "8", data: {"injury": "knee"}),
  testPatient(name: "George Harris", details: "Dental check-up", time: "6:00 PM", id: "9", data: {"cavities": "none"}),
];