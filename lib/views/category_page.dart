import '/constants/colors.dart';
import '../models/consultant.dart';
import 'profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'widgets/custom_icon_button.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end, 
              children: [
                Stack(
                  children: [
                     Align(
  child: Padding(
    padding: const EdgeInsets.only(top: 20), 
    child: Text(
      'المالية',
      style: Theme.of(context).textTheme.displayMedium,
    ),
    
  ),
),

                    Positioned(
                      right: 0,
                      child: CustomIconButton(
                        child: const Icon(Icons.arrow_right, color: primaryColorBlue),
                        height: 35,
                        width: 35,
                        onTap: () => Navigator.pop(context),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(vertical: 60),
                    separatorBuilder: (_, __) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    shrinkWrap: true,
                    itemBuilder: (_, int index) {
                      return CourseContainer(
                        consultant: consultants[index],
                      );
                    },
                    itemCount: consultants.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CourseContainer extends StatelessWidget {
  final Consultant consultant;

  const CourseContainer({
    Key? key,
    required this.consultant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfilePage(),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), 
              spreadRadius: 2, 
              blurRadius: 5,
              offset: Offset(0, 3), 
            ),
          ],
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    consultant.name,
                    textAlign: TextAlign.right,
                  ),
                  Text(
                    consultant.position,
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.right,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                consultant.thumbnail,
                height: 60,
                alignment: Alignment.topRight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
