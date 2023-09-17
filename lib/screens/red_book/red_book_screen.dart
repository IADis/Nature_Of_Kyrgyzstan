import 'package:flutter/material.dart';
import 'package:nature_of_kyrgyzstan/screens/red_book/red_book_info/red_book_info.dart';

import 'mushrooms/mushrooms.dart';
import 'plants/plants.dart';
import 'widgets/red_book_screen_item.dart';

class RedBookScreen extends StatelessWidget {
  const RedBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 60),
          RedBookScreenItem(
            text: 'Общ. инф',
            navigate: RedBoodInfo(),
          ),
          SizedBox(height: 60),
          RedBookScreenItem(
            text: 'Гриюы',
            navigate: MushroomsScreen(),
          ),
          SizedBox(height: 60),
          RedBookScreenItem(
            text: 'Высшие растения',
            navigate: PlantsScreen(),
          ),
        ],
      ),
    );
  }
}
