import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nature_of_kyrgyzstan/screens/widgets/list_view_items.dart';
import 'detail_screen_besh_aral.dart';

class BeshAral extends StatefulWidget {
  const BeshAral({super.key});

  @override
  State<BeshAral> createState() => _AlaArchaState();
}

class _AlaArchaState extends State<BeshAral> {
  final Stream<QuerySnapshot> reserves =
      FirebaseFirestore.instance.collection('reserves').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: reserves,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text('ERROR'),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasData) {
          final data = snapshot.data!.docs[2];
          return ListViewItems(
            image: data['image'],
            name: data['name'],
            navigate: BeshAralDetailScreen(documentSnapshot: data),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
