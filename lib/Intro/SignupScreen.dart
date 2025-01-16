import 'package:flutter/material.dart';
import 'package:mr_kazi/Intro/SigninScreen.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? selectedGender;
  bool discountsAndSales = false;
  bool newStuff = false;
  bool yourExclusives = false;
  bool appPartners = false;
  bool termsAccepted = false;
  String? day, month, year;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE4F4FF),
      appBar: AppBar(title: Text("Sign Up", style: TextStyle(color: Colors.cyanAccent),), backgroundColor: Color(0xFF213555),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(controller: _emailController, decoration: InputDecoration(labelText: "Email address", border: OutlineInputBorder(),), validator: (value) {if (value == null || value.isEmpty || !value.contains('@')) {return "Enter a valid email address";}return null;},), SizedBox(height: 16),
                TextFormField(controller: _firstNameController, decoration: InputDecoration(labelText: "First name", border: OutlineInputBorder(),), validator: (value) {if (value == null || value.isEmpty) {return "Enter your first name";}return null;},), SizedBox(height: 16),
                TextFormField(controller: _lastNameController, decoration: InputDecoration(labelText: "Last name", border: OutlineInputBorder(),), validator: (value) {if (value == null || value.isEmpty) {return "Enter your last name";}return null;},), SizedBox(height: 16),
                TextFormField(controller: _passwordController, obscureText: true, decoration: InputDecoration(labelText: "Password", border: OutlineInputBorder(), helperText: "Must be 6 or more characters",), validator: (value) {if (value == null || value.length < 6) {return "Password must be at least 6 characters";}return null;},), SizedBox(height: 16),
                Text("Date of Birth", style: TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DropdownButton<String>(hint: Text("DD"), value: day, items: List.generate(31, (index) {return DropdownMenuItem(value: (index + 1).toString(), child: Text((index + 1).toString()),);}), onChanged: (value) => setState(() => day = value),),
                    DropdownButton<String>(hint: Text("Month"), value: month,
                      items: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"
                      ].map((monthName) {return DropdownMenuItem(value: monthName, child: Text(monthName),);}).toList(), onChanged: (value) => setState(() => month = value),
                    ),
                    DropdownButton<String>(hint: Text("YYYY"), value: year, items: List.generate(50, (index) {return DropdownMenuItem(value: (1975 + index).toString(), child: Text((1975 + index).toString()),);}), onChanged: (value) => setState(() => year = value),),
                  ],
                ),
                SizedBox(height: 16),
                Text("Mostly interested in (optional)", style: TextStyle(fontWeight: FontWeight.bold)),
                Row(children: [Radio(value: "Womenswear", groupValue: selectedGender, onChanged: (value) => setState(() => selectedGender = value as String),), Text("Womenswear"), Radio(value: "Menswear", groupValue: selectedGender, onChanged: (value) => setState(() => selectedGender = value as String),), Text("Menswear"),],),
                Text("Contact Preferences", style: TextStyle(fontWeight: FontWeight.bold)),
                CheckboxListTile(title: Text("Discounts and sales"), value: discountsAndSales, onChanged: (value) => setState(() => discountsAndSales = value!),),
                CheckboxListTile(title: Text("New stuff"), value: newStuff, onChanged: (value) => setState(() => newStuff = value!),),
                CheckboxListTile(title: Text("Your exclusives"), value: yourExclusives, onChanged: (value) => setState(() => yourExclusives = value!),),
                CheckboxListTile(title: Text("App partners"), value: appPartners, onChanged: (value) => setState(() => appPartners = value!),), SizedBox(height: 16),
                CheckboxListTile(title: Text("I agree to the Terms & Conditions"), value: termsAccepted, onChanged: (value) => setState(() => termsAccepted = value!),),
                if (!termsAccepted)Padding(padding: const EdgeInsets.only(left: 16.0), child: Text("You must agree to the Terms & Conditions", style: TextStyle(color: Colors.red, fontSize: 12),),),
                SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {if (_formKey.currentState!.validate() && termsAccepted) {ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Sign Up successful. Now you can Sign In here!")),);Navigator.pop(context);} else if (!termsAccepted) {setState(() {});}},
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, padding: EdgeInsets.symmetric(vertical: 16),),
                    child: Text("Sign up", style: TextStyle(fontSize: 18, color: Colors.white),),
                  ),
                ),
                SizedBox(height: 16),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [Text("Already have an account?"), TextButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => SigninScreen()),);}, child: Text("Sign In", style: TextStyle(color: Colors.blue),),),],),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
