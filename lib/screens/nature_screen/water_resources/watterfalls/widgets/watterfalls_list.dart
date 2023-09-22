import 'package:flutter/material.dart';
import 'package:nature_of_kyrgyzstan/components/app_colors.dart';
import 'package:nature_of_kyrgyzstan/components/app_text.dart';
import 'package:nature_of_kyrgyzstan/screens/widgets/page_view_images.dart';
import 'package:nature_of_kyrgyzstan/screens/widgets/smooth_page.dart';

class WatterfallsList extends StatelessWidget {
  const WatterfallsList({
    super.key,
    required this.name,
    required this.nameTearsOfTheLeopard,
    required this.bodyTearsOfTheLeopard,
    required this.imageTearsOfTheLeopard,
    required this.nameKegetinsy,
    required this.bodyKegetinsy,
    required this.imageKegetinsy,
    required this.nameShaar,
    required this.bodyShaar,
    required this.imageShaar,
    required this.name33Parrots,
    required this.body33Parrots,
    required this.image33Parrots,
    required this.nameGirlsTears,
    required this.bodyGirlsTears,
    required this.imageGirlsTears,
    required this.nameAbshirAta,
    required this.bodyAbshirAta,
    required this.imageAbshirAta,
    required this.nameArslanBob,
    required this.bodyArslanBob,
    required this.pageViewImage,
    required this.controller,
  });

  final String name;
  final String nameTearsOfTheLeopard;
  final String bodyTearsOfTheLeopard;
  final String imageTearsOfTheLeopard;
  final String nameKegetinsy;
  final String bodyKegetinsy;
  final String imageKegetinsy;
  final String nameShaar;
  final String bodyShaar;
  final String imageShaar;
  final String name33Parrots;
  final String body33Parrots;
  final String image33Parrots;
  final String nameGirlsTears;
  final String bodyGirlsTears;
  final String imageGirlsTears;
  final String nameAbshirAta;
  final String bodyAbshirAta;
  final String imageAbshirAta;
  final String nameArslanBob;
  final String bodyArslanBob;
  final List<Widget> pageViewImage;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 10),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            name,
            style: AppText.mainTitleTextStyle,
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            nameTearsOfTheLeopard,
            style: AppText.titleTextStyle,
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            bodyTearsOfTheLeopard,
            style: AppText.bodyTextStyle,
          ),
        ),
        SizedBox(
          height: 400,
          child: PageView(children: [
            PageViewImages(
              image: imageTearsOfTheLeopard,
            ),
          ]),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            nameKegetinsy,
            style: AppText.titleTextStyle,
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            bodyKegetinsy,
            style: AppText.bodyTextStyle,
          ),
        ),
        SizedBox(
          height: 400,
          child: PageView(children: [
            PageViewImages(
              image: imageKegetinsy,
            ),
          ]),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            nameShaar,
            style: AppText.titleTextStyle,
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            bodyShaar,
            style: AppText.bodyTextStyle,
          ),
        ),
        SizedBox(
          height: 400,
          child: PageView(children: [
            PageViewImages(
              image: imageShaar,
            ),
          ]),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            name33Parrots,
            style: AppText.titleTextStyle,
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            body33Parrots,
            style: AppText.bodyTextStyle,
          ),
        ),
        SizedBox(
          height: 400,
          child: PageView(children: [
            PageViewImages(
              image: image33Parrots,
            ),
          ]),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            nameGirlsTears,
            style: AppText.titleTextStyle,
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            bodyGirlsTears,
            style: AppText.bodyTextStyle,
          ),
        ),
        SizedBox(
          height: 400,
          child: PageView(children: [
            PageViewImages(
              image: imageGirlsTears,
            ),
          ]),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            nameAbshirAta,
            style: AppText.titleTextStyle,
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            bodyAbshirAta,
            style: AppText.bodyTextStyle,
          ),
        ),
        SizedBox(
          height: 400,
          child: PageView(children: [
            PageViewImages(
              image: imageAbshirAta,
            ),
          ]),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            nameArslanBob,
            style: AppText.titleTextStyle,
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            bodyArslanBob,
            style: AppText.bodyTextStyle,
          ),
        ),
        SizedBox(
          height: 400,
          child: PageView(
            controller: controller,
            children: pageViewImage,
          ),
        ),
        SmoothIndicatorWidget(
          controller: controller,
          count: 2,
          color: AppColors.plantsColors,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
