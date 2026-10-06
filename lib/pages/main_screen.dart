// bottom navigation bar - para maka switch ta between different pages sa app
import 'package:flutter/material.dart';

import 'home_page.dart'; // same ra ug folder mao pwede ra diretso tawgon
import 'profile_page.dart';
import 'sample_page.dart';

// StatefulWidget kay mag change ang page depende sa gi select sa user
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

// 0 = Sample, 1 = Home, 2 = Profile
// list sa mga pages nga ato i-display
class _MainScreenState extends State<MainScreen> {
  // 1 kay Home Page ang default nga makita pag open sa app
  int _currentIndex = 1;

  // mga pages nga naa sa bottom navigation bar
  final List<Widget> pages = const [
    SamplePage(),
    HomePage(),
    ProfilePage(),
  ];

  // diri nato ibuild ang main screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // mag change ang title depende sa page nga gi select
        title: Text(
          _currentIndex == 1
              ? 'Home Page'
              : _currentIndex == 2
              ? 'Profile Page'
              : 'Sample Page',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),

        centerTitle: true,
        elevation: 2, // shadow sa app bar
        surfaceTintColor: Colors.transparent, // para walay extra tint
      ),

      body: AnimatedSwitcher(
        // para smooth ang pag switch sa page
        duration: const Duration(milliseconds: 400),

        // fade effect para dili kalit ang pag change sa page
        transitionBuilder: (child, animation) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },

        // mao ni ang page nga makita depende sa current index
        child: pages[_currentIndex],
      ),

      // bottom navigation bar para maka switch ta ug page
      bottomNavigationBar: NavigationBar(
        // mao ni ang current nga selected page
        selectedIndex: _currentIndex,

        // mo change ang page kung mag tap ta ug lain nga option
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },

        height: 65,

        // mga option nga makita sa bottom navigation bar
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.article),
            selectedIcon: Icon(Icons.article_outlined),
            label: 'Sample',
          ),

          NavigationDestination(
            icon: Icon(Icons.home),
            selectedIcon: Icon(Icons.home_outlined),
            label: 'Home',
          ),

          NavigationDestination(
            icon: Icon(Icons.person),
            selectedIcon: Icon(Icons.person_outlined),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}