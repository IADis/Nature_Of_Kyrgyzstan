import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RedBookListItems extends StatelessWidget {
  const RedBookListItems({
    super.key,
    required this.image,
    required this.navigate,
    required this.name,
    required this.nameLat,
    required this.heroImage,
    required this.colorNameLat,
    required this.circularColor,
  });

  final String image;
  final Widget navigate;
  final String name;
  final String nameLat;
  final String heroImage;
  final Color colorNameLat;
  final Color circularColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
      child: SizedBox(
        height: 130,
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: CachedNetworkImage(
                imageUrl: image,
                imageBuilder: (context, imageProvider) => Hero(
                  tag: heroImage,
                  child: Container(
                    height: 110,
                    width: 110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: imageProvider,
                      ),
                    ),
                  ),
                ),
                placeholder: (context, url) => Center(
                  child: SizedBox(
                    height: 110,
                    width: 110,
                    child: CircularProgressIndicator(
                      color: circularColor,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.montserratAlternates(
                      fontSize: 18,
                      color: const Color(0xff232828),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    nameLat,
                    style: GoogleFonts.raleway(
                      fontSize: 16,
                      color: colorNameLat,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
