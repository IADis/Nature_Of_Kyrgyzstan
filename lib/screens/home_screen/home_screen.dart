import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nature_of_kyrgyzstan/components/app_colors.dart';
import 'package:nature_of_kyrgyzstan/screens/bottom_nav_icons_icons.dart';
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
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        iconSize: 28,
        selectedIconTheme: const IconThemeData(color: Colors.green),
        selectedLabelStyle: GoogleFonts.montserrat(
            fontWeight: FontWeight.w700, color: Colors.black),
        unselectedLabelStyle: GoogleFonts.montserrat(
          fontWeight: FontWeight.w500,
        ),
        selectedFontSize: 16,
        unselectedFontSize: 14,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          _currentIndex = index;
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              BottomNavIcons.nature,
            ),
            label: 'Природа',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              BottomNavIcons.redbookactive,
              color: Colors.red,
            ),
            icon: Icon(
              BottomNavIcons.redbook,
            ),
            label: 'Красная Книга',
          ),
        ],
      ),
    );
  }
}
