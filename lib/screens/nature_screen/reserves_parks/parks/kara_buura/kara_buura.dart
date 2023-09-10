import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../../widgets/list_view_items.dart';
import 'detail_screen_kara_buura.dart';

class KaraBuura extends StatefulWidget {
  const KaraBuura({super.key});

  @override
  State<KaraBuura> createState() => _AlaArchaState();
}

class _AlaArchaState extends State<KaraBuura> {
  final Stream<QuerySnapshot> parks =
      FirebaseFirestore.instance.collection('parks').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: parks,
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
          final data = snapshot.data!.docs[3];
          return ListViewItems(
            image: data['image'],
            name: data['name'],
            navigate: KaraBuuraDetailScreen(documentSnapshot: data),
          );
        });
  }
}
