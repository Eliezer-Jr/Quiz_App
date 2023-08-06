import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String userName; // We'll pass the user name from the home screens

  ProfileScreen({required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              // Add user's profile picture here
            ),
            SizedBox(height: 16),
            Text(
              'Welcome, $userName!',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 24),
            Text('Other profile information goes here...'),
          ],
        ),
      ),
    );
  }
}
