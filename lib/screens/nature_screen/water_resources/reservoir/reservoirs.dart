import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nature_of_kyrgyzstan/components/app_colors.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/water_resources/reservoir/widgets/reservoirs_list.dart';
import 'package:nature_of_kyrgyzstan/screens/widgets/page_view_images.dart';

import '../../../widgets/app_bar.dart';

class ReservoirsScreen extends StatefulWidget {
  const ReservoirsScreen({super.key});

  @override
  State<ReservoirsScreen> createState() => _ReservoirsScreenState();
}

class _ReservoirsScreenState extends State<ReservoirsScreen> {
  PageController _controller = PageController();

  @override
  void initState() {
    super.initState();
    _controller = PageController(viewportFraction: 1);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> reservoirs =
        FirebaseFirestore.instance.collection('reservoirs').snapshots();
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: const AppBarWidget(
        name: '',
        elevation: 0,
      ),
      body: StreamBuilder(
        stream: reservoirs,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('ERROR'),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.amber,
              ),
            );
          }
          if (snapshot.hasData) {
            final data = snapshot.data!.docs[0];
            return ReservoirsList(
              name: data['name'],
              bodyText: data['bodyText'],
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
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
