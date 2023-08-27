import 'package:nature_of_kyrgyzstan/screens/nature_screen/water_resources/lakes/lakes.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/water_resources/main_water_resourses/model/water_resourses_model.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/water_resources/reservoir/reservoirs.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/water_resources/rivers/rivers.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/water_resources/watterfalls/watterfalls.dart';

class WaterResoursesRepo {
  List<WaterResoursesModel> getWaterResourses() {
    return _waterResourses;
  }

  final _waterResourses = [
    WaterResoursesModel(
      name: 'Озёра',
      image: 'assets/images/lakes.jpg',
      navigate: const LakesScreen(),
    ),
    WaterResoursesModel(
      name: 'Реки',
      image: 'assets/images/rivers.webp',
      navigate: const RiversScreen(),
    ),
    WaterResoursesModel(
      name: 'Водохранилища',
      image: 'assets/images/reservoir.jpg',
      navigate: const ReservoirsScreen(),
    ),
    WaterResoursesModel(
      name: 'Водопады',
      image: 'assets/images/watterfalls.jpg',
      navigate: const WatterfallsScreen(),
    ),
  ];
}
