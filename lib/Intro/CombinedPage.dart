import 'package:flutter/material.dart';
import 'Page1.dart';
import 'Page2.dart';
import 'Page3.dart';

class Combinedpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {return Scaffold(body: PageView(children: [Page1(), Page2(), Page3(),],),);
  }
}