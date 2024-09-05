import 'package:flutter/material.dart';
import 'package:fitness_app/widgets/bottom_bar.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _pageController = PageController();
    _pageController.addListener(() {
      setState(() {
        _currentIndex = _pageController.page?.round() ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _onNavBarTapped(int index) {
    _pageController.jumpToPage(index);
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
        children: [
          ActivityList(),
          const Center(child: Text('Popular Activities')),
          const Center(child: Text('Intensive Activities')),
        ],
      ),

    );
  }

  Widget _buildNavBarIcon(IconData iconData, int index) {
    final bool isSelected = _currentIndex == index;
    return Stack(
      alignment: Alignment.center,
      children: [
        if (isSelected)
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
          ),
        IconButton(
          icon: Icon(
            iconData,
            color: isSelected ? const Color.fromARGB(255, 255, 255, 255) : Colors.black,
          ),
          onPressed: () => _onNavBarTapped(index),
        ),
      ],
    );
  }
}

class ActivityList extends StatelessWidget {
  const ActivityList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        ActivityCard(
          imagePath: 'images/5.jpg',
          activityName: 'Swimming',
        ),
        ActivityCard(
          imagePath: 'images/6.jpg',
          activityName: 'Playing Tennis',
        ),
      ],
    );
  }
}

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
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
