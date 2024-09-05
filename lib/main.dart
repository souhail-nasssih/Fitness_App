// lib/main.dart
import 'package:fitness_app/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My second App',
      home: const SplashScreen(), // Utilisez SplashScreen comme écran initial
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),

      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
    );
  }
}
