import 'package:flutter/material.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/water_resources/lakes/lakes.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/water_resources/main_water_resourses/model/water_resourses_model.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/water_resources/reservoir/reservoirs.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/water_resources/rivers/rivers.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/water_resources/watterfalls/watterfalls.dart';
import 'package:nature_of_kyrgyzstan/screens/widgets/info_icon.dart';

import '../../../../widgets/count_icon.dart';

class WaterResoursesRepo {
  List<WaterResoursesModel> getWaterResourses() {
    return _waterResourses;
  }

  final _waterResourses = [
    WaterResoursesModel(
      name: 'Озёра',
      image:
          'https://firebasestorage.googleapis.com/v0/b/nature-of-kyrgyzstan.appspot.com/o/main_images%2FLakes.webp?alt=media&token=5c88e8f7-0e05-4b16-adcb-b6f615a19187',
      navigate: const LakesScreen(),
      count: const CountIconWidget(
        count: '17',
      ),
    ),
    WaterResoursesModel(
      name: 'Реки',
      image:
          'https://firebasestorage.googleapis.com/v0/b/nature-of-kyrgyzstan.appspot.com/o/main_images%2FRivers.jpg?alt=media&token=75b55eea-b85d-4fec-8096-62ad2308578f',
      navigate: const RiversScreen(),
      count: const InfoIconWidget(),
    ),
    WaterResoursesModel(
      name: 'Водохранилища',
      image:
          'https://firebasestorage.googleapis.com/v0/b/nature-of-kyrgyzstan.appspot.com/o/main_images%2FReservoir.jpg?alt=media&token=8b566f65-2d22-4231-8f8b-e2ce01f97bf4',
      navigate: const ReservoirsScreen(),
      count: const InfoIconWidget(),
    ),
    WaterResoursesModel(
      name: 'Водопады',
      image:
          'https://firebasestorage.googleapis.com/v0/b/nature-of-kyrgyzstan.appspot.com/o/main_images%2FWatterfalls.jpg?alt=media&token=2d1aa7e5-2bbe-499f-9f72-c553a08e2967',
      navigate: const WatterfallsScreen(),
      count: const InfoIconWidget(),
    ),
  ];
}
