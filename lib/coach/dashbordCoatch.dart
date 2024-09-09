import 'package:flutter/material.dart';

class Dashbordcoatch extends StatefulWidget {
  const Dashbordcoatch({super.key});

  @override
  State<Dashbordcoatch> createState() => _DashbordcoatchState();
}

class _DashbordcoatchState extends State<Dashbordcoatch>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: 3,
      vsync: this, // 3 tabs for All, Popular, Intensive
    );
    _pageController = PageController();

    // Sync PageView with TabBar
    _pageController.addListener(() {
      final pageIndex = _pageController.page?.round() ?? 0;
      if (_tabController.index != pageIndex) {
        _tabController.animateTo(pageIndex);
      }
    });

    // Sync TabBar with PageView
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
        backgroundColor: const Color.fromARGB(255, 250, 254, 252),
        elevation: 0,
        title: const Text(
          'Activities',
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Color.fromARGB(255, 0, 0, 0)),
            onPressed: () {},
          ),
        ],
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
        children: const [
          // Placeholder widgets or your actual activity pages
          Placeholder(), // AllActivitiesPage(),
          Placeholder(), // PopularActivitiesPage(),
          Placeholder(), // IntensiveActivitiesPage(),
        ],
      ),
    );
  }
}
