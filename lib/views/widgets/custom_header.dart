import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import 'search_text_field.dart';

class CustomHeaderContainer extends StatelessWidget {
  final String title;

  const CustomHeaderContainer({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
      height: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.1, 0.5],
          colors: [
            primaryColorGreen,
            primaryColorGreen,
          ],
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Text(
                  title,
                  textAlign: TextAlign.right,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontFamily: 'Tajawal',
                      ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          SearchTextField(),
        ],
      ),
    );
  }
}
