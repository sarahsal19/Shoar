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
    name: "أحمد الخليل",
    completedPercentage: .75,
    position: "مستشار محافظ مالية",
    thumbnail: "assets/icons/user.png",
  ),
  Consultant(
    name: "محمد العقيل",
    completedPercentage: .60,
    position: "محلل مالي",
    thumbnail: "assets/icons/user.png",
  ),
  Consultant(
    name: "فاطمة الدخيل",
    completedPercentage: .75,
    position: "مدققة مالية",
    thumbnail: "assets/icons/user.png",
  ),
  Consultant(
    name: "يوسف الزايد",
    completedPercentage: .75,
    position: "محاسب",
    thumbnail: "assets/icons/user.png",
  ),
  Consultant(
    name: "لولوة الاحمد",
    completedPercentage: .60,
    position: "مراجعة داخلية",
    thumbnail: "assets/icons/user.png",
  ),
];
