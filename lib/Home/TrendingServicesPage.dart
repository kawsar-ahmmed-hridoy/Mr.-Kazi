import 'package:flutter/material.dart';

class TrendingServicesPage extends StatelessWidget {
  final Color primaryColor = Color(0xFF26547D);
  final Color accentColor = Color(0xFFFFCE5C);
  final Color backgroundColor = Color(0xFFFFF5EB);
  final Color successColor = Color(0xFF05C793);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Trending Services",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: 10, // Example count, replace with dynamic data
          itemBuilder: (context, index) {
            return _trendingService(
              title: "Service ${index + 1}",
              price: "${(20.99 + index * 5).toStringAsFixed(2)}",
              rating: (4.0 + index % 2 * 0.5).toString(),
              imagePath: 'assets/Community/${(index % 6) + 1}.jpg',
            );
          },
        ),
      ),
    );
  }

  Widget _trendingService({
    required String title,
    required String price,
    required String rating,
    required String imagePath,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      padding: EdgeInsets.all(12),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "\$$price",
                  style: TextStyle(fontSize: 16, color: successColor),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(Icons.star, color: accentColor, size: 16),
                    SizedBox(width: 5),
                    Text(
                      rating,
                      style: TextStyle(fontSize: 14, color: primaryColor),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
