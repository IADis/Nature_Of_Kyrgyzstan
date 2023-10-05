import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nature_of_kyrgyzstan/components/app_text.dart';
import 'package:nature_of_kyrgyzstan/screens/widgets/app_bar.dart';

class DashmanDetailScreen extends StatefulWidget {
  const DashmanDetailScreen({super.key, required this.documentSnapshot});
  final DocumentSnapshot documentSnapshot;

  @override
  State<DashmanDetailScreen> createState() => _DashmanDetailScreenState();
}

class _DashmanDetailScreenState extends State<DashmanDetailScreen> {
  @override
  Widget build(BuildContext context) {
    // final dynamic data = widget.documentSnapshot;
    return Scaffold(
      appBar: const AppBarWidget(
        elevation: 4,
      ),
      body: Center(
          child: Text(
        'Нет Данных.',
        style: AppText.mainTitleTextStyle,
      )),
    );
  }
}
