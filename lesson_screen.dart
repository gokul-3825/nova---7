import 'package:flutter/material.dart';

class LessonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lesson')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Lesson Content:', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text('This is where lesson content will go. You can add text, images, videos, etc.'),
            // Add more lesson content widgets here...
          ],
        ),
      ),
    );
  }
}