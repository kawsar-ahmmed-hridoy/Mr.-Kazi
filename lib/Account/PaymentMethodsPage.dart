import 'package:flutter/material.dart';

class PaymentMethodsPage extends StatelessWidget {
  final Color primaryColor = Color(0xFF26547D);
  final Color secondaryColor = Color(0xFFEF436B);
  final Color accentColor = Color(0xFFFFCE5C);
  final Color backgroundColor = Color(0xFFFFF5EB);
  final Color successColor = Color(0xFF05C793);

  final List<Map<String, dynamic>> paymentMethods = [
    {
      "icon": Icons.credit_card,
      "title": "Credit/Debit Card",
      "subtitle": "**** **** **** 1234",
      "color": Color(0xFF5C80BC),
    },
    {
      "icon": Icons.account_balance_wallet,
      "title": "Wallet",
      "subtitle": "Balance: \$150.00",
      "color": Color(0xFF7DAF8A),
    },
    {
      "icon": Icons.paypal,
      "title": "PayPal",
      "subtitle": "john.doe@example.com",
      "color": Color(0xFF003087),
    },
    {
      "icon": Icons.add_circle_outline,
      "title": "Add New Payment Method",
      "subtitle": "Connect a card or account",
      "color": Color(0xFFEF436B),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("Payment Methods"),
      ),
      body: Container(
        color: backgroundColor,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Manage Your Payment Methods",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: paymentMethods.length,
                itemBuilder: (context, index) {
                  final method = paymentMethods[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 3,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: method['color'],
                        child: Icon(
                          method['icon'],
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        method['title'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                        ),
                      ),
                      subtitle: Text(method['subtitle']),
                      trailing: index == paymentMethods.length - 1
                          ? Icon(Icons.arrow_forward, color: primaryColor)
                          : PopupMenuButton<String>(
                        onSelected: (value) {
                          if (value == "Edit") {
                            // Handle edit action
                          } else if (value == "Remove") {
                            // Handle remove action
                          }
                        },
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            value: "Edit",
                            child: Text("Edit"),
                          ),
                          PopupMenuItem(
                            value: "Remove",
                            child: Text("Remove"),
                          ),
                        ],
                      ),
                      onTap: index == paymentMethods.length - 1
                          ? () {
                        // Navigate to add payment method page
                      }
                          : null,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // Handle add new payment method
                },
                icon: Icon(Icons.add,color: Colors.white,),
                label: Text("Add Payment Method",style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: secondaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
