import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListViewItems extends StatefulWidget {
  const ListViewItems({
    super.key,
    required this.image,
    required this.name,
    required this.navigate,
  });
  final String image;
  final String name;
  final Function() navigate;

  @override
  State<ListViewItems> createState() => _ListViewItemsState();
}

class _ListViewItemsState extends State<ListViewItems>
    with SingleTickerProviderStateMixin {
  // late final AnimationController _controller;
  // late final Animation<double> _animation;

  // @override
  // void initState() {
  //   super.initState();
  //   _controller =
  //       AnimationController(vsync: this, duration: const Duration(seconds: 5));
  //   _animation =
  //       CurvedAnimation(parent: _controller, curve: Curves.linearToEaseOut);
  //   _controller.addListener(() {
  //     setState(() {
  //       print(_controller.status);
  //     });
  //   });
  //   _controller.forward();
  // }

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: widget.image,
      imageBuilder: (context, imageProvider) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: InkWell(
          onTap: widget.navigate,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            height: 170,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              image: DecorationImage(
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.2),
                  BlendMode.darken,
                ),
                fit: BoxFit.cover,
                image: imageProvider,
              ),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  widget.name,
                  style: GoogleFonts.getFont(
                    'Montserrat',
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
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
