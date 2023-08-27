import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PageViewImages extends StatelessWidget {
  const PageViewImages({
    super.key,
    required this.image,
  });
  final String image;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      imageBuilder: (context, imageProvider) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 4,
                blurRadius: 10,
                offset: const Offset(8, 8), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(7),
            image: DecorationImage(
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.2),
                  BlendMode.darken,
                ),
                //Parallax
                // alignment: Alignment(-offSet.abs() + index, 0),
                fit: BoxFit.cover,
                image: imageProvider),
          ),
        ),
      ),
      placeholder: (context, url) => const Center(
        child: CircularProgressIndicator(
          color: Colors.orange,
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
