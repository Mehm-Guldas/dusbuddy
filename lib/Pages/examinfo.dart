import 'package:flutter/material.dart';


class Examinfo extends StatelessWidget {
  const Examinfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black54),
        title: const Text('Sinav Sistemi',
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(32),
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black54,
                width: 4,
            ),
              borderRadius: BorderRadius.all(Radius.circular(25))
          ),
        ),

      ),

    );
  }
}
