import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 1,
        title: Text("Account", style: TextStyle(color: Colors.cyanAccent)),
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.white),
            onPressed: () {
              /* Future Implementation */
            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/additionals/hridoy.jpg'),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black.withOpacity(0.1),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Kawsar Ahmmed Hridoy",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
            ],
          ),
          _buildListTile(context, Icons.shopping_bag, "My Order", Colors.blue, () {}),
          _buildListTile(context, Icons.delivery_dining, "Premier Delivery", Colors.teal, () {}),
          _buildListTile(context, Icons.person, "My Details", Colors.purple, () {}),
          _buildListTile(context, Icons.location_on, "Address Book", Colors.red, () {}),
          _buildListTile(context, Icons.payment, "Payment Methods", Colors.green, () {}),
          _buildListTile(context, Icons.notifications, "Contact Preferences", Colors.orange, () {}),
          _buildListTile(context, Icons.share, "Social Accounts", Colors.indigo, () {}),
          Divider(),
          _buildListTile(context, Icons.card_giftcard, "Gift Cards & Voucher", Colors.pink, () {}),
          _buildListTile(context, Icons.help_outline, "Need Help?", Colors.brown, () {}),
          _buildListTile(context, Icons.feedback, "Tell Us What You Think", Colors.cyan, () {}),
          _buildListTile(context, Icons.logout, "Sign Out", Colors.blueAccent, () {}),
        ],
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
}
