import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  final String userName; // We'll pass the user name from the home screens

  SettingsScreen({required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Settings go here...'),
            // Add different settings options and functionalities as needed
          ],
        ),
      ),
    );
  }
}
