class Category {
  final String name;
  final String thumbnail;

  Category({
    required this.name,
    required this.thumbnail,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      name: json['name'],
      thumbnail: json['thumbnail'],
    );
  }
}
