import 'package:flutter/material.dart';
import 'package:quiz_app/models/quiz.dart';

class Quiz1Screen extends StatelessWidget {
  final Quiz quiz; // We'll pass the quiz model from the dashboard

  Quiz1Screen({required this.quiz});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(quiz.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Text(
            quiz.description,
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
