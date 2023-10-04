import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:nature_of_kyrgyzstan/components/app_colors.dart';
import 'package:nature_of_kyrgyzstan/screens/home_screen/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      animationDuration: const Duration(seconds: 3),
      splashTransition: SplashTransition.fadeTransition,
      curve: Curves.easeInToLinear,
      splashIconSize: 250,
      backgroundColor: AppColors.scaffoldBackgroundColor,
      splash: Center(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/applogo.png'),
              ),
              boxShadow: []),
        ),
      ),
      nextScreen: const HomeScreen(),
    );
  }
}
