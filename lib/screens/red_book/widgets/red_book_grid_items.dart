import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../components/app_colors.dart';

class RedBookGridItems extends StatelessWidget {
  const RedBookGridItems({
    super.key,
    required this.image,
    required this.navigate,
    required this.name,
    required this.nameLat,
    required this.heroGridImage,
    required this.colorNameLat,
    required this.circularColor,
  });

  final String image;
  final Widget navigate;
  final String name;
  final String nameLat;
  final String heroGridImage;
  final Color colorNameLat;
  final Color circularColor;

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
              return navigate;
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
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
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
              placeholder: (context, url) => Center(
                child: SizedBox(
                  width: double.infinity,
                  height: 170,
                  child: CircularProgressIndicator(
                    color: circularColor,
                  ),
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
                color: colorNameLat,
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
