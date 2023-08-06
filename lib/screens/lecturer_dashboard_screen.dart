import 'package:flutter/material.dart';
import 'package:quiz_app/screens/add_quiz_screen.dart';

class LecturerDashboardScreen extends StatelessWidget {
  final String userName; // We'll pass the user name from the home screen

  LecturerDashboardScreen({required this.userName});

  @override
  Widget build(BuildContext context) {
    Widget _buildActionButton(BuildContext context,
        {required String text, required Color color, required VoidCallback onPressed}) {
      final isDesktop = MediaQuery.of(context).size.width > 600;

      return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: EdgeInsets.symmetric(horizontal: isDesktop ? 32 : 16, vertical: isDesktop ? 24 : 16),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: isDesktop ? 18 : 16, color: Colors.white),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Lecturer Dashboard'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 24),
                      Text(
                        'Welcome, Lecturer $userName!',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 32),
                      _buildActionButton(
                        context,
                        text: 'Add Quiz',
                        color: Colors.blue,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AddQuizScreen()),
                          );
                        },
                      ),
                      SizedBox(height: 16),
                      _buildActionButton(
                        context,
                        text: 'Add Assignment',
                        color: Colors.green,
                        onPressed: () {
                          // TODO: Implement adding an assignment
                        },
                      ),
                      SizedBox(height: 16),
                      _buildActionButton(
                        context,
                        text: 'Update Student Materials',
                        color: Colors.orange,
                        onPressed: () {
                          // TODO: Implement updating student materials
                        },
                      ),
                      SizedBox(height: 32),
                      Text(
                        'Number of Students Enrolled: XX', // Replace XX with the actual number of enrolled students
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
