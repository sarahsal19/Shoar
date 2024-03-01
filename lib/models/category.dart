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
    thumbnail: 'assets/images/laptop.jpg',
  ),
  Category(
    name: 'المالية',
    noOfConsultants: 20,
    thumbnail: 'assets/images/accounting.jpg',
  ),
  Category(
    name: 'التصوير',
    noOfConsultants: 16,
    thumbnail: 'assets/images/photography.jpg',
  ),
  Category(
    name: 'التصميم',
    noOfConsultants: 25,
    thumbnail: 'assets/images/design.jpg',
  ),
];
