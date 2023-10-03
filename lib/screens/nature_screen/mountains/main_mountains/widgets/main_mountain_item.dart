import 'package:flutter/material.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/mountains/main_mountains/model/mountain_model.dart';
import 'package:nature_of_kyrgyzstan/screens/widgets/main_list_item.dart';

class MainMountainsItem extends StatelessWidget {
  const MainMountainsItem({super.key, required this.model});

  final MountainsModel model;

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
