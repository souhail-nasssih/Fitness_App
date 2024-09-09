import 'package:fitness_app/layouts/bottom_bar.dart';
import 'package:flutter/material.dart';

class ActivityDetailScreen extends StatelessWidget {
  final String activity;

  const ActivityDetailScreen({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('$activity Details'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Coach'),
              Tab(text: 'Localisation'),
              Tab(text: 'Session'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('Coach Info')),
            Center(child: Text('Localisation Info')),
            Center(child: Text('Session Info')),
          ],
        ),
        bottomNavigationBar: const BottomBar(
            currentIndex: 0), // Afficher la BottomBar une seule fois
      ),
    );
  }
}
