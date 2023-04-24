import 'package:flutter/material.dart';


class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black54),
        title: const Text('Hakkında',
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: const Center(
        child: Text('Hakkinda'),
      ),

    );
  }
}
