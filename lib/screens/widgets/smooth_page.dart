import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SmoothIndicatorWidget extends StatelessWidget {
  const SmoothIndicatorWidget({
    super.key,
    required this.controller,
    required this.count,
    required this.color,
  });

  final PageController controller;
  final int count;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SmoothPageIndicator(
        controller: controller,
        count: count,
        effect: JumpingDotEffect(
          dotHeight: 13,
          dotWidth: 13,
          dotColor: const Color(0xffC7C7CC),
          activeDotColor: color,
        ),
      ),
    );
  }
}
