import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[200], // Adjust the color to match your theme
        title: Image.asset(
          'assets/image2.png', // Your logo image asset
          height: 150.0,
          width: 170.0,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.home), // Use an icon for "Home"
            color: Colors.black,
            onPressed: () {
              // Home button logic
            },
          ),
          IconButton(
            icon: const Icon(Icons.exit_to_app), // Use an icon for "Log Out"
            color: Colors.black,
            onPressed: () {
              // Log Out button logic
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('Dashboard Content Goes Here'),
      ),
    );
  }
}
