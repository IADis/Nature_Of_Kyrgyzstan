import 'package:flutter/material.dart';
import 'package:nature_of_kyrgyzstan/screens/red_book/red_book_info/red_book_info.dart';

class RedBookScreen extends StatelessWidget {
  const RedBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RedBoodInfo(),
              ),
            ),
            child: Container(
              height: 100,
              width: 100,
              color: Colors.amber,
            ),
          ),
        ],
      ),
    );
  }
}
