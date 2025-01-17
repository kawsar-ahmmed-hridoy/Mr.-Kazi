import 'package:flutter/material.dart';

class ContactPreferencesPage extends StatefulWidget {
  @override
  _ContactPreferencesPageState createState() => _ContactPreferencesPageState();
}

class _ContactPreferencesPageState extends State<ContactPreferencesPage> {
  bool emailUpdates = true;
  bool smsUpdates = false;
  bool pushNotifications = true;
  bool promotionalOffers = false;

  final Color secondaryColor = Color(0xFF26547D);
  final Color primaryColor = Color(0xFFEF436B);
  final Color backgroundColor = Color(0xFFFFF5EB);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: Text("Contact Preferences",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Manage Your Contact Preferences",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: secondaryColor,
              ),
            ),
            SizedBox(height: 20),
            _buildSwitchTile(
              title: "Email Updates",
              subtitle: "Receive updates via email",
              value: emailUpdates,
              onChanged: (value) {
                setState(() {
                  emailUpdates = value;
                });
              },
            ),
            _buildSwitchTile(
              title: "SMS Updates",
              subtitle: "Receive updates via SMS",
              value: smsUpdates,
              onChanged: (value) {
                setState(() {
                  smsUpdates = value;
                });
              },
            ),
            _buildSwitchTile(
              title: "Push Notifications",
              subtitle: "Receive notifications on your device",
              value: pushNotifications,
              onChanged: (value) {
                setState(() {
                  pushNotifications = value;
                });
              },
            ),
            _buildSwitchTile(
              title: "Promotional Offers",
              subtitle: "Receive promotional offers and deals",
              value: promotionalOffers,
              onChanged: (value) {
                setState(() {
                  promotionalOffers = value;
                });
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Reset preferences to default state
                    setState(() {
                      emailUpdates = true;
                      smsUpdates = false;
                      pushNotifications = true;
                      promotionalOffers = false;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Preferences reset to default.")),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: secondaryColor,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: Text("Reset to Default",style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Save preferences logic
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Preferences saved successfully!")),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: Text("Save Preferences",style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper method for switch list tile
  Widget _buildSwitchTile({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Card(
      color: backgroundColor,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: SwitchListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        title: Text(title, style: TextStyle(color: Colors.black)),
        subtitle: Text(subtitle, style: TextStyle(color: Colors.grey)),
        value: value,
        onChanged: onChanged,
        activeColor: Colors.blue,
        inactiveThumbColor: Colors.grey,
        inactiveTrackColor: Colors.grey[300],
      ),
    );
  }
}
