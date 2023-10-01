import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nature_of_kyrgyzstan/components/app_colors.dart';
import 'package:nature_of_kyrgyzstan/screens/red_book/reptiles/reptiles_detail_screen.dart';
import 'package:nature_of_kyrgyzstan/screens/red_book/widgets/red_book_grid_items.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/red_book_app_bar.dart';
import '../widgets/red_book_list_items.dart';

class ReptilesScreen extends StatefulWidget {
  const ReptilesScreen({super.key});

  @override
  State<ReptilesScreen> createState() => _LakesScreenState();
}

class _LakesScreenState extends State<ReptilesScreen> {
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
    Stream<QuerySnapshot> reptiles = FirebaseFirestore.instance
        .collection('redBookReptiles')
        .orderBy(
          'name',
        )
        .snapshots();

    return Scaffold(
      appBar: RedBookAppBar(
        foregroundColor: AppColors.reptilesColors,
        title: 'Амфибии и Рептилии',
        savebool: saveBool,
        switchList: _switchList,
      ),
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: StreamBuilder<QuerySnapshot>(
        stream: reptiles,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Error');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
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
                      navigate: ReptilesDetailScreen(documentSnapshot: data),
                      name: data['name'],
                      nameLat: data['nameLat'],
                      colorNameLat: AppColors.reptilesColors,
                      heroImage: data['image'],
                      circularColor: AppColors.reptilesColors,
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
                      navigate: ReptilesDetailScreen(documentSnapshot: data),
                      name: data['name'],
                      nameLat: data['nameLat'],
                      colorNameLat: AppColors.reptilesColors,
                      heroGridImage: data['image'],
                      circularColor: AppColors.reptilesColors,
                    );
                  },
                );
        },
      ),
    );
  }
}
