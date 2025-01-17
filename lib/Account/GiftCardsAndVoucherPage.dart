import 'package:flutter/material.dart';

final Color primaryColor = Color(0xFF26547D);
final Color secondaryColor = Color(0xFFEF436B);
final Color accentColor = Color(0xFFFFCE5C);
final Color backgroundColor = Color(0xFFFFF5EB);
final Color successColor = Color(0xFF05C793);

class GiftCardsAndVoucherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous page
          },
        ),
        title: Text(
          "Gift Cards & Vouchers",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        color: backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Gift Cards Section
                Text(
                  "Gift Cards",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                SizedBox(height: 16),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return _buildGiftCardTile(index);
                  },
                ),
                SizedBox(height: 24),

                // Vouchers Section
                Text(
                  "Vouchers",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                SizedBox(height: 16),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return _buildVoucherTile(index);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add functionality for adding a new gift card or voucher
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Feature to add a new gift card or voucher coming soon!"),
              backgroundColor: accentColor,
            ),
          );
        },
        backgroundColor: secondaryColor,
        icon: Icon(Icons.add),
        label: Text("Add New"),
      ),
    );
  }

  Widget _buildGiftCardTile(int index) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: accentColor,
          child: Icon(
            Icons.card_giftcard,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Gift Card #${index + 1}",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text("Expires: 12/31/2025"),
        trailing: ElevatedButton(
          onPressed: () {
            print("Redeem Gift Card #${index + 1}");
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: successColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            "Redeem",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildVoucherTile(int index) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: secondaryColor,
          child: Icon(
            Icons.local_offer,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Voucher #${index + 1}",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text("Expires: 01/31/2026"),
        trailing: ElevatedButton(
          onPressed: () {
            print("Use Voucher #${index + 1}");
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            "Use",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
