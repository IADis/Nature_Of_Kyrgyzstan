import 'package:flutter/material.dart';
import 'package:nature_of_kyrgyzstan/components/app_text.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/water_resources/reservoir/widgets/data_table_reservoirs_widget.dart';
import 'package:nature_of_kyrgyzstan/screens/widgets/smooth_page.dart';

import '../../../../../components/app_colors.dart';

class ReservoirsList extends StatelessWidget {
  const ReservoirsList({
    super.key,
    required this.name,
    required this.bodyText,
    required this.controller,
    required this.pageViewImage,
  });
  final String name;
  final String bodyText;
  final PageController controller;
  final List<Widget> pageViewImage;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
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
          child: PageView(
            controller: controller,
            children: pageViewImage,
          ),
        ),
        SmoothIndicatorWidget(
          controller: controller,
          count: 9,
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
        const DataTableReservoirsWidget(),
        const SizedBox(height: 20),
      ],
    );
  }
}
