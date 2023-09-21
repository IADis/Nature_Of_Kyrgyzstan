import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nature_of_kyrgyzstan/components/app_colors.dart';
import 'package:nature_of_kyrgyzstan/components/app_text.dart';
import 'package:nature_of_kyrgyzstan/screens/red_book/widgets/red_book_grid_items.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/red_book_list_items.dart';

class PlantsScreen extends StatefulWidget {
  const PlantsScreen({super.key});

  @override
  State<PlantsScreen> createState() => _LakesScreenState();
}

class _LakesScreenState extends State<PlantsScreen> {
  bool switchList = true;

  late final SharedPreferences prefs;

  void saveBool() async {
    setState(() {
      switchList = !switchList;
    });
    await prefs.setBool('save', switchList);
  }

  @override
  void initState() {
    initializePreference();
    super.initState();
  }

  void initializePreference() async {
    prefs = await SharedPreferences.getInstance();
    switchList = prefs.getBool('save') ?? false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> plants = FirebaseFirestore.instance
        .collection('redBookPlants')
        .orderBy(
          'name',
        )
        .snapshots();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        foregroundColor: AppColors.appBarForegruoundColor,
        title: Text(
          'Высшие Растения',
          style: AppText.redBookTitleText,
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                saveBool();
              },
              icon: switchList
                  ? const Icon(Icons.grid_view_rounded)
                  : const Icon(Icons.view_list_sharp)),
        ],
      ),
      backgroundColor: AppColors.scaffoldBackgroundColor,
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
            return CustomScrollView(
              slivers: [
                switchList
                    ? SliverPadding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        sliver: SliverList.separated(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            final data = snapshot.data!.docs[index];
                            return RedBookListItems(
                              image: data['image'],
                              navigate: data,
                              name: data['name'],
                              nameLat: data['nameLat'],
                              heroImage: data['image'],
                            );
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 20),
                        ),
                      )
                    : SliverPadding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        sliver: SliverGrid(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 20,
                            mainAxisExtent: 270,
                          ),
                          delegate: SliverChildBuilderDelegate(
                            childCount: snapshot.data!.docs.length,
                            (context, index) {
                              final gridData = snapshot.data!.docs[index];
                              return RedBookGridItems(
                                image: gridData['image'],
                                navigate: gridData,
                                name: gridData['name'],
                                nameLat: gridData['nameLat'],
                                heroGridImage: gridData['image'],
                              );
                            },
                          ),
                        ),
                      ),
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
