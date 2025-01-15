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
      //experience: 5 + (index % 5),
      specializations: ["Engine Repair", "Oil Change", "Brake Fixing"],
      availability: index % 2 == 0 ? "Available" : "Busy",
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$serviceName Mechanics"),
        backgroundColor: Colors.blue,
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
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              elevation: 3,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(mechanic.photoUrl),
                  radius: 30,
                ),
                title: Text(
                  mechanic.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text("Fee: \$${mechanic.fee.toStringAsFixed(2)}"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.star, color: Colors.yellow),
                    Text(mechanic.rating.toStringAsFixed(1)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
