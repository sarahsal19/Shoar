import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(fontSize: 15), // Adjust the font size as needed
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 9, horizontal: 14), 
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.grey,
          size: 20,
        ),

        // helperText: "Search your topic",
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelText: "ابحث عن القسم او الاستشاري",
        labelStyle: const TextStyle(fontSize: 15, color: Colors.grey),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        isDense: true,
      ),
    );
  }
}
