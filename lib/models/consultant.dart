class Consultant {
  String position;
  double completedPercentage;
  String name;
  String thumbnail;

  Consultant({
    required this.name,
    required this.completedPercentage,
    required this.position,
    required this.thumbnail,
  });
}

List<Consultant> consultants = [
  Consultant(
    name: "رضا العيدروس",
    completedPercentage: .75,
    position: "مستشار مالي",
    thumbnail: "assets/images/reda.png",
  ),
  Consultant(
    name: "محمد الرتوعي",
    completedPercentage: .60,
    position: "مستشار مالي",
    thumbnail: "assets/images/Muhammad.png",
  ),
  Consultant(
    name: "سلطان الشمري ",
    completedPercentage: .75,
    position: "مستشار مالي",
    thumbnail: "assets/images/Sultan.png",
  ),
  Consultant(
    name: " فارس كردي",
    completedPercentage: .75,
    position: " مستشار مالي وإداري",
    thumbnail: "assets/images/fares.png",
  ),
  Consultant(
    name: "عاصم الرحيلي",
    completedPercentage: .60,
    position: " مستشار مالي وإداري",
    thumbnail: "assets/images/Assem.png",
  ),
];
