import 'package:flutter/material.dart';
import 'package:mr_kazi/Intro/SigninScreen.dart';

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50), Image.asset("assets/Initial/payment.png", height: 200), SizedBox(height: 20),
            Text("Payment is easy", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            Text("Secure and fast payment options available."), SizedBox(height: 50),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [_buildDot(false), _buildDot(false), _buildDot(true),],),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => SigninScreen()),);},
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, padding: EdgeInsets.symmetric(vertical: 16), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),),
          child: Text("Get Started", style: TextStyle(fontSize: 18, color: Colors.white,),),
        ),
      ),
    );
  }

  Widget _buildDot(bool isActive) {
    return Container(margin: EdgeInsets.symmetric(horizontal: 5), width: 12, height: 12, decoration: BoxDecoration(color: isActive ? Colors.blue : Colors.grey[300], shape: BoxShape.circle,),);
  }
}
