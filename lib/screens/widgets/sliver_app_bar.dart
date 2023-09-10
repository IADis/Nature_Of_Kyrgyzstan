
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nature_of_kyrgyzstan/components/app_colors.dart';
import 'package:nature_of_kyrgyzstan/components/app_text.dart';

class SliverAppBarWidget extends StatelessWidget {
  const SliverAppBarWidget(
      {super.key,
      required this.name,
      required this.image,
      required this.sliverHeight,
      required this.containerHeight});

  final String name;
  final String image;
  final double sliverHeight;
  final double containerHeight;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      foregroundColor: Colors.orange,
      backgroundColor: AppColors.scaffoldBackgroundColor,
      elevation: 0,
      pinned: true,
      stretch: true,
      expandedHeight: 300,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const [
          StretchMode.zoomBackground,
          StretchMode.blurBackground
        ],
        background: CachedNetworkImage(
          imageUrl: image,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(fit: BoxFit.cover, image: imageProvider),
            ),
          ),
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(
              color: Colors.green,
            ),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(sliverHeight),
        child: Container(
          height: containerHeight,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.scaffoldBackgroundColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Text(
            textAlign: TextAlign.center,
            name,
            style: AppText.titleTextStyle,
          ),
        ),
      ),
    );
  }
}
