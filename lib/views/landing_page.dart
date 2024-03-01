import '/constants/color.dart';
import 'categories_page.dart';
import 'category_page.dart';

import 'package:flutter/material.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    CategoriesScreen(),
    CategoryScreen(),
    CategoriesScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),

  bottomNavigationBar: BottomNavigationBar(
    selectedFontSize: 8,
  selectedIconTheme: IconThemeData(color: primaryColorBlue, size: 30),
  selectedItemColor: primaryColorBlue,
  selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'حسابي',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.chat),
        label: 'المحادثات',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'الصفحة الرئيسية',
      ),
    ],
    currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          }),
    
);  

  }
  
} 
