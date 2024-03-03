class Category {
  String thumbnail;
  String name;
  int noOfConsultants;

  Category({
    required this.name,
    required this.noOfConsultants,
    required this.thumbnail,
  });
}

List<Category> categoryList = [
  Category(
    name: 'البرمجة',
    noOfConsultants: 55,
    thumbnail: 'assets/images/it.png',
  ),
  Category(
    name: 'المالية',
    noOfConsultants: 20,
    thumbnail: 'assets/images/finance.png',
  ),
  Category(
    name: 'القانون',
    noOfConsultants: 16,
    thumbnail: 'assets/images/law.png',
  ),
  Category(
    name: 'العمارة و البناء',
    noOfConsultants: 25,
    thumbnail: 'assets/images/architecture.png',
  ),
];
