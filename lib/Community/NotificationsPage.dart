import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final Color primaryColor = Color(0xFF26547D);
  final Color secondaryColor = Color(0xFFEF436B);
  final Color accentColor = Color(0xFFFFCE5C);
  final Color backgroundColor = Color(0xFFFFF5EB);
  final Color successColor = Color(0xFF05C793);

  List<Map<String, String>> notifications = List.generate(
    10,
        (index) => {
      'title': 'Notification Title $index',
      'message': 'This is a brief message for notification $index.',
      'date': 'Jan 17, 2025',
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notifications",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: primaryColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: notifications.isEmpty
            ? Center(
          child: Text(
            "No Notifications",
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
        )
            : ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            final notification = notifications[index];
            return NotificationCard(
              title: notification['title']!,
              message: notification['message']!,
              date: notification['date']!,
              primaryColor: primaryColor,
              secondaryColor: secondaryColor,
              backgroundColor: backgroundColor,
              successColor: successColor,
              onDismiss: () {
                setState(() {
                  notifications.removeAt(index);
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Notification dismissed"),
                    backgroundColor: successColor,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String title;
  final String message;
  final String date;
  final Color primaryColor;
  final Color secondaryColor;
  final Color backgroundColor;
  final Color successColor;
  final VoidCallback onDismiss;

  NotificationCard({
    required this.title,
    required this.message,
    required this.date,
    required this.primaryColor,
    required this.secondaryColor,
    required this.backgroundColor,
    required this.successColor,
    required this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: primaryColor,
          child: Icon(Icons.notifications, color: Colors.white),
        ),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, color: primaryColor),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5),
            Text(
              message,
              style: TextStyle(color: Colors.grey[700]),
            ),
            SizedBox(height: 5),
            Text(
              date,
              style: TextStyle(color: secondaryColor, fontSize: 12),
            ),
          ],
        ),
        trailing: IconButton(
          icon: Icon(Icons.clear, color: secondaryColor),
          onPressed: onDismiss,
        ),
      ),
    );
  }
}
