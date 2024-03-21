//Good Login 

import 'package:flutter/material.dart';
import 'signup_form.dart'; // Make sure this import is correct
import 'theme.dart'; // Make sure this import is correct
import 'package:logger/logger.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // These controllers should ideally be part of a stateful widget if you're planning to interact with them.
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    var logger = Logger();

    return MaterialApp(
      theme: appTheme, // Ensure this is correctly defined somewhere
      home: Scaffold(
        appBar: AppBar(
          title: Image.asset(
            'assets/image2.png',
            height: 150.0,
            width: 170.0,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: appMargin, // Ensure this is correctly defined somewhere
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome Parent!',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Georgia',
                    color: Colors.green[700],
                  ),
                ),
                TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    hintText: 'Enter your username',
                  ),
                ),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    logger.d('Login attempt: Username: ${usernameController.text}');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[200],
                  ),
                  child: const Text('Log In',),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don’t have an account?  ",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        fontFamily: 'Georgia',
                      ),
                    ),
                    Builder(
                      builder: (context) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ParentSignupForm()),
                          );
                        },
                        child: Text(
                          "Create one",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                            color: Colors.green[700],
                            decoration: TextDecoration.underline,
                            fontFamily: 'Georgia',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
