import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
          'https://firebasestorage.googleapis.com/v0/b/nature-of-kyrgyzstan.appspot.com/o/main_images%2FGorges.jpg?alt=media&token=d8fbe88c-df31-4350-a33d-8e49e0170d78&_gl=1*vtrcma*_ga*MTg0MzUwNDI3My4xNjk2MDAxNjEx*_ga_CW55HF8NVT*MTY5NjI0MzUzMC42LjEuMTY5NjI0NDQ1MS45LjAuMA..',
      name: 'Ущелья',
      navigate: const GorgesScreen(),
      count: Text(
        '19',
        style: GoogleFonts.montserrat(
          fontSize: 24,
          color: Colors.white,
        ),
      ),
    ),
    MountainsModel(
      image:
          'https://firebasestorage.googleapis.com/v0/b/nature-of-kyrgyzstan.appspot.com/o/main_images%2FRidges_and_Peaks.jpg?alt=media&token=c57f1072-9fd0-4068-9aec-4b0b678be21b',
      name: 'Хребты и Пики',
      navigate: const RidgesAndPeaksScreen(),
      count: const Icon(Icons.abc),
    ),
    MountainsModel(
      image:
          'https://firebasestorage.googleapis.com/v0/b/nature-of-kyrgyzstan.appspot.com/o/main_images%2FGlaciers.jpg?alt=media&token=05eae090-a738-4a9c-aa1f-ef072121622f',
      name: 'Ледники',
      navigate: const GlaciersScreen(),
      count: const Icon(Icons.abc),
    ),
    MountainsModel(
      image:
          'https://firebasestorage.googleapis.com/v0/b/nature-of-kyrgyzstan.appspot.com/o/main_images%2FCanyons.jpg?alt=media&token=eca318a6-a17e-4a92-a7ea-d128b252808a',
      name: 'Каньоны',
      navigate: const CanyonsScreen(),
      count: const Icon(Icons.abc),
    ),
  ];
}
