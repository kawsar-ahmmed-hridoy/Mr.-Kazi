import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyDetailsPage extends StatefulWidget {
  @override
  _MyDetailsPageState createState() => _MyDetailsPageState();
}

class _MyDetailsPageState extends State<MyDetailsPage> {
  final Color primaryColor = Color(0xFF26547D);
  final Color secondaryColor = Color(0xFFEF436B);
  final Color accentColor = Color(0xFFFFCE5C);
  final Color backgroundColor = Color(0xFFFFF5EB);
  final Color successColor = Color(0xFF05C793);

  String name = "Kawsar Ahmmed Hridoy";
  String email = "kawsarhridoy0146@gmail.com";
  String phone = "+8801714440146";
  String address = "Gopalpur, Tangail, Dhaka, Bangladesh";
  String profilePhotoUrl = 'assets/Community/hridoy.jpg'; // Initial profile photo

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    nameController.text = name;
    emailController.text = email;
    phoneController.text = phone;
    addressController.text = address;
  }

  void saveDetails() {
    setState(() {
      name = nameController.text;
      email = emailController.text;
      phone = phoneController.text;
      address = addressController.text;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Details updated successfully!"),
        backgroundColor: successColor,
      ),
    );
  }

  Future<void> _changePhoto() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        profilePhotoUrl = image.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text("My Details",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Image with Change Option
            GestureDetector(
              onTap: _changePhoto, // Allow tapping on the image to change it
              child: Container(
                padding: EdgeInsets.all(16),
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 55,
                    backgroundImage: profilePhotoUrl.contains('assets')
                        ? AssetImage(profilePhotoUrl) // Default profile photo
                        : FileImage(profilePhotoUrl as File) as ImageProvider,
                  ),
                ),
              ),
            ),
            // Editable Fields Section
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildEditableField("Name", nameController),
                  SizedBox(height: 16),
                  _buildEditableField("Email", emailController),
                  SizedBox(height: 16),
                  _buildEditableField("Phone", phoneController),
                  SizedBox(height: 16),
                  _buildEditableField("Address", addressController),
                  SizedBox(height: 16),
                  // Save Button
                  Center(
                    child: ElevatedButton(
                      onPressed: saveDetails,
                      child: Text("Save Changes"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: successColor,
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEditableField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: primaryColor),
        ),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: "Enter $label",
            border: OutlineInputBorder(),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
