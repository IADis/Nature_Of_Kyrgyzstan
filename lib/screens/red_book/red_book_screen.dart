import 'package:flutter/material.dart';
import 'package:nature_of_kyrgyzstan/screens/red_book/arthropods/arthropods.dart';
import 'package:nature_of_kyrgyzstan/screens/red_book/birds/birds.dart';
import 'package:nature_of_kyrgyzstan/screens/red_book/fish/fish.dart';
import 'package:nature_of_kyrgyzstan/screens/red_book/mammals/mammals.dart';
import 'package:nature_of_kyrgyzstan/screens/red_book/red_book_info/red_book_info.dart';
import 'package:nature_of_kyrgyzstan/screens/red_book/reptiles/reptiles.dart';

import 'mushrooms/mushrooms.dart';
import 'plants/plants.dart';
import 'widgets/red_book_screen_item.dart';

class RedBookScreen extends StatelessWidget {
  const RedBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 60),
            RedBookScreenItem(
              text: 'Общ. инф',
              navigate: RedBoodInfo(),
            ),
            SizedBox(height: 60),
            RedBookScreenItem(
              text: 'Грибы',
              navigate: MushroomsScreen(),
            ),
            SizedBox(height: 60),
            RedBookScreenItem(
              text: 'Высшие растения',
              navigate: PlantsScreen(),
            ),
            SizedBox(height: 60),
            RedBookScreenItem(
              text: 'Членостоногие',
              navigate: ArthropodsScreen(),
            ),
            SizedBox(height: 60),
            RedBookScreenItem(
              text: 'Рыбы',
              navigate: FishScreen(),
            ),
            SizedBox(height: 60),
            RedBookScreenItem(
              text: 'Амфибии и Рептилии',
              navigate: ReptilesScreen(),
            ),
            SizedBox(height: 60),
            RedBookScreenItem(
              text: 'Птицы',
              navigate: BirdsScreen(),
            ),
            SizedBox(height: 60),
            RedBookScreenItem(
              text: 'Млекопитающие',
              navigate: MammalsScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
