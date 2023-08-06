import 'package:flutter/material.dart';
import 'package:quiz_app/screens/student_dashboard_screen.dart';

class AddQuizScreen extends StatefulWidget {
  @override
  _AddQuizScreenState createState() => _AddQuizScreenState();
}

class _AddQuizScreenState extends State<AddQuizScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController quizTitleController = TextEditingController();
  final TextEditingController quizDescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Quiz'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: quizTitleController,
                decoration: InputDecoration(labelText: 'Quiz Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the quiz title';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: quizDescriptionController,
                decoration: InputDecoration(labelText: 'Quiz Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the quiz description';
                  }
                  return null;
                },
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, create the quiz and navigate back to StudentDashboardScreen
                    var quizTitle = quizTitleController.text;
                    var quizDescription = quizDescriptionController.text;
                    var quizDetails = 'Title: $quizTitle\nDescription: $quizDescription';

                    // Access the parent widget (StudentDashboardScreen) and call addQuiz to update the quiz details
                    StudentDashboardScreen dashboardScreen = context.findAncestorWidgetOfExactType<StudentDashboardScreen>()
                    !;
                    dashboardScreen.addQuiz(quizDetails);

                    Navigator.pop(context); // Navigate back to the dashboard
                  }
                },
                child: Text('Create Quiz'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
