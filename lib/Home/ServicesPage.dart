import 'package:flutter/material.dart';
import 'package:mr_kazi/Home/MechanicsListPage.dart';

class ServicesPage extends StatefulWidget {
  @override
  _ServicesPageState createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  final List<ServiceItem> services = [
    ServiceItem("Cleaning", Icons.cleaning_services),
    ServiceItem("Beauty", Icons.face),
    ServiceItem("AC Repair", Icons.ac_unit),
    ServiceItem("Salon", Icons.content_cut),
    ServiceItem("Carpenter", Icons.handyman),
    ServiceItem("Electricians", Icons.electrical_services),
    ServiceItem("Home Cleaning", Icons.home),
    ServiceItem("Painting", Icons.format_paint),
    ServiceItem("Repair", Icons.build),
    ServiceItem("Massage", Icons.spa),
    ServiceItem("Therapy", Icons.healing),
    ServiceItem("Plumbers", Icons.plumbing),
    ServiceItem("Gardening", Icons.grass),
    ServiceItem("Pet Care", Icons.pets),
    ServiceItem("Laundry", Icons.local_laundry_service),
    ServiceItem("Moving", Icons.move_to_inbox),
    ServiceItem("Cooking", Icons.kitchen),
    ServiceItem("Tutoring", Icons.school),
  ];

  String searchQuery = "";

  // Colors
  final Color primaryColor = Color(0xFF26547D);
  final Color secondaryColor = Color(0xFFEF436B);
  final Color accentColor = Color(0xFFFFCE5C);
  final Color backgroundColor = Color(0xFFFFF5EB);
  final Color successColor = Color(0xFF05C793);

  @override
  Widget build(BuildContext context) {
    final filteredServices = services
        .where((service) => service.name.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          "Services",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          searchQuery = value;
                        });
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: backgroundColor,
                        hintText: "Search your service here...",
                        hintStyle: TextStyle(color: primaryColor.withOpacity(0.6)),
                        prefixIcon: Icon(Icons.search, color: primaryColor),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    icon: Icon(Icons.filter_list, color: successColor),
                    onPressed: () {
                      // Add filter functionality
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Available Services",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1,
                  ),
                  itemCount: filteredServices.length,
                  itemBuilder: (context, index) {
                    final service = filteredServices[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                MechanicsListPage(serviceName: service.name),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: secondaryColor.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: accentColor,
                              child: Icon(service.icon, color: primaryColor, size: 20),
                            ),
                            SizedBox(height: 8),
                            Text(
                              service.name,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
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
      ),
    );
  }
}

class ServiceItem {
  final String name;
  final IconData icon;

  ServiceItem(this.name, this.icon);
}
