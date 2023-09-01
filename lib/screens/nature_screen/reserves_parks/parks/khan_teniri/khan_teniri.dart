import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../../../../widgets/list_view_items.dart';
import 'detail_screen_khan_teniri.dart';

class KhanTeniri extends StatefulWidget {
  const KhanTeniri({super.key});

  @override
  State<KhanTeniri> createState() => _AlaArchaState();
}

class _AlaArchaState extends State<KhanTeniri> {
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
        if (snapshot.hasData) {
          final data = snapshot.data!.docs[6];
          return ListViewItems(
            image: data['image'],
            name: data['name'],
            navigate: () => Navigator.push(
              context,
              PageTransition(
                duration: const Duration(seconds: 1),
                reverseDuration: const Duration(seconds: 1),
                type: PageTransitionType.rightToLeft,
                child: KhanTeniriDetailScreen(documentSnapshot: data),
              ),
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
