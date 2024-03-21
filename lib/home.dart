import 'package:flutter/material.dart';
import 'child_reg.dart';
import 'dashboard.dart';
import 'screentimelimit.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Hi Parent!',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 20),
              MenuItem(
                iconData: Icons.person_add,
                title: 'Register Child',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ChildRegistrationScreen()));
                },
              ),
              MenuItem(
                iconData: Icons.dashboard,
                title: 'Dashboard',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const DashboardScreen()));
                },
              ),
              MenuItem(
                iconData: Icons.timer,
                title: 'Set Time Limit',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ScreenTimeLimitScreen()));
                },
              ),
            
          ],
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback onTap;

  const MenuItem({
    super.key,
    required this.iconData,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(iconData, color: Colors.green),
        title: Text(title),
        onTap: onTap,
      ),
    );
  }
}
