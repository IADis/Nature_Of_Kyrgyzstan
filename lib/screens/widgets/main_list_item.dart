import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class MainListItem extends StatelessWidget {
  const MainListItem({
    super.key,
    required this.modelNavigate,
    required this.modelImage,
    required this.modelName,
  });
  final Widget modelNavigate;
  final String modelImage;
  final String modelName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(5),
      onTap: () => Navigator.push(
        context,
        PageTransition(
            reverseDuration: const Duration(seconds: 1),
            duration: const Duration(seconds: 1),
            child: modelNavigate,
            type: PageTransitionType.bottomToTop),
      ),
      child: CachedNetworkImage(
        imageUrl: modelImage,
        imageBuilder: (context, imageProvider) => Container(
          width: 340,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: imageProvider,
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
                modelName,
                style: GoogleFonts.getFont('Montserrat',
                    color: Colors.white, fontSize: 24),
              ),
            ],
          ),
        ),
        placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(
            color: Colors.orange,
          ),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
