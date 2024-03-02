import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class CustomAppBar extends StatelessWidget {
  final String text;

  const CustomAppBar({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
      height: 120,
      width: double.infinity,
      decoration: const BoxDecoration(
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
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Spacer(), // Spacer to occupy available space
              Text(
                text,
                textAlign: TextAlign.center, // Align text at the center
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontFamily: 'Tajawal',
                      color: Colors.white,
                    ),
              ),
              Spacer(), // Spacer to occupy available space

              IconButton(
                icon: Icon(Icons.arrow_forward_ios),
                color: Colors.white,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          // Add other widgets as needed
        ],
      ),
    );
  }
}
