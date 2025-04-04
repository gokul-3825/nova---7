import 'package:flutter/material.dart';
import '../widgets/assignment_card.dart';

class AssignmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace with actual assignment data.
    final assignments = [
      {'title': 'Math Homework', 'dueDate': '2024-12-31'},
      {'title': 'Science Project', 'dueDate': '2025-01-15'},
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Assignments')),
      body: ListView.builder(
        itemCount: assignments.length,
        itemBuilder: (context, index) => AssignmentCard(assignment: assignments[index]),
      ),
    );
  }
}