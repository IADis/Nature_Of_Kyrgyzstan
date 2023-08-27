import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({
    super.key,
    this.descriptonText,
    required this.text,
  });
  final String text;
  final String? descriptonText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: GoogleFonts.getFont('Oswald',
              fontSize: 36, color: Colors.white, fontWeight: FontWeight.w500),
        ),
        Text(
          descriptonText ?? '',
          style: GoogleFonts.getFont('Montserrat',
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
