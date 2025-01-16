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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Contact Preferences"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Manage Your Contact Preferences",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            SizedBox(height: 16),
            SwitchListTile(
              title: Text("Email Updates"),
              subtitle: Text("Receive updates via email"),
              value: emailUpdates,
              onChanged: (value) {
                setState(() {
                  emailUpdates = value;
                });
              },
            ),
            SwitchListTile(
              title: Text("SMS Updates"),
              subtitle: Text("Receive updates via SMS"),
              value: smsUpdates,
              onChanged: (value) {
                setState(() {
                  smsUpdates = value;
                });
              },
            ),
            SwitchListTile(
              title: Text("Push Notifications"),
              subtitle: Text("Receive notifications on your device"),
              value: pushNotifications,
              onChanged: (value) {
                setState(() {
                  pushNotifications = value;
                });
              },
            ),
            SwitchListTile(
              title: Text("Promotional Offers"),
              subtitle: Text("Receive promotional offers and deals"),
              value: promotionalOffers,
              onChanged: (value) {
                setState(() {
                  promotionalOffers = value;
                });
              },
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Save preferences logic
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Preferences saved successfully!")),
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                child: Text("Save Preferences"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
