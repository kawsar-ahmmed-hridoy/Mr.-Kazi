import 'package:flutter/material.dart';
//import 'package:prac/Community/CommunityPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat App',
      home: ChatListPage(),
    );
  }
}

class ChatListPage extends StatelessWidget {
  final Color primaryColor = Color(0xFF26547D);
  final Color secondaryColor = Color(0xFFEF436B);
  final Color accentColor = Color(0xFFFFCE5C);
  final Color backgroundColor = Color(0xFFFFF5EB);
  final Color successColor = Color(0xFF05C793);
  final List<Map<String, String>> chatList = [
    {"name": "Hridoy", "image": "assets/Community/hridoy.jpg", "lastMessage": "How about these pictures?"},
    {"name": "Rahimul", "image": "assets/Community/rahim.jpg", "lastMessage": "Looks cool!"},
    {"name": "Jawad", "image": "assets/Community/jawad.jpg", "lastMessage": "Can we talk later?"},
    {"name": "Borson", "image": "assets/Community/hridoy.jpg", "lastMessage": "Looks cool!"},
    {"name": "Tajree", "image": "assets/Community/rahim.jpg", "lastMessage": "Looks cool!"},
    {"name": "Shaj", "image": "assets/Community/jawad.jpg", "lastMessage": "Looks cool!"},
    {"name": "Prithi", "image": "assets/Community/rahim.jpg", "lastMessage": "Looks cool!"},
    {"name": "Sadman", "image": "assets/Community/hridoy.jpg", "lastMessage": "Looks cool!"},
    {"name": "Shikha", "image": "assets/Community/rahim.jpg", "lastMessage": "Looks cool!"},
    {"name": "Uthpol", "image": "assets/Community/rahim.jpg", "lastMessage": "Looks cool!"},
    {"name": "Prince", "image": "assets/Community/rahim.jpg", "lastMessage": "Looks cool!"},
    {"name": "Sajib", "image": "assets/Community/rahim.jpg", "lastMessage": "Looks cool!"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {

          },
        ),
        title: Text(
          "Chats",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            foreground: Paint()
              ..shader = LinearGradient(
                colors: [Colors.white, Colors.white],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(Rect.fromLTWH(0, 0, 200, 70)),
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search bar
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.teal.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.white),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search chats",
                        hintStyle: TextStyle(color: Colors.white),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Chat list
            Expanded(
              child: ListView.builder(
                itemCount: chatList.length,
                itemBuilder: (context, index) {
                  final chat = chatList[index];
                  return Container(
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.white, Colors.grey[100]!],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(10),
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(chat["image"]!),
                      ),
                      title: Text(
                        chat["name"]!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.teal[800],
                        ),
                      ),
                      subtitle: Text(
                        chat["lastMessage"]!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      trailing: Icon(Icons.chevron_right, color: Colors.teal[800]),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatDetailsPage(chat: chat),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatDetailsPage extends StatefulWidget {
  final Map<String, String> chat;

  ChatDetailsPage({required this.chat});

  @override
  _ChatDetailsPageState createState() => _ChatDetailsPageState();
}

class _ChatDetailsPageState extends State<ChatDetailsPage> {
  List<Map<String, String>> messages = [
    {"text": "How about these pictures?", "time": "10:30 AM", "isSent": "false"},
    {"text": "Looks cool, can you find more options?", "time": "10:32 AM", "isSent": "true"},
  ];
  final TextEditingController _messageController = TextEditingController();

  void _sendMessage() {
    String messageText = _messageController.text.trim();
    if (messageText.isNotEmpty) {
      setState(() {
        // Add the sent message
        messages.add({"text": messageText, "time": "10:45 AM", "isSent": "true"});
        _messageController.clear();

        // Add a default reply after a short delay
        Future.delayed(Duration(seconds: 1), () {
          setState(() {
            messages.add({"text": "Thank you Sir. If you need anything, don't be shy to reach me.", "time": "10:46 AM", "isSent": "false"});
          });
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(widget.chat["image"]!),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.chat["name"]!,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Text(
                  "Online",
                  style: TextStyle(fontSize: 14, color: Colors.white70),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.call, color: Colors.white),
            onPressed: () {
              // Add action for audio call
            },
          ),
          IconButton(
            icon: Icon(Icons.videocam, color: Colors.white),
            onPressed: () {
              // Add action for video call
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {
              // Add more actions
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Chat messages
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                if (message["isSent"] == "true") {
                  return _buildSentMessage(message["text"]!, message["time"]!);
                } else {
                  return _buildReceivedMessage(message["text"]!, message["time"]!);
                }
              },
            ),
          ),

          // Message input
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildReceivedMessage(String message, String time) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.teal[100],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(message, style: TextStyle(color: Colors.black, fontSize: 16)),
            SizedBox(height: 4),
            Text(time, style: TextStyle(color: Colors.grey[700], fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget _buildSentMessage(String message, String time) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.blueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomLeft: Radius.circular(16),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(message, style: TextStyle(color: Colors.white, fontSize: 16)),
            SizedBox(height: 4),
            Text(time, style: TextStyle(color: Colors.white70, fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      color: Colors.grey[100],
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.emoji_emotions, color: Colors.teal),
            onPressed: () {
              // Add emoji picker action
            },
          ),
          IconButton(
            icon: Icon(Icons.attach_file, color: Colors.teal),
            onPressed: () {
              // Add file attachment action
            },
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.teal.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: TextField(
                controller: _messageController,
                decoration: InputDecoration(
                  hintText: "Write messages...",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send, color: Colors.teal),
            onPressed: _sendMessage,
          ),
        ],
      ),
    );
  }
}


