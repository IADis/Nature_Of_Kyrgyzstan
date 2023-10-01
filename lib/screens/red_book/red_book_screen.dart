import 'package:flutter/widgets.dart';
import 'package:nature_of_kyrgyzstan/screens/red_book/arthropods/arthropods.dart';
import 'package:nature_of_kyrgyzstan/screens/red_book/birds/birds.dart';
import 'package:nature_of_kyrgyzstan/screens/red_book/fish/fish.dart';
import 'package:nature_of_kyrgyzstan/screens/red_book/mammals/mammals.dart';
import 'package:nature_of_kyrgyzstan/screens/red_book/mushrooms/mushrooms.dart';
import 'package:nature_of_kyrgyzstan/screens/red_book/plants/plants.dart';
import 'package:nature_of_kyrgyzstan/screens/red_book/widgets/red_book_screen_item.dart';

import 'red_book_info/red_book_info.dart';

class RedBookScreen extends StatelessWidget {
  const RedBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Padding(
      padding: const EdgeInsets.only(
        top: 60,
      ),
      child: const SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            RedBookScreenItem(
              name: 'Общая Информация',
              navigate: RedBookInfo(),
              image:
                  'https://firebasestorage.googleapis.com/v0/b/nature-of-kyrgyzstan.appspot.com/o/Red%20book%20Backgrounds%20images%2FMushrooms.jpg?alt=media&token=5788cb34-4f71-4a16-be87-177f2c1e6a25&_gl=1*1wxv3l9*_ga*MTg0MzUwNDI3My4xNjk2MDAxNjEx*_ga_CW55HF8NVT*MTY5NjE2NzM5NS40LjAuMTY5NjE2NzM5NS42MC4wLjA.',
            ),
            RedBookScreenItem(
              name: 'Грибы',
              navigate: MushroomsScreen(),
              image:
                  'https://firebasestorage.googleapis.com/v0/b/nature-of-kyrgyzstan.appspot.com/o/Red%20book%20Backgrounds%20images%2FMushrooms.jpg?alt=media&token=5788cb34-4f71-4a16-be87-177f2c1e6a25&_gl=1*mmx1pb*_ga*MTg0MzUwNDI3My4xNjk2MDAxNjEx*_ga_CW55HF8NVT*MTY5NjE2NzM5NS40LjEuMTY5NjE2Nzk5NS41OS4wLjA.',
            ),
            RedBookScreenItem(
              name: 'Высшие Растения',
              navigate: PlantsScreen(),
              image:
                  'https://firebasestorage.googleapis.com/v0/b/nature-of-kyrgyzstan.appspot.com/o/Red%20book%20Backgrounds%20images%2FPlants.webp?alt=media&token=2bd9934e-40f8-42bf-bca5-a444c42cb8ec&_gl=1*84dd92*_ga*MTg0MzUwNDI3My4xNjk2MDAxNjEx*_ga_CW55HF8NVT*MTY5NjE2NzM5NS40LjEuMTY5NjE2NzQ0Mi4xMy4wLjA.',
            ),
            RedBookScreenItem(
              name: 'Членистоногие',
              navigate: ArthropodsScreen(),
              image:
                  'https://firebasestorage.googleapis.com/v0/b/nature-of-kyrgyzstan.appspot.com/o/Red%20book%20Backgrounds%20images%2FArthropods.jpg?alt=media&token=f19887ee-6345-4a26-a5c7-68ff2854438e&_gl=1*cqflhh*_ga*MTg0MzUwNDI3My4xNjk2MDAxNjEx*_ga_CW55HF8NVT*MTY5NjE2NzM5NS40LjEuMTY5NjE2NzQ3MS42MC4wLjA.',
            ),
            RedBookScreenItem(
              name: 'Рыбы',
              navigate: FishScreen(),
              image:
                  'https://firebasestorage.googleapis.com/v0/b/nature-of-kyrgyzstan.appspot.com/o/Red%20book%20Backgrounds%20images%2FFish.jpg?alt=media&token=99d9bab0-53fe-4f02-9fb1-416ad5791998&_gl=1*dlbhb*_ga*MTg0MzUwNDI3My4xNjk2MDAxNjEx*_ga_CW55HF8NVT*MTY5NjE2NzM5NS40LjEuMTY5NjE2NzUxNi4xNS4wLjA.',
            ),
            RedBookScreenItem(
              name: 'Птицы',
              navigate: BirdsScreen(),
              image:
                  'https://firebasestorage.googleapis.com/v0/b/nature-of-kyrgyzstan.appspot.com/o/Red%20book%20Backgrounds%20images%2FBirds.jpg?alt=media&token=c19e0bbd-8925-489e-bb14-41a5b03267c7&_gl=1*1wge8wd*_ga*MTg0MzUwNDI3My4xNjk2MDAxNjEx*_ga_CW55HF8NVT*MTY5NjE2NzM5NS40LjEuMTY5NjE2NzUzOS42MC4wLjA.',
            ),
            RedBookScreenItem(
              name: 'Млекопитающие',
              navigate: MammalsScreen(),
              image:
                  'https://firebasestorage.googleapis.com/v0/b/nature-of-kyrgyzstan.appspot.com/o/Red%20book%20Backgrounds%20images%2FMammals.jpg?alt=media&token=018c7513-72c0-4127-a3d9-1b4ddfc8a2fe&_gl=1*1q72fne*_ga*MTg0MzUwNDI3My4xNjk2MDAxNjEx*_ga_CW55HF8NVT*MTY5NjE2NzM5NS40LjEuMTY5NjE2NzU2Ny4zMi4wLjA.',
            ),
          ],
        ),
      ),
    );
  }
}
