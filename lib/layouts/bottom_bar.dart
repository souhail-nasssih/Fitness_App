import 'package:fitness_app/pages/activity.dart';
import 'package:fitness_app/pages/calendar.dart';
import 'package:fitness_app/pages/insights.dart';
import 'package:fitness_app/pages/profile.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final int currentIndex;

  const BottomBar({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: const Color.fromARGB(255, 250, 254, 252),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildNavBarIcon(context, Icons.home, 0, const ActivityScreen()),
          _buildNavBarIcon(context, Icons.show_chart, 1, const InsightsPage()),
          _buildNavBarIcon(
              context, Icons.calendar_today, 2, const CalendarPage()),
          _buildNavBarIcon(context, Icons.person, 3, const ProfilePage()),
        ],
      ),
    );
  }

  Widget _buildNavBarIcon(BuildContext context, IconData iconData, int index,
      Widget destinationPage) {
    final bool isSelected = currentIndex == index;
    return Stack(
      alignment: Alignment.center,
      children: [
        if (isSelected)
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
          ),
        IconButton(
          icon: Icon(
            iconData,
            color: isSelected ? Colors.white : Colors.black,
          ),
          onPressed: () {
            if (currentIndex != index) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => destinationPage),
              );
            }
          },
        ),
      ],
    );
  }
}
