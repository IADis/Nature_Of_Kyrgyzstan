import 'package:nature_of_kyrgyzstan/screens/nature_screen/mountains/canyons/canyons.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/mountains/glaciers/glaciers.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/mountains/gorges/gorges.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/mountains/main_mountains/model/mountain_model.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/mountains/ridges_and_peaks/ridges_and_peaks.dart';

class MountainsRepo {
  List<MountainsModel> getMountains() {
    return _mountains;
  }

  final _mountains = [
    MountainsModel(
      image: 'assets/images/gorges.jpg',
      name: 'Ущелья',
      navigate: const GorgesScreen(),
    ),
    MountainsModel(
      image: 'assets/images/ridgesandpeaks.jpg',
      name: 'Хребты и Пики',
      navigate: const RidgesAndPeaksScreen(),
    ),
    MountainsModel(
      image: 'assets/images/glaciers.jpg',
      name: 'Ледники',
      navigate: const GlaciersScreen(),
    ),
    MountainsModel(
      image: 'assets/images/canyons.jpg',
      name: 'Каньоны',
      navigate: const CanyonsScreen(),
    ),
  ];
}
