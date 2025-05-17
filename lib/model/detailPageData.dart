class DetailPageData {
  final String id;
  final String name;
  final String age;
  final String gender;

  DetailPageData({
    required this.id,
    required this.name,
    required this.age,
    required this.gender,
  });

  factory DetailPageData.fromJson(Map<String, dynamic> json) {
    return DetailPageData(
      id: json['id'],
      name: json['name'],
      age: json['age'],
      gender: json['gender'],
    );
  }
}
