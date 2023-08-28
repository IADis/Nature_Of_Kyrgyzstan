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
      image:
          'https://firebasestorage.googleapis.com/v0/b/nature-of-kyrgyzstan.appspot.com/o/main_images%2FGorges.jpg?alt=media&token=1b34408a-17e9-4682-b25f-f59b7e11e645',
      name: 'Ущелья',
      navigate: const GorgesScreen(),
    ),
    MountainsModel(
      image:
          'https://firebasestorage.googleapis.com/v0/b/nature-of-kyrgyzstan.appspot.com/o/main_images%2FRidges_and_Peaks.jpg?alt=media&token=c57f1072-9fd0-4068-9aec-4b0b678be21b',
      name: 'Хребты и Пики',
      navigate: const RidgesAndPeaksScreen(),
    ),
    MountainsModel(
      image:
          'https://firebasestorage.googleapis.com/v0/b/nature-of-kyrgyzstan.appspot.com/o/main_images%2FGlaciers.jpg?alt=media&token=05eae090-a738-4a9c-aa1f-ef072121622f',
      name: 'Ледники',
      navigate: const GlaciersScreen(),
    ),
    MountainsModel(
      image:
          'https://firebasestorage.googleapis.com/v0/b/nature-of-kyrgyzstan.appspot.com/o/main_images%2FCanyons.jpg?alt=media&token=eca318a6-a17e-4a92-a7ea-d128b252808a',
      name: 'Каньоны',
      navigate: const CanyonsScreen(),
    ),
  ];
}
