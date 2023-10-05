import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/reserves_parks/parks/besh_tash/detail_screen_besh_tash.dart';

import '../../../../widgets/list_view_items.dart';

class Karakol extends StatefulWidget {
  const Karakol({super.key});

  @override
  State<Karakol> createState() => _KarakolState();
}

class _KarakolState extends State<Karakol> {
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
        final data = snapshot.data!.docs[5];
        return ListViewItems(
          image: data['image'],
          name: data['name'],
          navigate: BeshTashDetailScreen(documentSnapshot: data),
        );
      },
    );
  }
}
