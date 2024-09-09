import 'package:flutter/material.dart';
import 'package:fitness_app/widgets/bottom_bar.dart'; // Import bottom bar if necessary
import '../routes.dart'; // Import routes if necessary

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    
    _tabController = TabController(length: 3, vsync: this);
    _pageController = PageController();

    _pageController.addListener(() {
      final pageIndex = _pageController.page?.round() ?? 0;
      if (_tabController.index != pageIndex) {
        _tabController.animateTo(pageIndex);
      }
    });

    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        _pageController.jumpToPage(_tabController.index);
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      observers: [MyNavigatorObserver()],
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: const Text('Activities'),
            ),
            body: PageView(
              controller: _pageController,
              children: [
                AllActivitiesPage(onActivityClick: (activity) {
                  print('Navigating to details for: $activity');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ActivityDetailScreen(activity: activity),
                    ),
                  );
                }),
                const PopularActivitiesPage(),
                const IntensiveActivitiesPage(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class MyNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    print('Navigated to ${route.settings.name}');
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    print('Navigated back from ${route.settings.name}');
    super.didPop(route, previousRoute);
  }
}

// Define these pages as separate widgets or classes for each semi-page
class AllActivitiesPage extends StatelessWidget {
  final Function(String) onActivityClick;

  const AllActivitiesPage({super.key, required this.onActivityClick});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        GestureDetector(
          onTap: () {
            print('Activity clicked: Swimming');
            onActivityClick('Swimming');
          },
          child: const ActivityCard(
            imagePath: 'images/5.jpg',
            activityName: 'Swimming',
          ),
        ),
        GestureDetector(
          onTap: () {
            print('Activity clicked: Playing Tennis');
            onActivityClick('Playing Tennis');
          },
          child: const ActivityCard(
            imagePath: 'images/6.jpg',
            activityName: 'Playing Tennis',
          ),
        ),
        // Add more activities here
      ],
    );
  }
}

class PopularActivitiesPage extends StatelessWidget {
  const PopularActivitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Popular Activities'));
  }
}

class IntensiveActivitiesPage extends StatelessWidget {
  const IntensiveActivitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Intensive Activities'));
  }
}

class ActivityDetailScreen extends StatelessWidget {
  final String activity;

  const ActivityDetailScreen({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
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
      ),
    );
  }
}

// Reuse the ActivityCard widget if needed
class ActivityCard extends StatelessWidget {
  final String imagePath;
  final String activityName;

  const ActivityCard({
    super.key,
    required this.imagePath,
    required this.activityName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.asset(
              imagePath,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  activityName,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Icon(Icons.local_fire_department, color: Colors.orange),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
