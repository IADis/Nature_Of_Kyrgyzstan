import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class KaraShoroDetailScreen extends StatelessWidget {
  const KaraShoroDetailScreen({super.key, required this.documentSnapshot});
  final DocumentSnapshot documentSnapshot;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
