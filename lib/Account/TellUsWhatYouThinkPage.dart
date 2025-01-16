import 'package:flutter/material.dart';

class TellUsWhatYouThinkPage extends StatefulWidget {
  @override
  _TellUsWhatYouThinkPageState createState() => _TellUsWhatYouThinkPageState();
}

class _TellUsWhatYouThinkPageState extends State<TellUsWhatYouThinkPage> {
  final TextEditingController feedbackController = TextEditingController();
  int rating = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Tell Us What You Think"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "We value your feedback!",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.cyan),
            ),
            SizedBox(height: 16),
            Text("Rate your experience:"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(
                    index < rating ? Icons.star : Icons.star_border,
                    color: Colors.amber,
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
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  _submitFeedback(context);
                },
                icon: Icon(Icons.send),
                label: Text("Submit Feedback"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan),
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
        SnackBar(content: Text("Thank you for your feedback!")),
      );
      feedbackController.clear();
      setState(() {
        rating = 3; // Reset rating
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please provide your feedback.")),
      );
    }
  }
}
