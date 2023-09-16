import 'package:flutter/material.dart';
import 'package:nature_of_kyrgyzstan/components/app_colors.dart';
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
        effect: const JumpingDotEffect(
          dotHeight: 13,
          dotWidth: 13,
          dotColor: Color(0xffC7C7CC),
          activeDotColor: AppColors.activeColors,
        ),
      ),
    );
  }
}
