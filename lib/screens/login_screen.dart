import 'package:my_flutter_app/screens/playlist_screen.dart'; // Import the PlaylistScreen class
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  static const String testUsername = 'abc';
  static const String testPassword = '123';

  String errorMessage = 'invalid';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Add a container for alignment
              Container(
                width: 300, // Adjust the width as needed
                child: Column(
                  children: [
                    TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        labelText: 'Username',
                      ),
                    ),
                    SizedBox(height: 16.0), // Add vertical spacing
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                      ),
                    ),
                    SizedBox(height: 16.0), // Add vertical spacing
                    ElevatedButton(
                      onPressed: () {
                        String enteredUsername = usernameController.text;
                        String enteredPassword = passwordController.text;

                        if (enteredUsername == testUsername &&
                            enteredPassword == testPassword) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PlaylistScreen()),
                          );
                        } else {
                          setState(() {
                            errorMessage =
                                'Invalid username or password. Please try again.';
                          });
                        }
                      },
                      child: Text('Login'),
                    ),
                    if (errorMessage.isNotEmpty)
                      Text(
                        errorMessage,
                        style: TextStyle(color: Colors.red),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
