import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nature_of_kyrgyzstan/screens/widgets/list_view_items.dart';
import 'detail_screen_sarychat_ertash.dart';

class SarychatErtash extends StatefulWidget {
  const SarychatErtash({super.key});

  @override
  State<SarychatErtash> createState() => _SarychatErtashState();
}

class _SarychatErtashState extends State<SarychatErtash> {
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
          final data = snapshot.data!.docs[9];
          return ListViewItems(
            image: data['image'],
            name: data['name'],
            navigate: SarychatErtashDetailScreen(documentSnapshot: data),
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
