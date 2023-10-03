import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CountIconWidget extends StatelessWidget {
  const CountIconWidget({
    super.key,
    required this.count,
  });

  final String count;

  @override
  Widget build(BuildContext context) {
    return Text(
      count,
      style: GoogleFonts.montserrat(
        fontSize: 24,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
