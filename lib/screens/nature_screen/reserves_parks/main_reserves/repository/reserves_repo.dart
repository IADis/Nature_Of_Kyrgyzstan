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
          'https://photocasa.ru/uploads/posts/2022-07/1657184165_gudinalv_nevesomost_nature-aesthetic_ljudmila-gudina-ljudmila-vitalevna-gudina.jpg',
      name: 'Общая Инфорамация',
      navigate: const GeneralInfoScreen(),
    ),
    ReservesModel(
      image:
          'https://firebasestorage.googleapis.com/v0/b/nature-of-kyrgyzstan.appspot.com/o/gorges%2FKarakol%2FKarakol4.jpg?alt=media&token=12e79257-ddf2-4b94-a89d-9c6c8532af41',
      name: 'Заповедники',
      navigate: const ReservesScreen(),
    ),
    ReservesModel(
      image:
          'https://www.fotoget.net/wp-content/uploads/2016/02/man_north-1650x1100.jpg',
      name: 'Парки',
      navigate: const ParksScreen(),
    ),
  ];
}
