import 'package:flutter/material.dart';
import '../../widgets/smooth_page.dart';

class SliverAppBarLarge extends StatelessWidget {
  const SliverAppBarLarge({
    super.key,
    required this.count,
    required this.name,
    required this.controller,
    required this.images,
  });

  final String name;
  final PageController controller;
  final List<Widget> images;
  final int count;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar.large(
      stretch: true,
      title: Text(name),
      pinned: true,
      foregroundColor: const Color(0xffF1962C),
      backgroundColor: const Color(0xffFFFFFF),
      elevation: 0,
      expandedHeight: 450,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: Stack(
          children: [
            PageView(
              controller: controller,
              children: images,
            ),
            Positioned(
              top: 450,
              right: 140,
              child: SmoothIndicatorWidget(
                controller: controller,
                count: count,
              ),
            ),
          ],
        ),
      ),
      // bottom: PreferredSize(
      //   preferredSize: const Size.fromHeight(0.0),
      //   child: Container(
      //     height: 22,
      //     decoration: const BoxDecoration(
      //       color: Colors.white,
      //       borderRadius: BorderRadius.only(
      //         topLeft: Radius.circular(20),
      //         topRight: Radius.circular(20),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
