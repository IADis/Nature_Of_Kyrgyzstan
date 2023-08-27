import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nature_of_kyrgyzstan/components/app_colors.dart';
import 'package:nature_of_kyrgyzstan/components/app_text.dart';

class AppBarWithSearchWidget extends StatefulWidget
    implements PreferredSizeWidget {
  const AppBarWithSearchWidget({
    super.key,
    required this.text,
    required this.onChanged,
  });
  final String text;
  final Function(String value) onChanged;

  @override
  State<AppBarWithSearchWidget> createState() => _AppBarWithSearchWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(205);
}

class _AppBarWithSearchWidgetState extends State<AppBarWithSearchWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 205,
      leadingWidth: double.infinity,
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              splashColor: const Color(0x00000000),
              splashRadius: 0.1,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.text,
              style: AppText.mainTitleTextStyle,
            ),
            const SizedBox(height: 20),
            TextField(
              onChanged: widget.onChanged,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                hintText: 'Поиск',
                hintStyle: GoogleFonts.getFont(
                  'Montserrat',
                  fontSize: 16,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(6),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
          ],
        ),
      ),
      foregroundColor: AppColors.appBarForegruoundColor,
      backgroundColor: AppColors.appBarBackgroundColor,
      elevation: 0,
    );
  }
}
