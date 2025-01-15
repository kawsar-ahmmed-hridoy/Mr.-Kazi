import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MechanicDetailsPage extends StatefulWidget {
  final Mechanic mechanic;

  MechanicDetailsPage({required this.mechanic});

  @override
  _MechanicDetailsPageState createState() => _MechanicDetailsPageState();
}

class _MechanicDetailsPageState extends State<MechanicDetailsPage> {
  final List<String> reviews = [
    "Great service! Highly recommended.",
    "Very professional and punctual.",
  ];

  final TextEditingController reviewController = TextEditingController();

  void addReview() {
    final newReview = reviewController.text.trim();
    if (newReview.isNotEmpty) {
      setState(() {
        reviews.add(newReview);
      });
      reviewController.clear();
    }
  }

  void openLocation() async {
    final serviceQuery = widget.mechanic.specializations.join(" ");
    final url = "https://www.google.com/maps/search/?api=1&query=$serviceQuery";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Could not open the location.";
    }
  }

  void initiateVideoCall() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Video call feature is under development.")),
    );
  }

  void callMechanic() async {
    final url = "tel:${widget.mechanic.contact}";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Could not initiate the call.";
    }
  }

  void messageMechanic() async {
    final url = "sms:${widget.mechanic.contact}";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Could not send the message.";
    }
  }

  @override
  Widget build(BuildContext context) {
    final mechanic = widget.mechanic;

    return Scaffold(
      appBar: AppBar(
        title: Text(mechanic.name),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Mechanic Image
            Container(
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
                child: Image.network(
                  mechanic.photoUrl,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),

            // Mechanic Information Section
            _buildSectionBox(
              title: "Personal Information",
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name: ${mechanic.name}", style: _infoTextStyle),
                  Text("Rating: ${mechanic.rating.toStringAsFixed(1)} ★", style: _infoTextStyle),
                  Text("Fee: \$${mechanic.fee.toStringAsFixed(2)}", style: _infoTextStyle),
                  Text("Availability: ${mechanic.availability}", style: _infoTextStyle),
                ],
              ),
            ),
            SizedBox(height: 16),

            // Contact Options Section
            _buildSectionBox(
              title: "Contact Options",
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: callMechanic,
                    icon: Icon(Icons.phone),
                    label: Text("Call"),
                  ),
                  ElevatedButton.icon(
                    onPressed: messageMechanic,
                    icon: Icon(Icons.message),
                    label: Text("Message"),
                  ),
                  ElevatedButton.icon(
                    onPressed: initiateVideoCall,
                    icon: Icon(Icons.video_call),
                    label: Text("Video Call"),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),

            // Map Section
            _buildSectionBox(
              title: "Location",
              content: GestureDetector(
                onTap: openLocation,
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: NetworkImage("assets/Home/map.jpg"),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.4), BlendMode.darken),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Tap to view its locations in Google Maps",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),

            // Review Section
            _buildSectionBox(
              title: "Public Reviews",
              content: Column(
                children: reviews
                    .map((review) => ListTile(
                  leading: CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  title: Text(review),
                ))
                    .toList(),
              ),
            ),
            SizedBox(height: 16),

            // Add Review Section
            _buildSectionBox(
              title: "Add a Review",
              content: TextField(
                controller: reviewController,
                decoration: InputDecoration(
                  hintText: "Write your review here",
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.send, color: Colors.blue),
                    onPressed: addReview,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionBox({required String title, required Widget content}) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 8,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          content,
        ],
      ),
    );
  }

  TextStyle get _infoTextStyle => TextStyle(fontSize: 16, color: Colors.black87);
}

class Mechanic {
  final String name;
  final double fee;
  final double rating;
  final String photoUrl;
  final String contact;
  final List<String> specializations;
  final String availability;

  Mechanic({
    required this.name,
    required this.fee,
    required this.rating,
    required this.photoUrl,
    required this.contact,
    required this.specializations,
    required this.availability,
  });
}
