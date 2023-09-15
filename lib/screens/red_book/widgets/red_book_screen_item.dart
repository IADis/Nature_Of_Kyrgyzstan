import 'package:flutter/material.dart';

class RedBookScreenItem extends StatelessWidget {
  const RedBookScreenItem({
    super.key,
    required this.text,
    required this.navigate,
  });

  final String text;
  final Widget navigate;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => navigate,
        ),
      ),
      child: Container(
        height: 100,
        width: 100,
        color: Colors.amber,
        child: Text(text),
      ),
    );
  }
}
