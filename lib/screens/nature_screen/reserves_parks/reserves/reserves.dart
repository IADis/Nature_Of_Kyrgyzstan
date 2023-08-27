import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nature_of_kyrgyzstan/components/app_colors.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/reserves_parks/reserves/detail_reserves_screen.dart';
import 'package:page_transition/page_transition.dart';
import '../../../widgets/app_bar_with_search.dart';
import '../../../widgets/list_view_items.dart';

class ReservesScreen extends StatefulWidget {
  const ReservesScreen({
    super.key,
  });

  @override
  State<ReservesScreen> createState() => _GorgesScreenState();
}

class _GorgesScreenState extends State<ReservesScreen> {
  Stream<QuerySnapshot> reserves = FirebaseFirestore.instance
      .collection('reserves')
      .orderBy('name')
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: AppBarWithSearchWidget(
        text: 'Ущелья',
        onChanged: (value) {
          setState(() {});
        },
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: reserves,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Error');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.separated(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: 15),
            separatorBuilder: (context, index) => const SizedBox(height: 20),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final data = snapshot.data!.docs[index];
              return ListViewItems(
                image: data['image'],
                name: data['name'],
                navigate: () => Navigator.push(
                  context,
                  PageTransition(
                    duration: const Duration(seconds: 1),
                    reverseDuration: const Duration(seconds: 1),
                    type: PageTransitionType.rightToLeft,
                    child: ReservesDetailsScreen(documentSnapshot: data),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
