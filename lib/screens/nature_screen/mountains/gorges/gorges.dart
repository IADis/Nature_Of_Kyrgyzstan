import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nature_of_kyrgyzstan/components/app_colors.dart';
import 'package:nature_of_kyrgyzstan/screens/widgets/app_bar.dart';
import '../../../widgets/list_view_items.dart';
import 'datail_gorges_screen.dart';

class GorgesScreen extends StatefulWidget {
  const GorgesScreen({
    super.key,
  });

  @override
  State<GorgesScreen> createState() => _GorgesScreenState();
}

class _GorgesScreenState extends State<GorgesScreen> {
  Stream<QuerySnapshot> gorges = FirebaseFirestore.instance
      .collection('gorges')
      .orderBy('name')
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: const AppBarWidget(
        name: 'Ущелья',
        elevation: 4,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: gorges,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Error');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.orange,
              ),
            );
          }
          if (snapshot.hasData) {
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
                  navigate: GorgesDetailsScreen(documentSnapshot: data),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.orange,
            ),
          );
        },
      ),
    );
  }
}
