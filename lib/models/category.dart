class Category {
  String thumbnail;
  String name;
  int noOfCourses;

  Category({
    required this.name,
    required this.noOfCourses,
    required this.thumbnail,
  });
}

List<Category> categoryList = [
  Category(
    name: 'البرمجة',
    noOfCourses: 55,
    thumbnail: '/assets/images/laptop.jpg',
  ),
  Category(
    name: 'المالية',
    noOfCourses: 20,
    thumbnail: '/assets/images/accounting.jpg',
  ),
  Category(
    name: 'التصوير',
    noOfCourses: 16,
    thumbnail: 'assets/images/photography.jpg',
  ),
  Category(
    name: 'التصميم',
    noOfCourses: 25,
    thumbnail: '/assets/images/design.jpg',
  ),
];
