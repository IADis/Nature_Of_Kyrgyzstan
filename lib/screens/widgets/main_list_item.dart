import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        MaterialPageRoute(
          builder: (context) => modelNavigate,
        ),
      ),
      child: CachedNetworkImage(
        imageUrl: modelImage,
        imageBuilder: (context, imageProvider) => Padding(
          padding: const EdgeInsets.only(
            top: 20,
            bottom: 20,
            right: 10,
            left: 10,
          ),
          child: Container(
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
                          sigmaX: 5,
                          sigmaY: 5,
                        ),
                        child: Container(
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(
                              // border: Border.all(width: 0.5, color: Colors.white),
                              color: Colors.white.withOpacity(0.2),
                              shape: BoxShape.circle),
                          child: const Center(
                            child: Text(
                              '20',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 34,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 5,
                          sigmaY: 5,
                        ),
                        child: Container(
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(
                              // border: Border.all(width: 0.5, color: Colors.white),
                              color: Colors.white.withOpacity(0.2),
                              shape: BoxShape.circle),
                          child: const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 34,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 3,
                      sigmaY: 3,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Colors.white.withOpacity(0.2),
                      ),
                      child: Text(
                        modelName,
                        style: GoogleFonts.getFont('Montserrat',
                            color: Colors.white, fontSize: 32),
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
