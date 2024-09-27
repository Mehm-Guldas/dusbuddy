import 'package:flutter/material.dart';
import '../Components/konuilerleme.dart';

class ProgressPage extends StatefulWidget {
  @override
  _ProgressPageState createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  // Track the state of checkboxes for each category
  Map<String, bool> basicSciences = {
    "Anatomi": false,
    "Histoloji ve Embriyoloji": false,
    "Fizyoloji": false,
    "Tıbbi Biyokimya": false,
    "Tıbbi Mikrobiyoloji": false,
    "Tıbbi Patoloji": false,
    "Tıbbi Farmakoloji": false,
    "Tıbbi Biyoloji ve Genetik": false,
  };

  Map<String, bool> clinicalSciences = {
    "Protetik Diş Tedavisi": false,
    "Restoratif Diş Tedavisi": false,
    "Ağız, Diş ve Çene Cerrahisi": false,
    "Ağız, Diş ve Çene Radyolojisi": false,
    "Periodontoloji": false,
    "Ortodonti": false,
    "Endodonti": false,
    "Çocuk Diş Hekimliği (Pedodonti)": false,
  };

  // Calculate the percentage for each section
  double calculatePercentage(Map<String, bool> topics) {
    int total = topics.length;
    int completed = topics.values.where((val) => val == true).length;
    return completed / total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DUS Progress Tracker'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Basic Sciences Section
            Topic(
              title: "Temel Bilimler",
              topics: basicSciences,
              onChanged: (value, topic) {
                setState(() {
                  basicSciences[topic] = value;
                });
              },
              progress: calculatePercentage(basicSciences),
            ),
            SizedBox(height: 20),
            // Clinical Sciences Section
            Topic(
              title: "Klinik Bilimler",
              topics: clinicalSciences,
              onChanged: (value, topic) {
                setState(() {
                  clinicalSciences[topic] = value;
                });
              },
              progress: calculatePercentage(clinicalSciences),
            ),
          ],
        ),
      ),
    );
  }
}
