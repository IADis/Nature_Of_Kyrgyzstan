import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.onPressed,
    required this.isFullFilled,
    required this.isLoading,
    required this.text,
  });

  final Function() onPressed;
  final String text;
  final bool isFullFilled;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: isLoading
            ? null
            : isFullFilled
                ? onPressed
                : null,
        child: isLoading
            ? const CircularProgressIndicator(
                strokeWidth: 4,
              )
            : Text(
                text,
                style: GoogleFonts.getFont(
                  'Montserrat',
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }
}
