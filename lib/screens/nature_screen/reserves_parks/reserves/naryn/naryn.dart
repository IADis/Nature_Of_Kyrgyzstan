import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nature_of_kyrgyzstan/screens/widgets/list_view_items.dart';
import 'detail_screen_naryn.dart';

class Naryn extends StatefulWidget {
  const Naryn({super.key});

  @override
  State<Naryn> createState() => _NarynState();
}

class _NarynState extends State<Naryn> {
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
            child: CircularProgressIndicator(
              color: Colors.amber,
            ),
          );
        }
        if (snapshot.hasData) {
          final data = snapshot.data!.docs[7];
          return ListViewItems(
            image: data['image'],
            name: data['name'],
            navigate: NarynDetailScreen(documentSnapshot: data),
          );
        }
        return const Center(
            child: CircularProgressIndicator(
          color: Colors.amber,
        ));
      },
    );
  }
}
