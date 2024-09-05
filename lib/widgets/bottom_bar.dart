// lib/widgets/bottom_bar.dart
import 'package:flutter/material.dart';
import 'package:fitness_app/pages/activity.dart'; // Update imports based on your app structure
import 'package:fitness_app/pages/insights.dart';
import 'package:fitness_app/pages/calendar.dart';
import 'package:fitness_app/pages/profile.dart';

class BottomBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
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
    );
  }

  Widget _buildNavBarIcon(IconData iconData, int index) {
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
          onPressed: () => onTap(index),
        ),
      ],
    );
  }
}
