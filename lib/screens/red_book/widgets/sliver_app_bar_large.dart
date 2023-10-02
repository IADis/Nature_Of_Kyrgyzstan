import 'package:flutter/material.dart';
import '../../widgets/smooth_page.dart';

class SliverAppBarLarge extends StatelessWidget {
  const SliverAppBarLarge({
    super.key,
    required this.count,
    required this.name,
    required this.controller,
    required this.images,
    required this.color,
    required this.foregroundColor,
  });

  final String name;
  final PageController controller;
  final List<Widget> images;
  final int count;
  final Color color;
  final Color foregroundColor;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar.large(
      // bottom: PreferredSize(
      //   preferredSize: Size.fromHeight(40),
      //   child: Container(
      //     height: 40,
      //     decoration: BoxDecoration(
      //       color: Colors.white,
      //       borderRadius: BorderRadius.only(
      //         topLeft: Radius.circular(20),
      //         topRight: Radius.circular(20),
      //       ),
      //     ),
      //   ),
      // ),
      stretch: true,

      title: Text(name),
      pinned: true,
      leading: IconButton(
        iconSize: 34,
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back,
        ),
      ),
      foregroundColor: foregroundColor,
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
            Positioned.fill(
              top: 450,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SmoothIndicatorWidget(
                  controller: controller,
                  count: count,
                  color: color,
                ),
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
