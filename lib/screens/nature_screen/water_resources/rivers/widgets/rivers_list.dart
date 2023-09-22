import 'package:flutter/material.dart';
import 'package:nature_of_kyrgyzstan/components/app_colors.dart';
import 'package:nature_of_kyrgyzstan/components/app_text.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/water_resources/rivers/widgets/data_table_rivers_widget.dart';
import 'package:nature_of_kyrgyzstan/screens/widgets/smooth_page.dart';

class RiversList extends StatefulWidget {
  const RiversList({
    super.key,
    required this.name,
    required this.bodyText,
    required this.pageViewImages,
  });
  final String name;
  final String bodyText;

  final List<Widget> pageViewImages;

  @override
  State<RiversList> createState() => _RiversListState();
}

class _RiversListState extends State<RiversList> {
  final _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 10),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            widget.name,
            textAlign: TextAlign.start,
            style: AppText.mainTitleTextStyle,
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 400,
          child: PageView(
            controller: _controller,
            children: widget.pageViewImages,
          ),
        ),
        SmoothIndicatorWidget(
          controller: _controller,
          count: 10,
          color: AppColors.plantsColors,
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            widget.bodyText.toString().replaceAll('\\n', '\n'),
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
