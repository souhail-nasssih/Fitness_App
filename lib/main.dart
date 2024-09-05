import 'package:flutter/material.dart';
import 'package:fitness_app/screens/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Second App',
      home: const SplashScreen(), // SplashScreen as the initial screen
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      // darkTheme: ThemeData(
      //   brightness: Brightness.dark,
      // 
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
    );
  }
}
