import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nature_of_kyrgyzstan/components/app_colors.dart';
import 'package:nature_of_kyrgyzstan/components/app_text.dart';
import 'package:nature_of_kyrgyzstan/screens/red_book/mushrooms/mushrooms_detail_screen.dart';
import 'package:nature_of_kyrgyzstan/screens/widgets/app_bar.dart';

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
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          MushroomsDetailScreen(documentSnapshot: data),
                    ),
                  ),
                  child: SizedBox(
                    height: 130,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                            height: 110,
                            width: 110,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                  data['image'],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data['name'].toString(),
                                style: GoogleFonts.montserratAlternates(
                                  fontSize: 18,
                                  color: const Color(0xff232828),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                data['nameLat'].toString(),
                                style: GoogleFonts.raleway(
                                  fontSize: 16,
                                  color: const Color(0xff658282),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Divider(
                                height: 5,
                                color: Color(0xff658282),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
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
