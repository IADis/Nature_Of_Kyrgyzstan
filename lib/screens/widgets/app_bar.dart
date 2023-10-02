import 'package:flutter/material.dart';
import 'package:nature_of_kyrgyzstan/components/app_colors.dart';
import 'package:nature_of_kyrgyzstan/components/app_text.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  const AppBarWidget({
    this.name,
    super.key,
    required this.elevation,
  });

  final String? name;
  final double elevation;

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(50);
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          iconSize: 34,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
          )),
      foregroundColor: AppColors.appBarForegruoundColor,
      backgroundColor: AppColors.appBarBackgroundColor,
      title: Text(
        widget.name ?? '',
        style: AppText.titleTextStyle,
      ),
      centerTitle: true,
      elevation: widget.elevation,
    );
  }
}
