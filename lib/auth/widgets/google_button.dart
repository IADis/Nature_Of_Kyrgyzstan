import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nature_of_kyrgyzstan/auth/services/auth_services.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AuthServices().signInWithGoogle();
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 17,
            sigmaY: 17,
          ),
          child: Container(
            height: 70,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/google_logo.png'),
                const SizedBox(width: 5),
                Text(
                  'Войти с помощью Google'.toUpperCase(),
                  style: GoogleFonts.getFont(
                    'Montserrat',
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
