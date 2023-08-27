import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/mountains/main_mountains/model/mountain_model.dart';
import 'package:page_transition/page_transition.dart';

class MainMountainsItem extends StatelessWidget {
  const MainMountainsItem({super.key, required this.model});

  final MountainsModel model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(5),
      onTap: () => Navigator.push(
          context,
          PageTransition(
              reverseDuration: const Duration(seconds: 1),
              duration: const Duration(seconds: 1),
              child: model.navigate,
              type: PageTransitionType.bottomToTop)),
      child: Container(
        width: 340,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(model.image),
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.2), BlendMode.darken)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 10,
              offset: const Offset(2, 6), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 2,
                      sigmaY: 2,
                    ),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          // border: Border.all(width: 0.5, color: Colors.white),
                          color: Colors.white.withOpacity(0.1),
                          shape: BoxShape.circle),
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              model.name,
              style: GoogleFonts.getFont('Montserrat',
                  color: Colors.white, fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
