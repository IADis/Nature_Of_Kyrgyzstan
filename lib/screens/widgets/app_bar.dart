import 'package:flutter/material.dart';
import 'package:nature_of_kyrgyzstan/components/app_colors.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(50);
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: AppColors.appBarForegruoundColor,
      backgroundColor: AppColors.appBarBackgroundColor,
      elevation: 0,
    );
  }
}
