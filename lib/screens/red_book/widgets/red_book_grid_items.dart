import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../components/app_colors.dart';
import '../plants/plants_detail_screen.dart';

class RedBookGridItems extends StatelessWidget {
  const RedBookGridItems({
    super.key,
    required this.image,
    required this.navigate,
    required this.name,
    required this.nameLat,
    required this.heroGridImage,
  });

  final String image;
  final DocumentSnapshot navigate;
  final String name;
  final String nameLat;
  final String heroGridImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          PageRouteBuilder(
            fullscreenDialog: true,
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return PlantsDetailScreen(documentSnapshot: navigate);
            },
            transitionDuration: const Duration(
              seconds: 1,
            ),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return Align(
                child: FadeTransition(
                  opacity: animation,
                  child: child,
                ),
              );
            },
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: image,
              imageBuilder: (context, imageProvider) => Hero(
                tag: heroGridImage,
                child: Container(
                  height: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    image:
                        DecorationImage(fit: BoxFit.fill, image: imageProvider),
                  ),
                ),
              ),
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(
                  color: AppColors.activeColors,
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            const SizedBox(height: 5),
            Text(
              maxLines: 2,
              overflow: TextOverflow.fade,
              name.toString(),
              style: GoogleFonts.montserratAlternates(
                color: const Color(0xff232828),
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              softWrap: false,
              overflow: TextOverflow.fade,
              nameLat.toString(),
              style: GoogleFonts.raleway(
                color: AppColors.activeColors,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
