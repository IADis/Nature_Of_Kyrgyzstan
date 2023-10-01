import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nature_of_kyrgyzstan/components/app_colors.dart';
import 'package:nature_of_kyrgyzstan/screens/home_screen/bottom_nav_icons_icons.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/nature_screen.dart';

import '../red_book/red_book_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  List<Widget> screens = [
    const NatureScreen(),
    const RedBookScreen(),
  ];
  int _currentIndex = 0;

  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        unselectedItemColor: Colors.blueAccent,
        selectedItemColor: Colors.green,
        type: BottomNavigationBarType.fixed,
        elevation: 5,
        currentIndex: _currentIndex,
        onTap: (index) {
          _currentIndex = index;
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              BottomNavIcons.plant_icon,
              size: 20,
            ),
            label: 'Природа',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.amber,
            icon: Icon(
              BottomNavIcons.red_book_icon,
            ),
            label: 'Красная Книга',
          ),
        ],
      ),
    );
  }
}
