import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class RedBookPageViewImages extends StatelessWidget {
  const RedBookPageViewImages({
    this.data,
    super.key,
    required this.image,
    required this.pageViewCircularColor,
  });

  final String image;
  final String? data;
  final Color pageViewCircularColor;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      imageBuilder: (context, imageProvider) => Hero(
        tag: data ?? '',
        transitionOnUserGestures: true,
        flightShuttleBuilder: (flightContext, animation, flightDirection,
            fromHeroContext, toHeroContext) {
          switch (flightDirection) {
            case HeroFlightDirection.push:
              return ScaleTransition(
                scale: animation.drive(
                  Tween<double>(begin: 0.0, end: 1.0).chain(
                    CurveTween(
                      curve: Curves.easeInToLinear,
                    ),
                  ),
                ),
                child: toHeroContext.widget,
              );
            case HeroFlightDirection.pop:
              return toHeroContext.widget;
          }
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.2),
                BlendMode.darken,
              ),
              fit: BoxFit.cover,
              image: imageProvider,
            ),
          ),
        ),
      ),
      placeholder: (context, url) => Center(
        child: CircularProgressIndicator(
          color: pageViewCircularColor,
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
