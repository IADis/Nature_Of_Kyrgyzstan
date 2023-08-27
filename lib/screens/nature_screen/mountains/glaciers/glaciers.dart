import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nature_of_kyrgyzstan/components/app_colors.dart';
import 'package:nature_of_kyrgyzstan/components/app_text.dart';
import 'package:nature_of_kyrgyzstan/screens/widgets/page_view_images.dart';
import 'package:nature_of_kyrgyzstan/screens/widgets/smooth_page.dart';

import 'data_table_glaciers_widget.dart';

class GlaciersScreen extends StatefulWidget {
  const GlaciersScreen({super.key});

  @override
  State<GlaciersScreen> createState() => _GlaciersScreenState();
}

class _GlaciersScreenState extends State<GlaciersScreen> {
  Stream<QuerySnapshot> glociers =
      FirebaseFirestore.instance.collection('glociers').snapshots();
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.appBarBackgroundColor,
        foregroundColor: AppColors.appBarForegruoundColor,
        elevation: 0,
      ),
      body: StreamBuilder(
        stream: glociers,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('ERROR'),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            final data = snapshot.data!.docs[0];
            return ListView(
              padding: const EdgeInsets.symmetric(vertical: 10),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    data['name'],
                    style: AppText.mainTitleTextStyle,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 400,
                  child: PageView(
                    controller: _controller,
                    children: [
                      PageViewImages(image: data['pageViewImage1']),
                      PageViewImages(image: data['pageViewImage2']),
                      PageViewImages(image: data['pageViewImage3']),
                      PageViewImages(image: data['pageViewImage4']),
                      PageViewImages(image: data['pageViewImage5']),
                      PageViewImages(image: data['pageViewImage6']),
                      PageViewImages(image: data['pageViewImage7']),
                      PageViewImages(image: data['pageViewImage8']),
                      PageViewImages(image: data['pageViewImage9']),
                    ],
                  ),
                ),
                SmoothIndicatorWidget(controller: _controller, count: 9),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    data['bodyText'].toString().replaceAll('\\n', '\n'),
                    style: AppText.bodyTextStyle,
                  ),
                ),
                const SizedBox(height: 20),
                const DataTableGlaciersWidget(),
                const SizedBox(height: 20),
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
