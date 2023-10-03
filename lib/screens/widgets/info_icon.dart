import 'package:flutter/material.dart';

import '../bottom_nav_icons_icons.dart';

class InfoIconWidget extends StatelessWidget {
  const InfoIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(
      BottomNavIcons.info,
      size: 24,
      weight: 2,
      color: Colors.white,
    );
  }
}
