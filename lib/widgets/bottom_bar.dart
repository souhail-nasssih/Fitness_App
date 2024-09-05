import 'package:flutter/material.dart';
import 'package:fitness_app/pages/insights.dart'; // Import your pages
import 'package:fitness_app/pages/calendar.dart';
import 'package:fitness_app/pages/profile.dart';
import 'package:fitness_app/pages/activity.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(), // Set your main screen here
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    ActivityScreen(), // Home page
    InsightsPage(),
    CalendarPage(),
    ProfilePage(),
  ];

  void _onNavBarTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromARGB(255, 250, 254, 252),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _buildNavBarIcon(Icons.home, 0),
            _buildNavBarIcon(Icons.show_chart, 1),
            _buildNavBarIcon(Icons.calendar_today, 2),
            _buildNavBarIcon(Icons.person, 3),
          ],
        ),
      ),
    );
  }

  Widget _buildNavBarIcon(IconData iconData, int index) {
    final bool isSelected = _currentIndex == index;
    return Stack(
      alignment: Alignment.center,
      children: [
        if (isSelected)
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
          ),
        IconButton(
          icon: Icon(
            iconData,
            color: isSelected ? Colors.white : Colors.black,
          ),
          onPressed: () => _onNavBarTapped(index),
        ),
      ],
    );
  }
}
