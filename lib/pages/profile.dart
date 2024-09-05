import 'package:flutter/material.dart';
import '../widgets/base_app_bar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: 'Profile',
        onBackPressed: () {
          Navigator.pop(context); // Navigate back to the previous screen
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Padding(padding: EdgeInsets.all(10)),
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('images/avatar.png'), // Replace with your image asset
              backgroundColor: Colors.transparent,
            ),
            const Padding(padding: EdgeInsets.all(10)),
            const SizedBox(height: 16),
            const Text(
              'Alex Taylor',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Hi, I\'m Alex Taylor,\nA certified fitness coach passionate about helping people get stronger and healthier. \nI create personalized workout to make fitness fun and effective for everyone',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.location_on, color: Colors.grey[600]),
                const SizedBox(width: 8),
                Text(
                  'New York City',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.attach_money, color: Colors.grey[600]),
                const SizedBox(width: 8),
                Text(
                  'Pricing: \$70/H',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add action for button press
        },
        backgroundColor: Colors.purple,
        child: Icon(Icons.message),
      ),
    );
  }
}
