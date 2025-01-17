import 'package:flutter/material.dart';

final Color primaryColor = Color(0xFF26547D);
final Color secondaryColor = Color(0xFFEF436B);
final Color accentColor = Color(0xFFFFCE5C);
final Color backgroundColor = Color(0xFFFFF5EB);
final Color successColor = Color(0xFF05C793);

class SocialAccountsPage extends StatefulWidget {
  @override
  _SocialAccountsPageState createState() => _SocialAccountsPageState();
}

class _SocialAccountsPageState extends State<SocialAccountsPage> {
  Map<String, bool> accounts = {
    "Facebook": true,
    "Twitter": false,
    "Instagram": true,
    "LinkedIn": false,
    "YouTube": false,
    "TikTok": true,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("Social Accounts"),
      ),
      body: Container(
        color: backgroundColor,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Manage Your Social Media Accounts",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                SizedBox(height: 16),
                ...accounts.entries.map((entry) {
                  return _buildAccountTile(
                    entry.key,
                    _getIconForPlatform(entry.key),
                    entry.value,
                        () {
                      setState(() {
                        accounts[entry.key] = !entry.value;
                      });
                    },
                  );
                }).toList(),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Save social accounts logic
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Social accounts updated!"),
                          backgroundColor: successColor,
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: secondaryColor,
                      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    ),
                    child: Text(
                      "Save Changes",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAccountTile(
      String platform,
      IconData icon,
      bool connected,
      VoidCallback onToggle,
      ) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: accentColor,
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(
          platform,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          connected ? "Connected" : "Not Connected",
          style: TextStyle(color: connected ? successColor : secondaryColor),
        ),
        trailing: ElevatedButton(
          onPressed: onToggle,
          style: ElevatedButton.styleFrom(
            backgroundColor: connected ? secondaryColor : successColor,
          ),
          child: Text(
            connected ? "Disconnect" : "Connect",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  IconData _getIconForPlatform(String platform) {
    switch (platform) {
      case "Facebook":
        return Icons.facebook;
      case "Twitter":
        return Icons.sensor_occupied;
      case "Instagram":
        return Icons.camera_alt;
      case "LinkedIn":
        return Icons.work;
      case "YouTube":
        return Icons.video_library;
      case "TikTok":
        return Icons.music_note;
      default:
        return Icons.device_hub;
    }
  }
}
