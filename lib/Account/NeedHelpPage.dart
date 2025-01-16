import 'package:flutter/material.dart';

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
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Help Center🔥"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous page
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
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 24),
              Text(
                "Frequently Asked",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                        color: index % 2 == 0 ? Colors.cyanAccent : Colors.blueAccent,
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
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                          topic['icon'] == 'box'
                              ? Icons.inventory_2
                              : topic['icon'] == 'local_shipping'
                              ? Icons.local_shipping
                              : topic['icon'] == 'credit_card'
                              ? Icons.credit_card
                              : topic['icon'] == 'track_changes'
                              ? Icons.track_changes
                              : topic['icon'] == 'settings'
                              ? Icons.settings
                              : Icons.local_offer,
                          color: Colors.blue,
                        ),
                        title: Text(
                          topic['title']!,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(topic['articles']!),
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
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    backgroundColor: Colors.blue,
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
}
