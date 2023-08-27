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
      image: 'https://ecostan.kg/uploads/posts/2019-07/1563700182_a60a5493.jpg',
      name: 'Общая Инфорамация',
      navigate: const GeneralInfoScreen(),
    ),
    ReservesModel(
      image: 'https://ecostan.kg/uploads/posts/2019-07/1563703284_0-42.jpg',
      name: 'Заповедники',
      navigate: const ReservesScreen(),
    ),
    ReservesModel(
      image: 'https://ecostan.kg/uploads/posts/2019-07/1563703266_0-23.jpg',
      name: 'Парки',
      navigate: const ParksScreen(),
    ),
  ];
}
