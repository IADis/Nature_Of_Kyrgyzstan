import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../../components/app_text.dart';
import '../../../../widgets/app_bar.dart';

class SurmaTashDetailScreen extends StatefulWidget {
  const SurmaTashDetailScreen({super.key, required this.documentSnapshot});
  final DocumentSnapshot documentSnapshot;

  @override
  State<SurmaTashDetailScreen> createState() => _SurmaTashDetailScreenState();
}

class _SurmaTashDetailScreenState extends State<SurmaTashDetailScreen> {
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
