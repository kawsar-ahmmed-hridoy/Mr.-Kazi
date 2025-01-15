import 'package:flutter/material.dart';
import 'package:mr_kazi/Home/MechanicsListPage.dart';

class ServicesPage extends StatelessWidget {
  final List<ServiceItem> services = [
    ServiceItem("Cleaning", Icons.cleaning_services, Colors.blue),
    ServiceItem("Beauty", Icons.face, Colors.pink),
    ServiceItem("AC Repair", Icons.ac_unit, Colors.cyan),
    ServiceItem("Salon", Icons.content_cut, Colors.deepPurple),
    ServiceItem("Carpenter", Icons.handyman, Colors.brown),
    ServiceItem("Electricians", Icons.electrical_services, Colors.amber),
    ServiceItem("Home Cleaning", Icons.home, Colors.green),
    ServiceItem("Painting", Icons.format_paint, Colors.orange),
    ServiceItem("Repair", Icons.build, Colors.red),
    ServiceItem("Massage", Icons.spa, Colors.purple),
    ServiceItem("Therapy", Icons.healing, Colors.teal),
    ServiceItem("Plumbers", Icons.plumbing, Colors.indigo),
    ServiceItem("Gardening", Icons.grass, Colors.lightGreen),
    ServiceItem("Pet Care", Icons.pets, Colors.orangeAccent),
    ServiceItem("Laundry", Icons.local_laundry_service, Colors.blueAccent),
    ServiceItem("Moving", Icons.move_to_inbox, Colors.deepOrange),
    ServiceItem("Cooking", Icons.kitchen, Colors.brown.shade400),
    ServiceItem("Tutoring", Icons.school, Colors.deepPurpleAccent),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Services",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search your service here...",
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    IconButton(
                      icon: Icon(Icons.filter_list, color: Colors.green),
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  "Available Services",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.8,
                ),
                itemCount: services.length,
                itemBuilder: (context, index) {
                  final service = services[index];
                  return GestureDetector(
                    onTap: () {Navigator.push(context,MaterialPageRoute(builder: (context) => MechanicsListPage(serviceName: service.name),),);},
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: service.color.withOpacity(0.2),
                            child: Icon(service.icon, color: service.color, size: 30),
                          ),
                          SizedBox(height: 10),
                          Text(
                            service.name,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ServiceItem {
  final String name;
  final IconData icon;
  final Color color;

  ServiceItem(this.name, this.icon, this.color);
}
