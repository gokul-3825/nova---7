import 'package:flutter/material.dart';

class AssignmentCard extends StatelessWidget {
  final Map<String, dynamic> assignment;

  AssignmentCard({required this.assignment});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(assignment['title']),
        subtitle: Text('Due: ${assignment['dueDate']}'),
      ),
    );
  }
}