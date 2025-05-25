class HistoriqueItem {
  final String id;
  final double tension;
  final String date;
  final String time;

  HistoriqueItem({
    required this.id,
    required this.tension,
    required this.date,
    required this.time,
  });

  factory HistoriqueItem.fromJson(Map<String, dynamic> json) {
    DateTime date = DateTime.parse(json['id']);
    String formattedDate = '${date.day}-${date.month}-${date.year}';
    String formattedTime = '${date.hour}:${date.minute}';
    return HistoriqueItem(
      id: json['id'] ?? "",
      tension: json['tension'].toDouble() ?? 0.0,
      date: formattedDate,
      time: formattedTime,
    );
  }

  static List<HistoriqueItem> getHistoriquesList(Map<String, dynamic> data) {
      final reversedEntries = data.entries.toList()
        ..sort((a, b) => b.key.compareTo(a.key));
        // print(reversedEntries); 
      final reversedMap = {for (var e in reversedEntries) e.key: e.value};
    List<HistoriqueItem> listData = reversedMap.entries.map((entry) {
      entry.value['id'] = entry.key;
      return HistoriqueItem.fromJson(
        Map<String, dynamic>.from(entry.value),
      );
    }).toList();
    return listData;
  }
}
