import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nature_of_kyrgyzstan/components/app_colors.dart';
import 'package:page_transition/page_transition.dart';
import '../../../widgets/app_bar_with_search.dart';
import '../../../widgets/list_view_items.dart';
import 'datail_gorges_screen.dart';

class GorgesScreen extends StatefulWidget {
  const GorgesScreen({
    super.key,
  });

  @override
  State<GorgesScreen> createState() => _GorgesScreenState();
}

class _GorgesScreenState extends State<GorgesScreen>
    with SingleTickerProviderStateMixin {
  Stream<QuerySnapshot> gorges = FirebaseFirestore.instance
      .collection('gorges')
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
        stream: gorges,
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
                    duration: const Duration(milliseconds: 600),
                    reverseDuration: const Duration(milliseconds: 600),
                    type: PageTransitionType.rightToLeft,
                    child: GorgesDetailsScreen(documentSnapshot: data),
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
