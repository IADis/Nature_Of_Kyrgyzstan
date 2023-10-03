import 'package:flutter/material.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/reserves_parks/general_info/general_info.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/reserves_parks/main_reserves/model/reserves_model.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/reserves_parks/parks/parks.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/reserves_parks/reserves/reserves.dart';

class ReservesRepo {
  List<ReservesModel> getMountains() {
    return _mountains;
  }

  final _mountains = [
    ReservesModel(
      image:
          'https://firebasestorage.googleapis.com/v0/b/nature-of-kyrgyzstan.appspot.com/o/Info.jpg?alt=media&token=5149cefd-78e5-4c41-a543-aa90e3c7ab21&_gl=1*q4k8m2*_ga*MTg0MzUwNDI3My4xNjk2MDAxNjEx*_ga_CW55HF8NVT*MTY5NjI0MzUzMC42LjEuMTY5NjI0NDIwNS4xNC4wLjA.',
      name: 'Общая Инфорамация',
      navigate: const GeneralInfoScreen(),
      count: const Icon(Icons.abc),
    ),
    ReservesModel(
      image:
          'https://firebasestorage.googleapis.com/v0/b/nature-of-kyrgyzstan.appspot.com/o/Reserves.jpg?alt=media&token=9b382dc0-fd57-4e36-a29e-cac54e09165e&_gl=1*1fxhie1*_ga*MTg0MzUwNDI3My4xNjk2MDAxNjEx*_ga_CW55HF8NVT*MTY5NjI0MzUzMC42LjEuMTY5NjI0NDI1MC4zNi4wLjA.',
      name: 'Заповедники',
      navigate: const ReservesScreen(),
      count: const Icon(Icons.abc),
    ),
    ReservesModel(
      image:
          'https://firebasestorage.googleapis.com/v0/b/nature-of-kyrgyzstan.appspot.com/o/Parks.jpg?alt=media&token=6af7d70c-8acc-44b4-bde5-dcb6a7c90fc0&_gl=1*1hx00pd*_ga*MTg0MzUwNDI3My4xNjk2MDAxNjEx*_ga_CW55HF8NVT*MTY5NjI0MzUzMC42LjEuMTY5NjI0NDQwOC41Mi4wLjA.',
      name: 'Парки',
      navigate: const ParksScreen(),
      count: const Icon(Icons.abc),
    ),
  ];
}
