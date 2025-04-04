import 'package:flutter/material.dart';
import '../models/question.dart';

class QuestionWidget extends StatelessWidget {
  final Question question;

  QuestionWidget({required this.question});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(question.questionText),
        ...question.options.map((option) => ElevatedButton(onPressed: (){}, child: Text(option))).toList(),
      ],
    );
  }
}