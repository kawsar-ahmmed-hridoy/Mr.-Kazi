import 'package:flutter/material.dart';

class SocialAccountsPage extends StatefulWidget {
  @override
  _SocialAccountsPageState createState() => _SocialAccountsPageState();
}

class _SocialAccountsPageState extends State<SocialAccountsPage> {
  bool facebookConnected = true;
  bool twitterConnected = false;
  bool instagramConnected = true;
  bool linkedinConnected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("Social Accounts"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Manage Your Social Media Accounts",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            SizedBox(height: 16),
            _buildAccountTile(
              context,
              "Facebook",
              Icons.facebook,
              Colors.blue,
              facebookConnected,
                  () {
                setState(() {
                  facebookConnected = !facebookConnected;
                });
              },
            ),
            _buildAccountTile(
              context,
              "Twitter",
              Icons.sensor_occupied,
              Colors.lightBlue,
              twitterConnected,
                  () {
                setState(() {
                  twitterConnected = !twitterConnected;
                });
              },
            ),
            _buildAccountTile(
              context,
              "Instagram",
              Icons.camera_alt,
              Colors.pink,
              instagramConnected,
                  () {
                setState(() {
                  instagramConnected = !instagramConnected;
                });
              },
            ),
            _buildAccountTile(
              context,
              "LinkedIn",
              Icons.work,
              Colors.blueAccent,
              linkedinConnected,
                  () {
                setState(() {
                  linkedinConnected = !linkedinConnected;
                });
              },
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Save social accounts logic
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Social accounts updated!")),
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
                child: Text("Save Changes"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountTile(
      BuildContext context,
      String platform,
      IconData icon,
      Color iconColor,
      bool connected,
      VoidCallback onToggle,
      ) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: iconColor),
        title: Text(platform),
        subtitle: Text(connected ? "Connected" : "Not Connected"),
        trailing: ElevatedButton(
          onPressed: onToggle,
          style: ElevatedButton.styleFrom(
            backgroundColor: connected ? Colors.red : Colors.green,
          ),
          child: Text(connected ? "Disconnect" : "Connect"),
        ),
      ),
    );
  }
}
