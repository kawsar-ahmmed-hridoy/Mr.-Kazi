import 'package:flutter/material.dart';

class RecentlyDiagnosticResultsPage extends StatelessWidget {
  // Sample diagnostic results data
  final List<Map<String, String>> diagnosticResults = [
    {
      'title': 'Blood Test',
      'description': 'Routine blood test for cholesterol levels.',
      'date': '2025-01-15',
      'severity': 'Low',
    },
    {
      'title': 'MRI Scan',
      'description': 'Brain MRI scan for routine checkup.',
      'date': '2025-01-10',
      'severity': 'High',
    },
    {
      'title': 'X-Ray',
      'description': 'Chest X-Ray for lung health.',
      'date': '2025-01-08',
      'severity': 'Moderate',
    },
    {
      'title': 'Eye Test',
      'description': 'Eye exam for prescription update.',
      'date': '2025-01-05',
      'severity': 'Low',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recently Diagnostic Results',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        backgroundColor: Color(0xFF26547D),
      ),
      body: ListView.builder(
        itemCount: diagnosticResults.length,
        itemBuilder: (context, index) {
          final result = diagnosticResults[index];
          return _diagnosticResultCard(
            context: context,
            title: result['title']!,
            description: result['description']!,
            date: result['date']!,
            severity: result['severity']!,
          );
        },
      ),
    );
  }

  Widget _diagnosticResultCard({
    required BuildContext context,
    required String title,
    required String description,
    required String date,
    required String severity,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF26547D),
            ),
          ),
          SizedBox(height: 5),
          Text(
            "Description: $description",
            style: TextStyle(fontSize: 14, color: Colors.grey[800]),
          ),
          SizedBox(height: 5),
          Text(
            "Date: $date",
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
          ),
          SizedBox(height: 5),
          Text(
            "Severity: $severity",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: _getSeverityColor(severity),
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DiagnosticDetailsPage(
                    title: title,
                    description: description,
                    date: date,
                    severity: severity,
                  ),
                ),
              );
            },
            child: Text("View Details"),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white, backgroundColor: Color(0xFFEF436B),
            ),
          ),
        ],
      ),
    );
  }

  Color _getSeverityColor(String severity) {
    switch (severity.toLowerCase()) {
      case 'low':
        return Colors.green;
      case 'moderate':
        return Colors.orange;
      case 'high':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}

class DiagnosticDetailsPage extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final String severity;

  DiagnosticDetailsPage({
    required this.title,
    required this.description,
    required this.date,
    required this.severity,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diagnostic Details',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        backgroundColor: Color(0xFF26547D),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF26547D),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Description: $description",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              "Date: $date",
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            SizedBox(height: 10),
            Text(
              "Severity: $severity",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: _getSeverityColor(severity),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getSeverityColor(String severity) {
    switch (severity.toLowerCase()) {
      case 'low':
        return Colors.green;
      case 'moderate':
        return Colors.orange;
      case 'high':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
