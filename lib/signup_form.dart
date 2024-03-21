import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'theme.dart'; // Add this line to import theme.dart
import 'main.dart';

class ParentSignupForm extends StatefulWidget {
  const ParentSignupForm({super.key});

  @override
  State<ParentSignupForm> createState() => _ParentSignupFormState();
}

class _ParentSignupFormState extends State<ParentSignupForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/image2.png',
          height: 150.0,
          width: 170.0,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: appMargin, // Assuming this is defined in your theme.dart
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Create Account',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Georgia',
                color: Colors.green[700],
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                 hintText: 'Enter an Email'
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                 hintText: 'Enter an username'
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                 hintText: 'Enter your desired password'
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: confirmPasswordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Confirm Password',
                 hintText: 'Confirm password'
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _onSignupPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[200], // Button background color
              ),
              child: const Text('Create'),
            ),
            const SizedBox(height: 20),
            RichText(
              text: TextSpan(
                text: 'Already using Famie? ',
                style: const TextStyle(fontSize: 16.0, color: Colors.black,
                    fontFamily: 'Georgia'),
                 // Default text style
                children: <TextSpan>[
                  TextSpan(
                    text: 'Log in',
                    style: const TextStyle(decoration: TextDecoration.underline,fontSize: 16.0, color: Colors.green,fontWeight: FontWeight.bold,
                    fontFamily: 'Georgia' // Use the primary color from the theme
                    ),
recognizer: TapGestureRecognizer()..onTap = () {
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) => const MyApp()), // Assuming MyApp is the root widget in your main.dart
    (Route<dynamic> route) => false,
  );
},
                
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onSignupPressed() {
    // Implement your signup logic here
    if (passwordController.text == confirmPasswordController.text) {
      debugPrint('Signup successful.');
    } else {
      debugPrint('Passwords do not match.');
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
