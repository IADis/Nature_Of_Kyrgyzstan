import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomText extends StatelessWidget {
  const BottomText({
    super.key,
    required this.textOne,
    required this.textTwo,
    required this.show,
  });

  final String textOne;
  final String textTwo;
  final Function() show;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          textOne,
          style: GoogleFonts.getFont(
            'Montserrat',
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 3),
        InkWell(
          onTap: show,
          child: Text(
            textTwo,
            style: GoogleFonts.getFont(
              'Montserrat',
              color: Colors.orange,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }
}
