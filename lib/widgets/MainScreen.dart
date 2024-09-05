import 'package:flutter/material.dart';
import 'package:fitness_app/pages/activity.dart';
import 'package:fitness_app/pages/insights.dart';
import 'package:fitness_app/pages/calendar.dart';
import 'package:fitness_app/pages/profile.dart';
import '../widgets/bottom_bar.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    ActivityScreen(),
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
      bottomNavigationBar: BottomBar(
        currentIndex: _currentIndex,
        onTap: _onNavBarTapped,
      ),
    );
  }
}
