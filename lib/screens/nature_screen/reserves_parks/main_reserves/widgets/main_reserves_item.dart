import 'package:flutter/material.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/reserves_parks/main_reserves/model/reserves_model.dart';
import 'package:nature_of_kyrgyzstan/screens/widgets/main_list_item.dart';

class MainReservesItem extends StatelessWidget {
  const MainReservesItem({
    required this.model,
    super.key,
  });

  final ReservesModel model;

  @override
  Widget build(BuildContext context) {
    return MainListItem(
      modelNavigate: model.navigate,
      modelImage: model.image,
      modelName: model.name,
      modelCount: model.count,
    );
  }
}
