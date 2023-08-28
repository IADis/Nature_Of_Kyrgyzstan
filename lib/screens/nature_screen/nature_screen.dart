import 'package:flutter/material.dart';
import 'package:nature_of_kyrgyzstan/components/app_colors.dart';
import 'package:nature_of_kyrgyzstan/components/app_text.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/mountains/main_mountains/main_mountains.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/reserves_parks/main_reserves/main_reserves.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/water_resources/main_water_resourses/main_water_resourses.dart';

class NatureScrenn extends StatefulWidget {
  const NatureScrenn({super.key});

  @override
  State<NatureScrenn> createState() => _NatureScrennState();
}

class _NatureScrennState extends State<NatureScrenn>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 60),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'Горы',
              style: AppText.mainTitleTextStyle,
            ),
          ),
          const SizedBox(
            height: 210,
            child: MainMountain(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'Водные ресуры',
              style: AppText.mainTitleTextStyle,
            ),
          ),
          const SizedBox(
            height: 210,
            child: MainWaterResourses(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                'Заповедники. Национальные парки. Заказники.',
                style: AppText.mainTitleTextStyle,
              ),
            ),
          ),
          const SizedBox(
            height: 210,
            child: MainReserves(),
          )
        ],
      ),
    );
  }
}
