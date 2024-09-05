import 'package:flutter/material.dart';
import '../routes.dart';

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
          _buildNavBarIcon(Icons.home, 0, context, Routes.activityScreen),
          _buildNavBarIcon(Icons.show_chart, 1, context, Routes.insights),
          _buildNavBarIcon(Icons.calendar_today, 2, context, Routes.calendar),
          _buildNavBarIcon(Icons.person, 3, context, Routes.profile),
        ],
      ),
    );
  }

  Widget _buildNavBarIcon(
      IconData iconData, int index, BuildContext context, String route) {
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
          icon: Icon(iconData),
          color: isSelected ? Colors.white : Colors.black,
          onPressed: () {
            onTap(index);
            Navigator.pushNamed(context, route);
          },
        ),
      ],
    );
  }
}
