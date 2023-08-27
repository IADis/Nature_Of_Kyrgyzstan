import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SmoothIndicatorWidget extends StatelessWidget {
  const SmoothIndicatorWidget({
    super.key,
    required this.controller,
    required this.count,
  });

  final PageController controller;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SmoothPageIndicator(
        controller: controller,
        count: count,
        effect: const SwapEffect(
          dotColor: Colors.orange,
          type: SwapType.yRotation,
          activeDotColor: Colors.green,
        ),
      ),
    );
  }
}
