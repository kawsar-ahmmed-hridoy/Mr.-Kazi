import 'package:flutter/material.dart';

final Color primaryColor = Color(0xFF26547D);
final Color secondaryColor = Color(0xFFEF436B);
final Color accentColor = Color(0xFFFFCE5C);
final Color backgroundColor = Color(0xFFFFF5EB);
final Color successColor = Color(0xFF05C793);

class NeedHelpPage extends StatelessWidget {
  final List<Map<String, String>> faqs = [
    {"question": "How do I cancel an existing order?", "answer": "Go to your orders and select cancel."},
    {"question": "What are the other shipping options?", "answer": "We offer standard and express shipping."},
    {"question": "Where is my refund?", "answer": "Refunds are processed within 7-10 business days."},
  ];

  final List<Map<String, String>> topics = [
    {"title": "Returns and Refunds", "articles": "12 articles", "icon": "box"},
    {"title": "Shipping and Delivery", "articles": "8 articles", "icon": "local_shipping"},
    {"title": "Payments", "articles": "5 articles", "icon": "credit_card"},
    {"title": "Order Tracking", "articles": "6 articles", "icon": "track_changes"},
    {"title": "Account Settings", "articles": "10 articles", "icon": "settings"},
    {"title": "Promotions", "articles": "3 articles", "icon": "local_offer"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("Help Center"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: "Search for topics or questions...",
                  prefixIcon: Icon(Icons.search, color: primaryColor),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 24),
              Text(
                "Frequently Asked",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: primaryColor),
              ),
              SizedBox(height: 8),
              Container(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: faqs.length,
                  itemBuilder: (context, index) {
                    final faq = faqs[index];
                    return Container(
                      width: 200,
                      margin: EdgeInsets.only(right: 16),
                      decoration: BoxDecoration(
                        color: accentColor.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              faq['question']!,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 24),
              Text(
                "Topics",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: primaryColor),
              ),
              SizedBox(height: 8),
              Expanded(
                child: GridView.builder(
                  itemCount: topics.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 2.5,
                  ),
                  itemBuilder: (context, index) {
                    final topic = topics[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 5,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                      child: ListTile(
                        leading: Icon(
                          _getIconForTopic(topic['icon']!),
                          color: primaryColor,
                        ),
                        title: Text(
                          topic['title']!,
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
                        ),
                        subtitle: Text(topic['articles']!, style: TextStyle(color: Colors.grey[700])),
                        onTap: () {
                          // Handle navigation to topic articles
                        },
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle conversation initiation
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Starting a conversation..."),
                        backgroundColor: successColor,
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    backgroundColor: secondaryColor,
                  ),
                  child: Text(
                    "Start a conversation",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getIconForTopic(String icon) {
    switch (icon) {
      case 'box':
        return Icons.inventory_2;
      case 'local_shipping':
        return Icons.local_shipping;
      case 'credit_card':
        return Icons.credit_card;
      case 'track_changes':
        return Icons.track_changes;
      case 'settings':
        return Icons.settings;
      case 'local_offer':
        return Icons.local_offer;
      default:
        return Icons.help_outline;
    }
  }
}
