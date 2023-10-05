import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/list_view_items.dart';
import 'detail_screen_sarkent.dart';

class Sarkent extends StatefulWidget {
  const Sarkent({super.key});

  @override
  State<Sarkent> createState() => _SarkentState();
}

class _SarkentState extends State<Sarkent> {
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
              child: CircularProgressIndicator(
                color: Colors.amber,
              ),
            );
          }
          final data = snapshot.data!.docs[9];
          return ListViewItems(
            image: data['image'],
            name: data['name'],
            navigate: DetailScreenSarkent(documentSnapshot: data),
          );
        });
  }
}
