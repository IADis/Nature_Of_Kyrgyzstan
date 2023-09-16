import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nature_of_kyrgyzstan/components/app_colors.dart';
import 'package:nature_of_kyrgyzstan/screens/widgets/app_bar.dart';

import '../widgets/red_book_list_items.dart';

class MushroomsScreen extends StatefulWidget {
  const MushroomsScreen({super.key});

  @override
  State<MushroomsScreen> createState() => _LakesScreenState();
}

class _LakesScreenState extends State<MushroomsScreen> {
  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> lakes = FirebaseFirestore.instance
        .collection('redBookMushrooms')
        .orderBy(
          'name',
        )
        .snapshots();

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: const AppBarWidget(),
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

          if (snapshot.hasData) {
            return ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final data = snapshot.data!.docs[index];
                return RedBookListItems(
                  image: data['image'],
                  name: data['name'],
                  nameLat: data['nameLat'],
                  navigate: data,
                );
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
