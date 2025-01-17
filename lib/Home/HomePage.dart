import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mr_kazi/Community/NotificationsPage.dart';
import 'package:mr_kazi/Home/Kazi_AI.dart';
import 'package:mr_kazi/Home/MechanicsListPage.dart';
import 'package:mr_kazi/Home/RecentlyDiagonsticResultsPage.dart';
import 'package:mr_kazi/Home/ServicesPage.dart';
import 'package:mr_kazi/Home/TrendingServicesPage.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  int _currentPage = 0;
  late Timer _timer;

  final Color primaryColor = Color(0xFF26547D);
  final Color secondaryColor = Color(0xFFEF436B);
  final Color accentColor = Color(0xFFFFCE5C);
  final Color backgroundColor = Color(0xFFFFF5EB);
  final Color successColor = Color(0xFF05C793);

  void bookNow() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Booking confirmed! Mechanic will contact you soon."),
        backgroundColor: successColor,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    bool _isForward = true;
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        setState(() {
          if (_isForward) {
            if (_currentPage < 3) {
              _currentPage++;
            } else {
              _isForward = false;
              _currentPage--;
            }
          } else {
            if (_currentPage > 0) {
              _currentPage--;
            } else {
              _isForward = true;
              _currentPage++;
            }
          }
          _pageController.animateToPage(
            _currentPage,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOutCirc,
          );
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage("assets/Community/hridoy.jpg"),
            ),
            SizedBox(width: 20),
            Text(
              "Hello, Kawsar Ahmmed Hridoy!",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        backgroundColor: primaryColor,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationsPage()),);},
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 60.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.location_on, color: primaryColor),
                      SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          "SUST, Akhaliya, Sylhet Sadar, Sylhet, Bangladesh",
                          style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Search your service here...",
                      prefixIcon: Icon(Icons.search, color: primaryColor),
                      suffixIcon: Icon(Icons.filter_list, color: primaryColor),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: backgroundColor,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text("For you", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: primaryColor)),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 180,
                    child: PageView(
                      controller: _pageController,
                      scrollDirection: Axis.horizontal,
                      children: [
                        _bannerPage(
                          title: "Expert Plumbers, Affordable Rates",
                          discount: "10% OFF",
                          imagePath: 'assets/Community/1.jpg',
                          onPressed: bookNow,
                        ),
                        _bannerPage(
                          title: "Home Cleaning Services",
                          discount: "15% OFF",
                          imagePath: 'assets/Community/2.jpg',
                          onPressed: bookNow,
                        ),
                        _bannerPage(
                          title: "AC Repair at Best Prices",
                          discount: "20% OFF",
                          imagePath: 'assets/Community/3.jpg',
                          onPressed: bookNow,
                        ),
                        _bannerPage(
                          title: "Home Appliance Repair at Best Prices",
                          discount: "30% OFF",
                          imagePath: 'assets/Community/4.jpg',
                          onPressed: bookNow,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Services", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: primaryColor)),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ServicesPage()));
                        },
                        child: Text("View all", style: TextStyle(color: secondaryColor)),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _serviceIcon(Icons.car_repair, "Car repair", () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                MechanicsListPage(serviceName: "Car Repair"),
                          ),
                        );
                      }),
                      _serviceIcon(Icons.electrical_services, "Electricity", () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                MechanicsListPage(serviceName: "Electricity"),
                          ),
                        );
                      }),
                      _serviceIcon(Icons.ac_unit, "AC Repair", () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                MechanicsListPage(serviceName: "AC Repair"),
                          ),
                        );
                      }),
                      _serviceIcon(Icons.computer, "Computer", () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                MechanicsListPage(serviceName: "Computer"),
                          ),
                        );
                      }),
                    ],
                  ),

                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Trending services", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: primaryColor)),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => TrendingServicesPage()),
                          );
                        },
                        child: Text("View all", style: TextStyle(color: secondaryColor)),
                      ),

                    ],
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _trendingService("Computer repair", "20.99", "4.0", 'assets/Community/5.jpg'),
                        SizedBox(width: 10),
                        _trendingService("Car repairing", "25.99", "4.5", 'assets/Community/6.jpg'),
                        SizedBox(width: 10),
                        _trendingService("Software bugs", "30.99", "4.3", 'assets/Community/3.jpg'),
                        SizedBox(width: 10),
                        _trendingService("Hardware", "15.99", "4.7", 'assets/Community/4.jpg'),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Recently diagnostic results", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: primaryColor)),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RecentlyDiagnosticResultsPage()),
                          );
                        },
                        child: Text("View all", style: TextStyle(color: secondaryColor)),
                      ),

                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: successColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 5,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Phone Problem",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: primaryColor),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Please consult with a Mechanic for further analysis.",
                          style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DiagnosticDetailsPage(
                                  title: "Phone Problem",
                                  description: "Please consult with a Mechanic for further analysis.",
                                  date: "18.01.2025",
                                  severity: "High",
                                ),
                              ),
                            );
                          },
                          child: Text("View Details", style: TextStyle(color: Colors.white),),
                          style: ElevatedButton.styleFrom(backgroundColor: secondaryColor),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 61,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 5,
                    spreadRadius: 2,
                  ),
                ],
              ),
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Kazi_AI()));
                    },
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/Home/kazi.png'),
                    ),
                  ),
                  SizedBox(height: 7),
                  Text(
                    "Mr.Kazi.AI",
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _serviceIcon(IconData icon, String label, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: accentColor.withOpacity(0.2),
            child: Icon(icon, color: primaryColor),
          ),
          SizedBox(height: 8),
          Text(label, style: TextStyle(fontSize: 14, color: primaryColor)),
        ],
      ),
    );
  }


  Widget _trendingService(String title, String price, String rating, String imagePath) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: primaryColor)),
          SizedBox(height: 5),
          Text("\$$price", style: TextStyle(fontSize: 16, color: successColor)),
          SizedBox(height: 5),
          Row(
            children: [
              Icon(Icons.star, color: accentColor, size: 16),
              SizedBox(width: 5),
              Text(rating, style: TextStyle(fontSize: 14, color: primaryColor)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _bannerPage({required String title, required String discount, required String imagePath, required VoidCallback onPressed}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: successColor.withOpacity(0.1),
      ),
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: primaryColor),
                ),
                SizedBox(height: 10),
                Text(
                  discount,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: successColor),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: onPressed,
                  child: Text("Book now",style: TextStyle(color: Colors.white),),
                  style: ElevatedButton.styleFrom(backgroundColor: secondaryColor),
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(10), // Adjust the radius as needed
            child: Image.asset(imagePath, height: 110, width: 170, fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }
}
