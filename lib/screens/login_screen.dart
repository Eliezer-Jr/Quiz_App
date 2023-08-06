import 'package:flutter/material.dart';
import 'package:quiz_app/screens/lecturer_home_screen.dart';
import 'package:quiz_app/screens/student_home_screen.dart';
import 'package:quiz_app/models/user_type.dart';



class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  UserType _userType = UserType.student;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Simulate a successful login (replace this with your actual login logic)
      String userName = _email; // You can set the user name to the entered email for this example

      // Redirect to the appropriate home screen based on the user type
      if (_userType == UserType.student) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => StudentHomeScreen(userName: userName)),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LecturerHomeScreen(userName: userName)),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  // You can add more email validation checks if needed.
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _email = value.trim();
                  });
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }
                  // You can add more password validation checks if needed.
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _password = value.trim();
                  });
                },
              ),
              SizedBox(height: 16.0),
              ListTile(
                title: Text('Student'),
                leading: Radio(
                  value: UserType.student,
                  groupValue: _userType,
                  onChanged: (value) {
                    setState(() {
                      _userType = value as UserType;
                    });
                  },
                ),
              ),
              ListTile(
                title: Text('Lecturer'),
                leading: Radio(
                  value: UserType.lecturer,
                  groupValue: _userType,
                  onChanged: (value) {
                    setState(() {
                      _userType = value as UserType;
                    });
                  },
                ),
              ),
              SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
