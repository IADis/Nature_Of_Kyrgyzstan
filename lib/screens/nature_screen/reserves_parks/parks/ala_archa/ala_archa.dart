import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nature_of_kyrgyzstan/screens/widgets/list_view_items.dart';
import 'package:page_transition/page_transition.dart';

import 'detail_screen_ala_archa.dart';

class AlaArcha extends StatefulWidget {
  const AlaArcha({super.key});

  @override
  State<AlaArcha> createState() => _AlaArchaState();
}

class _AlaArchaState extends State<AlaArcha> {
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
          final data = snapshot.data!.docs[7];
          return ListViewItems(
            image: data['image'],
            name: data['name'],
            navigate: () => Navigator.push(
              context,
              PageTransition(
                duration: const Duration(seconds: 1),
                reverseDuration: const Duration(seconds: 1),
                type: PageTransitionType.rightToLeft,
                child: AlaArchaDetailScreen(documentSnapshot: data),
              ),
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
