import 'package:flutter/widgets.dart';
import 'package:nature_of_kyrgyzstan/screens/red_book/arthropods/arthropods.dart';
import 'package:nature_of_kyrgyzstan/screens/red_book/birds/birds.dart';
import 'package:nature_of_kyrgyzstan/screens/red_book/fish/fish.dart';
import 'package:nature_of_kyrgyzstan/screens/red_book/mammals/mammals.dart';
import 'package:nature_of_kyrgyzstan/screens/red_book/mushrooms/mushrooms.dart';
import 'package:nature_of_kyrgyzstan/screens/red_book/plants/plants.dart';
import 'package:nature_of_kyrgyzstan/screens/red_book/reptiles/reptiles.dart';
import 'package:nature_of_kyrgyzstan/screens/red_book/widgets/red_book_screen_item.dart';
import 'package:nature_of_kyrgyzstan/screens/widgets/count_icon.dart';
import 'package:nature_of_kyrgyzstan/screens/widgets/info_icon.dart';

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
                  'https://firebasestorage.googleapis.com/v0/b/nature-of-kyrgyzstan.appspot.com/o/Red%20book%20Backgrounds%20images%2FMammals.jpg?alt=media&token=018c7513-72c0-4127-a3d9-1b4ddfc8a2fe&_gl=1*1q72fne*_ga*MTg0MzUwNDI3My4xNjk2MDAxNjEx*_ga_CW55HF8NVT*MTY5NjE2NzM5NS40LjEuMTY5NjE2NzU2Ny4zMi4wLjA.',
              count: InfoIconWidget(),
            ),
            RedBookScreenItem(
              name: 'Грибы',
              navigate: MushroomsScreen(),
              image:
                  'https://firebasestorage.googleapis.com/v0/b/nature-of-kyrgyzstan.appspot.com/o/Red%20book%20Backgrounds%20images%2FMushrooms.jpg?alt=media&token=a6f72cd2-0e93-4dce-b531-38adeea95adc&_gl=1*mkbtjx*_ga*MTg0MzUwNDI3My4xNjk2MDAxNjEx*_ga_CW55HF8NVT*MTY5NjIzODcyMS41LjEuMTY5NjIzODc3OC4zLjAuMA..',
              count: CountIconWidget(count: '4'),
            ),
            RedBookScreenItem(
              name: 'Высшие Растения',
              navigate: PlantsScreen(),
              image:
                  'https://firebasestorage.googleapis.com/v0/b/nature-of-kyrgyzstan.appspot.com/o/Red%20book%20Backgrounds%20images%2FPlants.jpg?alt=media&token=1ac7d1a5-a291-4e2c-8cf5-4c17ca0eb4e2&_gl=1*1nrvkp*_ga*MTg0MzUwNDI3My4xNjk2MDAxNjEx*_ga_CW55HF8NVT*MTY5NjIzODcyMS41LjEuMTY5NjIzODgwOC4zNS4wLjA.',
              count: CountIconWidget(count: '83'),
            ),
            RedBookScreenItem(
              name: 'Членистоногие',
              navigate: ArthropodsScreen(),
              image:
                  'https://firebasestorage.googleapis.com/v0/b/nature-of-kyrgyzstan.appspot.com/o/Red%20book%20Backgrounds%20images%2FArthropods.jpg?alt=media&token=f19887ee-6345-4a26-a5c7-68ff2854438e&_gl=1*cqflhh*_ga*MTg0MzUwNDI3My4xNjk2MDAxNjEx*_ga_CW55HF8NVT*MTY5NjE2NzM5NS40LjEuMTY5NjE2NzQ3MS42MC4wLjA.',
              count: CountIconWidget(count: '18'),
            ),
            RedBookScreenItem(
              name: 'Рыбы',
              navigate: FishScreen(),
              image:
                  'https://firebasestorage.googleapis.com/v0/b/nature-of-kyrgyzstan.appspot.com/o/Red%20book%20Backgrounds%20images%2FFish.jpg?alt=media&token=99d9bab0-53fe-4f02-9fb1-416ad5791998&_gl=1*dlbhb*_ga*MTg0MzUwNDI3My4xNjk2MDAxNjEx*_ga_CW55HF8NVT*MTY5NjE2NzM5NS40LjEuMTY5NjE2NzUxNi4xNS4wLjA.',
              count: CountIconWidget(count: '7'),
            ),
            RedBookScreenItem(
              name: 'Птицы',
              navigate: BirdsScreen(),
              image:
                  'https://firebasestorage.googleapis.com/v0/b/nature-of-kyrgyzstan.appspot.com/o/Red%20book%20Backgrounds%20images%2FBirds.jpg?alt=media&token=c19e0bbd-8925-489e-bb14-41a5b03267c7&_gl=1*1wge8wd*_ga*MTg0MzUwNDI3My4xNjk2MDAxNjEx*_ga_CW55HF8NVT*MTY5NjE2NzM5NS40LjEuMTY5NjE2NzUzOS42MC4wLjA.',
              count: CountIconWidget(count: '57'),
            ),
            RedBookScreenItem(
              name: 'Млекопитающие',
              navigate: MammalsScreen(),
              image:
                  'https://firebasestorage.googleapis.com/v0/b/nature-of-kyrgyzstan.appspot.com/o/Red%20book%20Backgrounds%20images%2FInfo.jpg?alt=media&token=3f6c249f-4d14-4a05-8b09-971e0e5471de&_gl=1*1ehrirn*_ga*MTg0MzUwNDI3My4xNjk2MDAxNjEx*_ga_CW55HF8NVT*MTY5NjI0MzUzMC42LjEuMTY5NjI0NDk1MC41MS4wLjA.',
              count: CountIconWidget(count: '23'),
            ),
            RedBookScreenItem(
              name: 'Амфибии и Рептилии',
              navigate: ReptilesScreen(),
              image:
                  'https://firebasestorage.googleapis.com/v0/b/nature-of-kyrgyzstan.appspot.com/o/Red%20book%20Backgrounds%20images%2FReptiles.jpg?alt=media&token=d3666150-4de8-4395-a472-53e25693f650&_gl=1*1qy5gn8*_ga*MTg0MzUwNDI3My4xNjk2MDAxNjEx*_ga_CW55HF8NVT*MTY5NjIzODcyMS41LjEuMTY5NjIzODgyNC4xOS4wLjA.',
              count: CountIconWidget(count: '10'),
            ),
          ],
        ),
      ),
    );
  }
}
