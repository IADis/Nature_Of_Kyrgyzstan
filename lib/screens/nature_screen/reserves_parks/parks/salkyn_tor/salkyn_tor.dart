import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../../widgets/list_view_items.dart';
import 'detail_screen.salkyn_tor.dart';

class SalkynTor extends StatefulWidget {
  const SalkynTor({super.key});

  @override
  State<SalkynTor> createState() => _AlaArchaState();
}

class _AlaArchaState extends State<SalkynTor> {
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
        final data = snapshot.data!.docs[12];
        return ListViewItems(
          image: data['image'],
          name: data['name'],
          navigate: SalkynTorDetailScreen(documentSnapshot: data),
        );
      },
    );
  }
}
