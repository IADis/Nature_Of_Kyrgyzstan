import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nature_of_kyrgyzstan/components/app_colors.dart';
import 'package:nature_of_kyrgyzstan/screens/widgets/app_bar.dart';

import '../widgets/red_book_list_items.dart';

class PlantsScreen extends StatefulWidget {
  const PlantsScreen({super.key});

  @override
  State<PlantsScreen> createState() => _LakesScreenState();
}

class _LakesScreenState extends State<PlantsScreen> {
  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> plants = FirebaseFirestore.instance
        .collection('redBookPlants')
        .orderBy(
          'name',
        )
        .snapshots();

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: const AppBarWidget(
        name: 'Высшие Растения',
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: plants,
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
                  hero: data['image'],
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
