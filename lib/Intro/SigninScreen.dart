import 'package:flutter/material.dart';
import 'package:mr_kazi/Store/MainScreen.dart';
import 'SignupScreen.dart';

class SigninScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFE3E3),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(flex: 1, child: Container(margin: EdgeInsets.only(bottom: 50), color: Color(0xFFFFE3E3), child: Center(child: Image.asset("assets/Home/kazi.png", width: 220, height: 150,),),),),
                  Expanded(flex: 1, child: Container(color: Color(0xFFC9E9D2)),),
                ],
              ),
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.only(top: 150,left: 20,right: 20,bottom: 20),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 4),),],),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Welcome to Mr. Kazi!", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF213555),),), SizedBox(height: 14),
                          TextField(decoration: InputDecoration(labelText: "Email", border: OutlineInputBorder(),), style: TextStyle(fontSize: 12),), SizedBox(height: 10),
                          TextField(obscureText: true, decoration: InputDecoration(labelText: "Password", border: OutlineInputBorder(),), style: TextStyle(fontSize: 12),), SizedBox(height: 10),
                          ElevatedButton(onPressed: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainScreen()),);},
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),), padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15,),),
                            child: Text("Sign In", style: TextStyle(fontSize: 15, color: Colors.white,),),
                          ),
                        ],
                      ),
                    ),
                    // Forgot Password link
                    Align(alignment: Alignment.centerRight, child: Padding(padding: EdgeInsets.only(top: 1, right: 50), child: TextButton(onPressed: () {/*future e krbo*/}, child: Text("Forgot Password?", style: TextStyle(color: Colors.blue),),),),), SizedBox(height: 15),
                    Text("Or sign in with"), SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 40, height: 40, child: IconButton(icon: Image.asset("assets/icons/google.png", fit: BoxFit.contain,), onPressed: () {/*future e krbo*/},),),
                        SizedBox(width: 40, height: 40, child: IconButton(icon: Image.asset("assets/icons/facebook.png", fit: BoxFit.contain,), onPressed: () {/*future e krbo*/},),),
                        SizedBox(width: 40, height: 40, child: IconButton(icon: Image.asset("assets/icons/x.png", fit: BoxFit.contain,), onPressed: () {/*future e krbo*/},),),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [Text("Not have an account?"), TextButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen(),),);}, child: Text("Signup!", style: TextStyle(color: Colors.blue),),),],),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
