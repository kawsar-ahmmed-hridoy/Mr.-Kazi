import 'dart:async';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class Kazi_AI extends StatefulWidget {
  const Kazi_AI({Key? key}) : super(key: key);

  @override
  State<Kazi_AI> createState() => _Kazi_AIState();
}

class _Kazi_AIState extends State<Kazi_AI> {
  final Color primaryColor = Color(0xFF26547D);
  final Color backgroundColor = Color(0xFFFFF5EB);
  final Color successColor = Color(0xFF05C793);
  final List<Map<String, dynamic>> _chatMessages = []; // Chat messages
  final TextEditingController _messageController = TextEditingController();
  String? _attachedFileName;
  String? _attachedFileType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 5.0,
        backgroundColor: primaryColor,
        title: const Text(
          "Mr. Kazi.AI",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () {
              // Handle settings
            },
            tooltip: "Settings",
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white, Colors.white],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          // Semi-transparent image
          Center(
            child: Opacity(
              opacity: 0.3,
              child: Image.asset(
                'assets/Home/kazi.png',
                width: 300,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Main content
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(12.0),
                  itemCount: _chatMessages.length,
                  itemBuilder: (context, index) {
                    final message = _chatMessages[index];
                    return ChatBubble(
                      message: message['text'],
                      isUser: message['isUser'],
                    );
                  },
                ),
              ),
              // Input Area
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.8),
                  border: Border(
                    top: BorderSide(color: Colors.grey.shade300, width: 1.0),
                  ),
                ),
                child: Row(
                  children: [
                    _actionButton(
                      Icons.mic,
                      "Voice Input",
                          () => _requestMicrophonePermission(context),
                    ),
                    _actionButton(
                      Icons.photo_camera,
                      "Attach Photo",
                          () => _pickFile(context, ["jpg", "png", "jpeg"]),
                    ),
                    _actionButton(
                      Icons.videocam,
                      "Attach Video",
                          () => _pickFile(context, ["mp4", "mov"]),
                    ),
                    _actionButton(
                      Icons.picture_as_pdf,
                      "Attach PDF",
                          () => _pickFile(context, ["pdf"]),
                    ),
                    Expanded(
                      child: TextField(
                        controller: _messageController,
                        decoration: InputDecoration(
                          hintText: "Type your message...",
                          hintStyle: TextStyle(color: Colors.grey[500]),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 12.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    ElevatedButton(
                      onPressed: _sendMessage,
                      style: ElevatedButton.styleFrom(
                        elevation: 3,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                      ),
                      child: const Icon(Icons.send, color: Colors.blue,),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _actionButton(IconData icon, String tooltip, VoidCallback onPressed) {
    return IconButton(
      icon: Icon(icon, color: Colors.white),
      onPressed: onPressed,
      tooltip: tooltip,
    );
  }

  Future<void> _pickFile(BuildContext context, List<String> allowedExtensions) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: allowedExtensions,
      );
      if (result != null) {
        setState(() {
          _attachedFileName = result.files.single.name;
          _attachedFileType = result.files.single.extension;
        });

        _showSnackbar(context, "File attached: $_attachedFileName");
      } else {
        _showSnackbar(context, "File selection canceled.");
      }
    } catch (e) {
      _showSnackbar(context, "Error selecting file: $e");
    }
  }

  Future<void> _requestMicrophonePermission(BuildContext context) async {
    try {
      PermissionStatus status = await Permission.microphone.request();
      if (status.isGranted) {
        _showSnackbar(context, "Microphone access granted. Start recording.");
      } else {
        _showSnackbar(context, "Microphone access denied.");
      }
    } catch (e) {
      _showSnackbar(context, "Error requesting microphone permission: $e");
    }
  }

  void _sendMessage() {
    final message = _messageController.text.trim();

    if (message.isEmpty && _attachedFileName == null) {
      _showSnackbar(context, "Message or file is required to send.");
      return;
    }

    final String fullMessage = [
      if (message.isNotEmpty) message,
      if (_attachedFileName != null) "📎 $_attachedFileName (${_attachedFileType?.toUpperCase() ?? 'Unknown'})",
    ].join("\n");

    setState(() {
      _chatMessages.add({'text': fullMessage, 'isUser': true});
      _messageController.clear();
      _attachedFileName = null; // Clear file after sending
      _attachedFileType = null;
    });

    Future.delayed(const Duration(seconds: 2), () {
      _replyToMessage();
    });
  }

  void _replyToMessage() {
    const replyDescription =
        "Here's some information based on your query:";
    const replyVideoLink = "Watch this video for more: https://youtu.be/example";
    const replyMechanicContacts =
        "Nearby mechanic contacts:\n- John Doe: +1 234-567-8901\n- Jane Smith: +1 987-654-3210";
    const replyLocations = "Nearby locations:\n- XYZ Garage, 2 miles\n- ABC Workshop, 3 miles";

    final replies = [
      {'text': replyDescription, 'isUser': false},
      {'text': replyVideoLink, 'isUser': false},
      {'text': replyMechanicContacts, 'isUser': false},
      {'text': replyLocations, 'isUser': false},
    ];

    for (int i = 0; i < replies.length; i++) {
      Future.delayed(Duration(seconds: (i + 1) * 2), () {
        setState(() {
          _chatMessages.add(replies[i]);
        });
      });
    }
  }

  void _showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isUser;

  const ChatBubble({Key? key, required this.message, required this.isUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        decoration: BoxDecoration(
          gradient: isUser
              ? const LinearGradient(colors: [Colors.blueGrey, Colors.blueGrey])
              : const LinearGradient(colors: [Color(0xFF05C793), Color(0xFF05C793)]),
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(12.0),
            topRight: const Radius.circular(12.0),
            bottomLeft: isUser ? const Radius.circular(12.0) : Radius.zero,
            bottomRight: isUser ? Radius.zero : const Radius.circular(12.0),
          ),
        ),
        child: Text(
          message,
          style: TextStyle(
            color: isUser ? Colors.white : Colors.black87,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
