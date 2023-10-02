import 'package:flutter/material.dart';
import '../../../components/app_colors.dart';
import '../../../components/app_text.dart';

class RedBookAppBar extends StatefulWidget implements PreferredSizeWidget {
  const RedBookAppBar({
    super.key,
    required this.foregroundColor,
    required this.title,
    required this.savebool,
    required this.switchList,
  });

  final Color foregroundColor;
  final String title;
  final void Function() savebool;
  final bool switchList;

  @override
  State<RedBookAppBar> createState() => _RedBookAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class _RedBookAppBarState extends State<RedBookAppBar> {
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
        ),
      ),
      backgroundColor: AppColors.scaffoldBackgroundColor,
      foregroundColor: widget.foregroundColor,
      title: Text(
        widget.title,
        style: AppText.redBookTitleText,
      ),
      centerTitle: true,
      actions: [
        IconButton(
          iconSize: 34,
          highlightColor: Colors.transparent,
          focusColor: Colors.transparent,
          splashColor: Colors.transparent,
          onPressed: () {
            widget.savebool();
          },
          icon: widget.switchList
              ? const Icon(Icons.grid_view_rounded)
              : const Icon(Icons.view_list_sharp),
        ),
      ],
    );
  }
}
