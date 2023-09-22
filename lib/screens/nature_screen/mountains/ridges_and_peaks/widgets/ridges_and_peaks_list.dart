import 'package:flutter/material.dart';
import 'package:nature_of_kyrgyzstan/components/app_text.dart';
import 'package:nature_of_kyrgyzstan/screens/widgets/smooth_page.dart';

import '../../../../../components/app_colors.dart';
import 'data_table_ridges_and_peaks.widget.dart';

class RidgesAndPeaksList extends StatelessWidget {
  const RidgesAndPeaksList({
    super.key,
    required this.name,
    required this.bodyText,
    required this.nameTienShan,
    required this.bodyTienShan,
    required this.nameAlaToo,
    required this.bodyAlaToo,
    required this.namePamir,
    required this.bodyPamir,
    required this.nameMinorPeaks,
    required this.bodyMinorPeaks,
    required this.controller,
    required this.pageViewImage,
  });

  final String name;
  final String bodyText;
  final String nameTienShan;
  final String bodyTienShan;
  final String nameAlaToo;
  final String bodyAlaToo;
  final String namePamir;
  final String bodyPamir;
  final String nameMinorPeaks;
  final String bodyMinorPeaks;
  final PageController controller;
  final List<Widget> pageViewImage;

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
        SizedBox(
          height: 400,
          child: PageView(controller: controller, children: pageViewImage),
        ),
        SmoothIndicatorWidget(
          controller: controller,
          count: 15,
          color: AppColors.plantsColors,
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            bodyText.toString().replaceAll('\\n', '\n'),
            style: AppText.bodyTextStyle,
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            nameTienShan,
            style: AppText.titleTextStyle,
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            bodyTienShan.toString().replaceAll('\\n', '\n'),
            style: AppText.bodyTextStyle,
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            nameAlaToo,
            style: AppText.titleTextStyle,
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            bodyAlaToo.toString().replaceAll('\\n', '\n'),
            style: AppText.bodyTextStyle,
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            namePamir,
            style: AppText.titleTextStyle,
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            bodyPamir.toString().replaceAll('\\n', '\n'),
            style: AppText.bodyTextStyle,
          ),
        ),
        const SizedBox(height: 20),
        const DataTableRidgesAndPeaksWidget(),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            nameMinorPeaks,
            style: AppText.titleTextStyle,
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            bodyMinorPeaks.toString().replaceAll('\\n', '\n'),
            style: AppText.bodyTextStyle,
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
