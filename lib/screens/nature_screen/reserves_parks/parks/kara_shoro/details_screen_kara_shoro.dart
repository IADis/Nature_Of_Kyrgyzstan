import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../../components/app_text.dart';
import '../../../../widgets/app_bar.dart';

class KaraShoroDetailScreen extends StatelessWidget {
  const KaraShoroDetailScreen({super.key, required this.documentSnapshot});
  final DocumentSnapshot documentSnapshot;

  @override
  Widget build(BuildContext context) {
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
