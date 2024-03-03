import '/constants/colors.dart';
import '/models/category.dart';
import 'ai_page.dart';
import 'consultants_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'widgets/custom_header.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Column(
          children: const [
            AppBar(),
            Body(),
          ],
        ),
floatingActionButton: FloatingActionButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DescriptionPage(),
      ),
    );
  },
  backgroundColor: primaryColorTurquoise.withOpacity(0.50), // Adjust the opacity as needed
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(50.0),
  ),
  child: Container( // Wrap the Text in a Container for padding and styling
    padding: EdgeInsets.all(8.0), // Adjust the padding as needed
    child: Text(
      'ارشدني',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold, 
        fontSize: 10,
        fontFamily: 'Tajawal',
      ),
    ),
  ),
),
floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  "المزيد",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: primaryColorBlue,
                        fontFamily: 'Tajawal',
                      ),
                ),
              ),
              Text(
                "الأقسام",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: primaryColorBlue,
                      fontFamily: 'Tajawal',
                    ),
              ),
            ],
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            crossAxisSpacing: 20,
            mainAxisSpacing: 24,
          ),
          itemBuilder: (context, index) {
            return CategoryCard(
              category: categoryList[index],
            );
          },
          itemCount: categoryList.length,
        ),
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  final Category category;
  const CategoryCard({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CategoryScreen(),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 4.0,
              spreadRadius: .05,
            ), //BoxShadow
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              category.name,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontFamily: 'Tajawal',
                  ),
            ),
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                category.thumbnail,
                height: 170,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomHeaderContainer(
      title: "مرحبا, أفنان",
    );
  }
}
