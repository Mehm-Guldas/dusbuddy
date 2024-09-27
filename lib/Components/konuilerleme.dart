import 'package:flutter/material.dart';

class Topic extends StatelessWidget {
  final String title;
  final Map<String, bool> topics;
  final Function(bool, String) onChanged;
  final double progress;

  const Topic({
    Key? key,
    required this.title,
    required this.topics,
    required this.onChanged,
    required this.progress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        // Progress Bar
        LinearProgressIndicator(
          value: progress,
          backgroundColor: Colors.grey[300],
          color: Colors.blue,
        ),
        SizedBox(height: 10),
        // Checkboxes
        ...topics.keys.map((topic) {
          return CheckboxListTile(
            title: Text(topic),
            value: topics[topic],
            onChanged: (value) {
              onChanged(value ?? false, topic);
            },
          );
        }).toList(),
      ],
    );
  }
}
