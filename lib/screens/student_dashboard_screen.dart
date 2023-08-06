import 'package:flutter/material.dart';
import 'package:quiz_app/screens/quiz1_screen.dart';

class StudentDashboardScreen extends StatefulWidget {
  final String userName;
  final String quizDetails;

  StudentDashboardScreen({required this.userName, required this.quizDetails});

  @override
  _StudentDashboardScreenState createState() => _StudentDashboardScreenState();

  void addQuiz(String quizDetails) {}
}

class _StudentDashboardScreenState extends State<StudentDashboardScreen> {
  String? quizDetails; // Holds the quiz details after the quiz is added

  // ...

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Dashboard'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24),
            Text(
              'Welcome, ${widget.userName}!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 32),
            _buildSection('Pending Quizzes', [quizDetails ?? '']), // Pass the quiz details here
            // Add other sections as needed for pending assignments, etc.
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        if (items.isEmpty)
          Text(
            'No $title',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        if (items.isNotEmpty)
          Column(
            children: items.map((item) => _buildItem(item)).toList(),
          ),
      ],
    );
  }

  Widget _buildItem(String item) {
    return ListTile(
      onTap: () {
        // TODO: Implement navigation to the appropriate quiz/assignment screen
        // You can use a switch case or if-else to navigate based on the item.
      },
      title: Text(item),
      // ... (Other ListTile properties)
    );
  }

  // Function to add a new quiz and update the quizDetails
  void addQuiz(String newQuizDetails) {
    setState(() {
      quizDetails = newQuizDetails;
    });
  }
}
