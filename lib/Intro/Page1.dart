import 'package:flutter/material.dart';
import 'package:mr_kazi/Intro/Page2.dart';
import 'package:mr_kazi/Intro/SigninScreen.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0, actions: [TextButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => SigninScreen()),);}, child: Text("Skip", style: TextStyle(color: Colors.black, fontSize: 16,),),),],),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50), Image.asset("assets/Initial/explore.png", height: 200), SizedBox(height: 20),
            Text("View product 360 degrees", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),), Text("You can see the product with all angles."),
            SizedBox(height: 50),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [_buildDot(true), _buildDot(false), _buildDot(false),],),
          ],
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.centerRight,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => Page2(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  const begin = Offset(1.0, 0.0);const end = Offset.zero;const curve = Curves.easeInOut;
                  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                  var offsetAnimation = animation.drive(tween);
                  return SlideTransition(position: offsetAnimation, child: child,);
                },
              ),
            );
          },
          backgroundColor: Colors.blue, child: Icon(Icons.arrow_forward_ios, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildDot(bool isActive) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5), width: 12, height: 12,
      decoration: BoxDecoration(color: isActive ? Colors.blue : Colors.grey[300], shape: BoxShape.circle,),
    );
  }
}
