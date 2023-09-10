import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PageViewImages extends StatefulWidget {
  const PageViewImages({
    super.key,
    required this.image,
  });
  final String image;

  @override
  State<PageViewImages> createState() => _PageViewImagesState();
}

class _PageViewImagesState extends State<PageViewImages> {
  late TransformationController _contoller;
  TapDownDetails? tapDownDetails;
  @override
  void initState() {
    super.initState();
    _contoller = TransformationController();
  }

  @override
  void dispose() {
    _contoller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: widget.image,
      imageBuilder: (context, imageProvider) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
        child: GestureDetector(
          onDoubleTapDown: (details) => tapDownDetails = details,
          onDoubleTap: () {
            final position = tapDownDetails!.localPosition;

            const double scale = 4;
            final x = -position.dx * (scale - 1);
            final y = -position.dy * (scale - 1);
            final zoom = Matrix4.identity()
              ..translate(x, y)
              ..scale(scale);

            final value =
                _contoller.value.isIdentity() ? zoom : Matrix4.identity();
            _contoller.value = value;
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(7),
            child: InteractiveViewer(
              // clipBehavior: Clip.none,
              transformationController: _contoller,
              panEnabled: false,
              scaleEnabled: false,
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
