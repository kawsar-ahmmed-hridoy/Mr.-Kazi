import 'package:flutter/material.dart';

class TellUsWhatYouThinkPage extends StatefulWidget {
  @override
  _TellUsWhatYouThinkPageState createState() => _TellUsWhatYouThinkPageState();
}

class _TellUsWhatYouThinkPageState extends State<TellUsWhatYouThinkPage> {
  final TextEditingController feedbackController = TextEditingController();
  int rating = 3;
  String selectedCategory = "General";
  bool subscribeNewsletter = false;

  final Color primaryColor = Color(0xFF26547D);
  final Color secondaryColor = Color(0xFFEF436B);
  final Color accentColor = Color(0xFFFFCE5C);
  final Color backgroundColor = Color(0xFFFFF5EB);
  final Color successColor = Color(0xFF05C793);

  final List<String> categories = [
    "General",
    "Feature Request",
    "Bug Report",
    "Customer Support",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("Tell Us What You Think",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: Container(
        color: backgroundColor,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "We value your feedback!",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            SizedBox(height: 16),
            Text("Select a category:", style: TextStyle(color: primaryColor)),
            SizedBox(height: 8),
            Wrap(
              spacing: 8.0,
              children: categories.map((category) {
                return ChoiceChip(
                  label: Text(category),
                  selected: selectedCategory == category,
                  onSelected: (selected) {
                    setState(() {
                      selectedCategory = category;
                    });
                  },
                  selectedColor: accentColor,
                  backgroundColor: Colors.grey[200],
                  labelStyle: TextStyle(
                    color: selectedCategory == category ? Colors.white : primaryColor,
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            Text("Rate your experience:", style: TextStyle(color: primaryColor)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(
                    index < rating ? Icons.star : Icons.star_border,
                    color: accentColor,
                  ),
                  onPressed: () {
                    setState(() {
                      rating = index + 1;
                    });
                  },
                );
              }),
            ),
            SizedBox(height: 16),
            TextField(
              controller: feedbackController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: "Write your feedback here...",
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Checkbox(
                  value: subscribeNewsletter,
                  onChanged: (value) {
                    setState(() {
                      subscribeNewsletter = value!;
                    });
                  },
                ),
                Text("Subscribe to our newsletter", style: TextStyle(color: primaryColor))
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  _submitFeedback(context);
                },
                icon: Icon(Icons.send,color: Colors.white),
                label: Text("Submit Feedback",style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: successColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitFeedback(BuildContext context) {
    String feedback = feedbackController.text.trim();
    if (feedback.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Thank you for your feedback!"),
          backgroundColor: successColor,
        ),
      );
      feedbackController.clear();
      setState(() {
        rating = 3; // Reset rating
        selectedCategory = "General"; // Reset category
        subscribeNewsletter = false; // Reset newsletter subscription
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please provide your feedback."),
          backgroundColor: secondaryColor,
        ),
      );
    }
  }
}
