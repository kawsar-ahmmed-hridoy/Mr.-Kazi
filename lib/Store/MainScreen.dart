import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:mr_kazi/Account/AccountPage.dart';
import 'package:mr_kazi/Community/CommunityPage.dart';
import 'package:mr_kazi/Home/HomePage.dart';


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 1;
  final Color primaryColor = Color(0xFF26547D);

  final List<Widget> _pages = [
    CommunityPage(),
    HomePage(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _pages[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: primaryColor.withOpacity(0.6),
        color: primaryColor,
        buttonBackgroundColor: primaryColor,
        height: 60,
        index: _currentIndex,
        animationDuration: Duration(milliseconds: 300),
        items: <Widget>[
          Icon(Icons.groups_rounded, size: 30, color: Colors.white),
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
