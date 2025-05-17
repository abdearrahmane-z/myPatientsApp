class NotifyPageData {
  final String id;
  final String patientName;
  final String notificationMessage;
  final String date;
  final String time;

  NotifyPageData({
    required this.id,
    required this.patientName,
    required this.notificationMessage,
    required this.date,
    required this.time,
  });
  factory NotifyPageData.fromJson(Map<String, dynamic> json) {
    return NotifyPageData(
      id: json['id'],
      patientName: json['patientName'],
      notificationMessage: json['notificationMessage'],
      date: json['date'],
      time: json['time'],
    );
  }

  
}
