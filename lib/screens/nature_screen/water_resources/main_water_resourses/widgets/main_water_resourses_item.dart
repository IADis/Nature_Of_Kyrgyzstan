import 'package:flutter/material.dart';

import 'package:nature_of_kyrgyzstan/screens/nature_screen/water_resources/main_water_resourses/model/water_resourses_model.dart';
import 'package:nature_of_kyrgyzstan/screens/widgets/main_list_item.dart';

class WaterResoursesItem extends StatelessWidget {
  const WaterResoursesItem({
    super.key,
    required this.model,
  });

  final WaterResoursesModel model;
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
