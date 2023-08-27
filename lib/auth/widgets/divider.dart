import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          child: Divider(
            color: Colors.white,
            thickness: 1,
          ),
        ),
        const SizedBox(width: 5),
        Text(
          'ИЛИ',
          style: GoogleFonts.getFont(
            'Montserrat',
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 5),
        const Expanded(
          child: Divider(
            color: Colors.white,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
