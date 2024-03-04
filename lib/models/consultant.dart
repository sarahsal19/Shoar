class Consultant {
  final String name;
  final String position;
  final String thumbnail;

  Consultant({
    required this.name,
    required this.position,
    required this.thumbnail,
  });

  factory Consultant.fromJson(Map<String, dynamic> json) {
    return Consultant(
      name: json['name'],
      position: json['position'],
      thumbnail: json['thumbnail'],
    );
  }
}
