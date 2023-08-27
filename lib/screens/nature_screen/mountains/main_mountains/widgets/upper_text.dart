import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UpperText extends StatelessWidget {
  const UpperText({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          const VerticalDivider(
            thickness: 7,
            color: Colors.orange,
          ),
          Text(
            'Горы',
            style: GoogleFonts.getFont('Oswald',
                color: Colors.black, fontSize: 36, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
