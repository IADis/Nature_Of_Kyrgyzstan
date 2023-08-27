import 'package:flutter/material.dart';
import 'package:nature_of_kyrgyzstan/components/app_text.dart';

class BodyTextWidget extends StatelessWidget {
  const BodyTextWidget({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        textAlign: TextAlign.start,
        text,
        style: AppText.bodyTextStyle,
      ),
    );
  }
}
