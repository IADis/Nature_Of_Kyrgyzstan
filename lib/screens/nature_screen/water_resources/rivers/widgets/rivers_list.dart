import 'package:flutter/material.dart';
import 'package:nature_of_kyrgyzstan/components/app_text.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/water_resources/rivers/widgets/data_table_rivers_widget.dart';
import 'package:nature_of_kyrgyzstan/screens/widgets/smooth_page.dart';

class RiversList extends StatelessWidget {
  const RiversList({
    super.key,
    required this.name,
    required this.bodyText,
    required this.controller,
    required this.pageViewImages,
  });
  final String name;
  final String bodyText;
  final PageController controller;
  final List<Widget> pageViewImages;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 10),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            name,
            textAlign: TextAlign.start,
            style: AppText.mainTitleTextStyle,
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 400,
          child: PageView(
            controller: controller,
            children: pageViewImages,
          ),
        ),
        SmoothIndicatorWidget(controller: controller, count: 10),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            bodyText.toString().replaceAll('\\n', '\n'),
            style: AppText.bodyTextStyle,
          ),
        ),
        const SizedBox(height: 20),
        const DataTableRiversWidget(),
        const SizedBox(height: 20),
      ],
    );
  }
}
