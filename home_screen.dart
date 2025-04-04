import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Welcome to the Educational App!'),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/lesson'),
              child: Text('Start Learning'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/quiz'),
              child: Text('Take a Quiz'),
            ),
             ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/profile'),
              child: Text('Profile'),
            ),
          ],
        ),
      ),
    );
  }
}