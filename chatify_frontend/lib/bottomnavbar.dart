import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key, required this.setPage});

  final Function setPage;
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentPageIndex = 0;

  void _pageSelected(int index) {
    currentPageIndex = index;
    widget.setPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: (int index) {
        _pageSelected(index);
      },
      indicatorColor: Theme.of(context).colorScheme.inversePrimary,
      selectedIndex: currentPageIndex,
      destinations: const <NavigationDestination>[
        NavigationDestination(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        NavigationDestination(
          icon: Icon(Icons.library_books_sharp),
          label: 'Library',
        ),
      ],
    );
  }
}
