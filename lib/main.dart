import 'package:flutter/material.dart';
import 'package:quiz_app/screens/login_screen.dart';
import 'package:quiz_app/screens/student_home_screen.dart';
import 'package:quiz_app/screens/student_dashboard_screen.dart';
import 'package:quiz_app/screens/add_quiz_screen.dart';
import 'package:quiz_app/screens/quiz1_screen.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/student_home': (context) => StudentHomeScreen(userName: '',),
        '/student_dashboard': (context) => StudentDashboardScreen(userName: '', quizDetails: '',),
        '/add_quiz': (context) => AddQuizScreen(),
      },
    );
  }
}
