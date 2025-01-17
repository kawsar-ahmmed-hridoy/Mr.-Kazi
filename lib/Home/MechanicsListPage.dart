import 'package:flutter/material.dart';
import 'package:mr_kazi/Home/MechanicDetailsPage.dart';

class MechanicsListPage extends StatelessWidget {
  final String serviceName;

  MechanicsListPage({required this.serviceName});

  final List<Mechanic> mechanics = List.generate(
    20,
        (index) => Mechanic(
      name: "Mechanic ${index + 1}",
      fee: (50 + index * 10).toDouble(),
      rating: (3.5 + (index % 5) * 0.2),
      photoUrl: "https://picsum.photos/id/${index + 10}/200",
      contact: "017-1444-01${index + 10}",
      specializations: ["Engine Repair", "Oil Change", "Brake Fixing"],
      availability: index % 2 == 0 ? "Available" : "Busy",
    ),
  );

  final Color primaryColor = Color(0xFF26547D);
  final Color secondaryColor = Color(0xFFEF436B);
  final Color accentColor = Color(0xFFFFCE5C);
  final Color backgroundColor = Color(0xFFFFF5EB);
  final Color successColor = Color(0xFF05C793);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$serviceName Mechanics",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
        backgroundColor: primaryColor,
      ),
      body: ListView.builder(
        itemCount: mechanics.length,
        itemBuilder: (context, index) {
          final mechanic = mechanics[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MechanicDetailsPage(mechanic: mechanic),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 5,
                    offset: Offset(2, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            mechanic.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: primaryColor,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Fee: \$${mechanic.fee.toStringAsFixed(2)}",
                            style: TextStyle(
                              fontSize: 14,
                              color: secondaryColor,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Rating: ${mechanic.rating.toStringAsFixed(1)} ★",
                            style: TextStyle(
                              fontSize: 14,
                              color: accentColor,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Status: ${mechanic.availability}",
                            style: TextStyle(
                              fontSize: 14,
                              color: mechanic.availability == "Available"
                                  ? successColor
                                  : secondaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Image.network(
                        mechanic.photoUrl,
                        height: 100,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
