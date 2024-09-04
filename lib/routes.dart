import 'package:flutter/material.dart';
import 'pages/activity.dart';
import 'pages/insights.dart';
import 'pages/calendar.dart';
import 'pages/profile.dart';

class Routes {
  static const String activityScreen = '/';
  static const String insights = '/insights';
  static const String calendar = '/calendar';
  static const String profile = '/profile';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case activityScreen:
        return MaterialPageRoute(builder: (_) => ActivityScreen());
      case insights:
        return MaterialPageRoute(builder: (_) => InsightsPage());
      case calendar:
        return MaterialPageRoute(builder: (_) => CalendarPage());
      case profile:
        return MaterialPageRoute(builder: (_) => ProfilePage());
      default:
        return MaterialPageRoute(builder: (_) => ActivityScreen()); // Default route
    }
  }
}
