import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nature_of_kyrgyzstan/components/app_colors.dart';
import 'package:nature_of_kyrgyzstan/screens/red_book/widgets/red_book_grid_items.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/red_book_app_bar.dart';
import '../widgets/red_book_list_items.dart';
import 'birds_details_screen.dart';

class BirdsScreen extends StatefulWidget {
  const BirdsScreen({super.key});

  @override
  State<BirdsScreen> createState() => _LakesScreenState();
}

class _LakesScreenState extends State<BirdsScreen> {
  bool _switchList = true;

  late final SharedPreferences prefs;

  void saveBool() async {
    setState(() {
      _switchList = !_switchList;
    });
    await prefs.setBool('save', _switchList);
  }

  @override
  void initState() {
    initializePreference();
    super.initState();
  }

  void initializePreference() async {
    prefs = await SharedPreferences.getInstance();
    _switchList = prefs.getBool('save') ?? false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> birds = FirebaseFirestore.instance
        .collection('redBookBirds')
        .orderBy(
          'name',
        )
        .snapshots();

    return Scaffold(
      appBar: RedBookAppBar(
        foregroundColor: AppColors.birdsColors,
        title: 'Птицы',
        savebool: saveBool,
        switchList: _switchList,
      ),
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: StreamBuilder<QuerySnapshot>(
        stream: birds,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Error');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.birdsColors,
              ),
            );
          }

          return _switchList
              ? ListView.separated(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  itemCount: snapshot.data!.docs.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 20),
                  itemBuilder: (context, index) {
                    final data = snapshot.data!.docs[index];
                    return RedBookListItems(
                      image: data['image'],
                      navigate: BirdsDetailScreen(documentSnapshot: data),
                      name: data['name'],
                      nameLat: data['nameLat'],
                      colorNameLat: AppColors.birdsColors,
                      heroImage: data['image'],
                      circularColor: AppColors.birdsColors,
                    );
                  },
                )
              : GridView.builder(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  itemCount: snapshot.data!.docs.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 20,
                    mainAxisExtent: 270,
                  ),
                  itemBuilder: (context, index) {
                    final data = snapshot.data!.docs[index];
                    return RedBookGridItems(
                      image: data['image'],
                      navigate: BirdsDetailScreen(documentSnapshot: data),
                      name: data['name'],
                      nameLat: data['nameLat'],
                      colorNameLat: AppColors.birdsColors,
                      heroGridImage: data['image'],
                      circularColor: AppColors.birdsColors,
                    );
                  },
                );
        },
      ),
    );
  }
}
