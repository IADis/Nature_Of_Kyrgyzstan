import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class KaraBuuraDetailScreen extends StatelessWidget {
  const KaraBuuraDetailScreen({super.key, required this.documentSnapshot});
  final DocumentSnapshot documentSnapshot;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
