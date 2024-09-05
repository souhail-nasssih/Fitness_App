import 'package:flutter/material.dart';
import 'package:fitness_app/pages/activity.dart';
import 'package:fitness_app/pages/calendar.dart';
import 'package:fitness_app/pages/insights.dart';
import 'package:fitness_app/pages/profile.dart';
import 'screens/splash/splash_screen.dart';

class Routes {
  static const String splashScreen = '/splash';
  static const String activityScreen = '/';
  static const String insights = '/insights';
  static const String calendar = '/calendar';
  static const String profile = '/profile';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (_) =>  SplashScreen());
      case activityScreen:
        return MaterialPageRoute(builder: (_) =>  ActivityScreen());
      case insights:
        return MaterialPageRoute(builder: (_) =>  InsightsPage());
      case calendar:
        return MaterialPageRoute(builder: (_) =>  CalendarPage());
      case profile:
        return MaterialPageRoute(builder: (_) =>  ProfilePage());
      default:
        return MaterialPageRoute(builder: (_) =>  SplashScreen());
    }
  }
}
