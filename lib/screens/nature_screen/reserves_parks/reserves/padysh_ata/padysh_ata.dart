import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nature_of_kyrgyzstan/screens/widgets/list_view_items.dart';
import 'detail_screen_padysh_ata.dart';

class PadyshAta extends StatefulWidget {
  const PadyshAta({super.key});

  @override
  State<PadyshAta> createState() => _PadyshAtaState();
}

class _PadyshAtaState extends State<PadyshAta> {
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
          final data = snapshot.data!.docs[5];
          return ListViewItems(
            image: data['image'],
            name: data['name'],
            navigate: PadyshAtaDetailScreen(documentSnapshot: data),
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
