import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DashmanDetailScreen extends StatefulWidget {
  const DashmanDetailScreen({super.key, required this.documentSnapshot});
  final DocumentSnapshot documentSnapshot;

  @override
  State<DashmanDetailScreen> createState() => _SurmaTashDetailScreenState();
}

class _SurmaTashDetailScreenState extends State<DashmanDetailScreen> {
  @override
  Widget build(BuildContext context) {
    // final dynamic data = widget.documentSnapshot;
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
