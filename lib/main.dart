import 'package:flutter/material.dart';
import 'package:mr_kazi/Intro/CombinedPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mr. Kazi",
      theme: ThemeData(primarySwatch: Colors.brown),
      debugShowCheckedModeBanner: false,
      home: Combinedpage(),
    );
  }
}