import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// A reusable BottomNavigationBar widget for navigating between different pages.
///
/// This widget provides navigation between FriendsPage, FeedPage, and ProfilePage
/// using the go_router package.
class CustomBottomNavigationBar extends StatelessWidget {
  /// The index of the currently selected tab.
  final int currentIndex;

  /// Creates a CustomBottomNavigationBar widget.
  ///
  /// The [currentIndex] parameter is required and indicates the currently selected tab.
  const CustomBottomNavigationBar({
    required this.currentIndex,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (index) {
        switch (index) {
          case 0:
            context.go('/friends');
            break;
          case 1:
            context.go('/feed');
            break;
          case 2:
            context.go('/profile');
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.group),
          label: 'Friends',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}
