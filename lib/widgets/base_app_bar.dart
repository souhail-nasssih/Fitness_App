import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackPressed;

  BaseAppBar({
    required this.title,
    this.onBackPressed,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 250, 254, 252),
      elevation: 0,
      leading: onBackPressed != null
          ? IconButton(
              icon: const Icon(Icons.arrow_back, color: Color.fromARGB(255, 0, 0, 0)),
              onPressed: onBackPressed,
            )
          : null,
      title: Text(
        title,
        style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.menu, color: Color.fromARGB(255, 0, 0, 0)),
          onPressed: () {},
        ),
      ],
    );
  }
}
