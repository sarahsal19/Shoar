import '/constants/colors.dart';
import 'categories_page.dart';
import 'package:flutter/material.dart';
import 'chat_home.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  int _selectedIndex = 2;

  static const List<Widget> _widgetOptions = <Widget>[
    CategoriesScreen(),
    ChatHomePage(),
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
            TextStyle(
        fontFamily: 'Tajawal', 
      );
          }),
    );
  }
}
