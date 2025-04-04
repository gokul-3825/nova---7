import 'package:flutter/material.dart';

class LessonCard extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onTap;

  LessonCard({required this.title, required this.description, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(description),
        onTap: onTap,
      ),
    );
  }
}