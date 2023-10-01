import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nature_of_kyrgyzstan/components/app_colors.dart';
import 'package:nature_of_kyrgyzstan/screens/widgets/app_bar.dart';
import 'package:nature_of_kyrgyzstan/screens/widgets/list_view_items.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/water_resources/lakes/detail_lakes_screen.dart';

class LakesScreen extends StatefulWidget {
  const LakesScreen({super.key});

  @override
  State<LakesScreen> createState() => _LakesScreenState();
}

class _LakesScreenState extends State<LakesScreen> {
  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> lakes = FirebaseFirestore.instance
        .collection('lakes')
        .orderBy(
          'name',
        )
        .snapshots();

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: const AppBarWidget(
        name: 'Озёра',
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: lakes,
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
                navigate: LakesDetailScreen(documentSnapshot: data),
              );
            },
          );
        },
      ),
    );
  }
}
