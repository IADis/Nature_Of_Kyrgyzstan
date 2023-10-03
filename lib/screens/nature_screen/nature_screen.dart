import 'package:flutter/material.dart';
import 'package:nature_of_kyrgyzstan/components/app_colors.dart';
import 'package:nature_of_kyrgyzstan/components/app_text.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/mountains/main_mountains/main_mountains.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/reserves_parks/main_reserves/main_reserves.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/water_resources/main_water_resourses/main_water_resourses.dart';

class NatureScreen extends StatefulWidget {
  const NatureScreen({super.key});

  @override
  State<NatureScreen> createState() => _NatureScreenState();
}

class _NatureScreenState extends State<NatureScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: SizedBox(height: 60),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'Горы',
              style: AppText.mainTitleTextStyle,
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 220,
            child: MainMountain(),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'Водные ресуры',
              style: AppText.mainTitleTextStyle,
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 220,
            child: MainWaterResourses(),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                'Заповедники. Национальные парки. Заказники.',
                style: AppText.mainTitleTextStyle,
              ),
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 220,
            child: MainReserves(),
          ),
        ),
      ],
    );
  }
}
