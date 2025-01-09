import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class CommunityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Community"),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Text(
          "Community Page",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}