import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nature_of_kyrgyzstan/components/app_colors.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/mountains/ridges_and_peaks/widgets/ridges_and_peaks_list.dart';
import 'package:nature_of_kyrgyzstan/screens/widgets/page_view_images.dart';

import '../../../widgets/app_bar.dart';

class RidgesAndPeaksScreen extends StatefulWidget {
  const RidgesAndPeaksScreen({super.key});

  @override
  State<RidgesAndPeaksScreen> createState() => _RidgesAndPeaksScreenState();
}

class _RidgesAndPeaksScreenState extends State<RidgesAndPeaksScreen> {
  final _controller = PageController();
  Stream<QuerySnapshot> ridgesAndPeaks =
      FirebaseFirestore.instance.collection('ridgesAndPeaks').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: const AppBarWidget(
        name: '',
        elevation: 0,
      ),
      body: StreamBuilder(
        stream: ridgesAndPeaks,
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
            return RidgesAndPeaksList(
                name: data['name'],
                bodyText: data['bodyText'],
                nameTienShan: data['nameTienShan'],
                bodyTienShan: data['bodyTienShan'],
                nameAlaToo: data['nameAlaToo'],
                bodyAlaToo: data['bodyAlaToo'],
                namePamir: data['namePamir'],
                bodyPamir: data['bodyPamir'],
                nameMinorPeaks: data['nameMinorPeaks'],
                bodyMinorPeaks: data['bodyMinorPeaks'],
                controller: _controller,
                pageViewImage: [
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
                  PageViewImages(image: data['pageViewImage11']),
                  PageViewImages(image: data['pageViewImage12']),
                  PageViewImages(image: data['pageViewImage13']),
                  PageViewImages(image: data['pageViewImage14']),
                  PageViewImages(image: data['pageViewImage15']),
                ]);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
