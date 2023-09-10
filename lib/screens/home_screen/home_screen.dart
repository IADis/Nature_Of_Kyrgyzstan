import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/nature_screen.dart';
import 'package:nature_of_kyrgyzstan/screens/setting_screen/settings.dart';

import '../red_book/red_book_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> screens = [
    const NatureScreen(),
    const RedBookScreen(),
    const SettingScreen(),
  ];
  int _currentIndex = 0;

  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          _currentIndex = index;
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.nature,
              ),
              label: 'Природа'),
          BottomNavigationBarItem(
              backgroundColor: Colors.amber,
              icon: Icon(
                Icons.menu_book,
              ),
              label: 'Красная Книга'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.verified_user,
              ),
              label: 'Setting'),
        ],
      ),
    );
  }
}
