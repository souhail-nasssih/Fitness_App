import 'package:fitness_app/pages/components/allActivity.dart';
import 'package:fitness_app/pages/components/detailActivity.dart';
import 'package:fitness_app/layouts/bottom_bar.dart';
import 'package:flutter/material.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activities'),
        bottom: TabBar(
          controller: _tabController,
          labelColor: const Color.fromARGB(255, 0, 0, 0),
          unselectedLabelColor: const Color.fromARGB(255, 0, 0, 0),
          indicatorColor: const Color.fromARGB(255, 0, 0, 0),
          tabs: const [
            Tab(text: '   All   '),
            Tab(text: 'Popular'),
            Tab(text: 'Intensive'),
          ],
        ),
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
      bottomNavigationBar: const BottomBar(
        currentIndex: 0,
      ),
    );
  }
}

class PopularActivitiesPage extends StatelessWidget {
  const PopularActivitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Popular Activities'));
  }
}

class IntensiveActivitiesPage extends StatelessWidget {
  const IntensiveActivitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Intensive Activities'));
  }
}
