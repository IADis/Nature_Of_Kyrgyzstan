import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/water_resources/rivers/widgets/rivers_list.dart';
import 'package:nature_of_kyrgyzstan/screens/widgets/app_bar.dart';
import 'package:nature_of_kyrgyzstan/screens/widgets/page_view_images.dart';

class RiversScreen extends StatefulWidget {
  const RiversScreen({super.key});

  @override
  State<RiversScreen> createState() => _RiversScreenState();
}

class _RiversScreenState extends State<RiversScreen> {
  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> rivers =
        FirebaseFirestore.instance.collection('rivers').snapshots();

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: const AppBarWidget(),
      body: StreamBuilder(
        stream: rivers,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('ERROR'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            final data = snapshot.data!.docs[0];
            return RiversList(
              name: data['name'],
              bodyText: data['bodyText'],
              pageViewImages: [
                PageViewImages(image: data['pageViewImage1']),
                PageViewImages(image: data['pageViewImage2']),
                PageViewImages(image: data['pageViewImage3']),
                PageViewImages(image: data['pageViewImage4']),
                PageViewImages(image: data['pageViewImage5']),
                PageViewImages(image: data['pageViewImage6']),
                PageViewImages(image: data['pageViewImage7']),
                PageViewImages(image: data['pageViewImage8']),
                PageViewImages(image: data['pageViewImage9']),
                PageViewImages(image: data['pageViewImage10']),
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
