import 'package:flutter/material.dart';
import 'package:nature_of_kyrgyzstan/components/app_text.dart';

class RedBookStatus extends StatelessWidget {
  const RedBookStatus({
    super.key,
    required this.name,
    required this.textColor,
    required this.color,
    required this.textStatus,
  });

  final String name;
  final Color textColor;
  final Color color;
  final String textStatus;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                top: 10,
                bottom: 25,
              ),
              child: Text(
                textStatus,
                style: AppText.bodyTextStyle,
              ),
            ),
          );
        },
      ),
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        child: Center(
          child: Text(
            name,
            style: TextStyle(
              color: textColor,
              fontSize: 40,
            ),
          ),
        ),
      ),
    );
  }
}
