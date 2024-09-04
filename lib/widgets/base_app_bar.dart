import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackPressed;

  BaseAppBar({
    required this.title,
    this.onBackPressed,
  });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 250, 254, 252),
      elevation: 0,
      leading: onBackPressed != null
          ? IconButton(
              icon: Icon(Icons.arrow_back, color: const Color.fromARGB(255, 0, 0, 0)),
              onPressed: onBackPressed,
            )
          : null,
      title: Text(
        title,
        style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.menu, color: const Color.fromARGB(255, 0, 0, 0)),
          onPressed: () {},
        ),
      ],
    );
  }
}
