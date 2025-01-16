import 'package:flutter/material.dart';
import 'package:mr_kazi/Account/AddressBookPage.dart';
import 'package:mr_kazi/Account/ContactPreferencesPage.dart';
import 'package:mr_kazi/Account/GiftCardsAndVoucherPage.dart';
import 'package:mr_kazi/Account/NeedHelpPage.dart';
import 'package:mr_kazi/Account/PremierDeliveryPage.dart';
import 'package:mr_kazi/Account/SocialAccountsPage.dart';
import 'package:mr_kazi/Account/TellUsWhatYouThinkPage.dart';
import 'package:mr_kazi/Intro/SigninScreen.dart';


class AccountPage extends StatelessWidget {
  final Color primaryColor = Color(0xFF26547D);
  final Color secondaryColor = Color(0xFFEF436B);
  final Color accentColor = Color(0xFFFFCE5C);
  final Color backgroundColor = Color(0xFFFFF5EB);
  final Color successColor = Color(0xFF05C793);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Banner with Background Image
            Stack(
              clipBehavior: Clip.none,
              children: [
                // Cover Photo
                Container(
                  height: 220,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/Community/cover.jpg'), // Replace with your cover image
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Circular Profile Image
                Positioned(
                  top: 160, // Adjusted for proper overlap
                  left: MediaQuery.of(context).size.width / 2 - 60, // Center align
                  child: CircleAvatar(radius: 60, backgroundColor: Colors.white, // Border around the avatar
                    child: CircleAvatar(
                      radius: 55,
                      backgroundImage: AssetImage('assets/Community/hridoy.jpg'), // Replace with your profile image
                    ),
                  ),
                ),
                // Settings Icon
                Positioned(
                  top: 20,
                  right: 16,
                  child: IconButton(
                    icon: Icon(Icons.settings, color: Colors.black, size: 28),
                    onPressed: () {
                      // Settings action
                    },
                  ),
                ),
              ],
            ),
            // Profile Name
            SizedBox(height: 60), // Adjust spacing for avatar overlap
            Text(
              "Kawsar Ahmmed Hridoy",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            // Main Content
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(24),
                ),
              ),
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 50.0),
              child: Column(
                children: [
                  SizedBox(height: 16),
                  _buildListTile(context, Icons.shopping_bag, "My Order", Colors.blue, () {}),
                  _buildListTile(context, Icons.delivery_dining, "Premier Delivery", Colors.teal, () {Navigator.push(context, MaterialPageRoute(builder: (context) => PremierDeliveryPage()),);}),
                  _buildListTile(context, Icons.person, "My Details", Colors.purple, () {}),
                  _buildListTile(context, Icons.location_on, "Address Book", Colors.red, () {Navigator.push(context, MaterialPageRoute(builder: (context) => AddressBookPage()),);}),
                  _buildListTile(context, Icons.payment, "Payment Methods", Colors.green, () {}),
                  _buildListTile(context, Icons.notifications, "Contact Preferences", Colors.orange, () {Navigator.push(context, MaterialPageRoute(builder: (context) => ContactPreferencesPage()),);}),
                  _buildListTile(context, Icons.share, "Social Accounts", Colors.indigo, () {Navigator.push(context, MaterialPageRoute(builder: (context) => SocialAccountsPage()),);}),
                  Divider(),
                  _buildListTile(context, Icons.card_giftcard, "Gift Cards & Voucher", Colors.pink, () {Navigator.push(context, MaterialPageRoute(builder: (context) => GiftCardsAndVoucherPage()),);}),
                  _buildListTile(context, Icons.help_outline, "Need Help?", Colors.brown, () {Navigator.push(context, MaterialPageRoute(builder: (context) => NeedHelpPage()),);}),
                  _buildListTile(context, Icons.feedback, "Tell Us What You Think", Colors.cyan, () {Navigator.push(context, MaterialPageRoute(builder: (context) => TellUsWhatYouThinkPage()),);}),
                  _buildListTile(context, Icons.logout, "Sign Out", Colors.blueAccent, () {
                    _showLogoutDialog(context);
                  }),
                  SizedBox(height: 16), // Space at the bottom
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(BuildContext context, IconData icon, String title, Color color, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.logout, size: 48, color: Colors.red),
                const SizedBox(height: 8),
                Text(
                  'Sign Out',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Are you sure you want to Sign Out?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SigninScreen()),);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF44336),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Yes, Sign Out',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () => Navigator.pop(context), // Close the dialog
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
