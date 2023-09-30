import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nature_of_kyrgyzstan/components/app_colors.dart';
import '../widgets/red_book_page_view.dart';
import '../widgets/sliver_app_bar_large.dart';
import '../widgets/sliver_list.dart';

class MushroomsDetailScreen extends StatefulWidget {
  const MushroomsDetailScreen({
    super.key,
    required this.documentSnapshot,
  });

  final DocumentSnapshot documentSnapshot;

  @override
  State<MushroomsDetailScreen> createState() => _LakesDetailScreenState();
}

class _LakesDetailScreenState extends State<MushroomsDetailScreen> {
  PageController _pageController = PageController();
  double pageOffset = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 1);
    _pageController.addListener(() {
      setState(() {
        pageOffset = _pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dynamic data = widget.documentSnapshot;

    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBarLarge(
            name: data['name'],
            controller: _pageController,
            count: 5,
            color: AppColors.mushroomsColors,
            foregroundColor: AppColors.mushroomsColors,
            images: [
              RedBookPageViewImages(
                data: data['image'],
                image: data['image'],
                pageViewCircularColor: AppColors.mushroomsColors,
              ),
              RedBookPageViewImages(
                data: data['image'],
                image: data['pageViewImage1'],
                pageViewCircularColor: AppColors.mushroomsColors,
              ),
              RedBookPageViewImages(
                data: data['image'],
                image: data['pageViewImage2'],
                pageViewCircularColor: AppColors.mushroomsColors,
              ),
              RedBookPageViewImages(
                data: data['image'],
                image: data['pageViewImage3'],
                pageViewCircularColor: AppColors.mushroomsColors,
              ),
              RedBookPageViewImages(
                data: data['image'],
                image: data['pageViewImage4'],
                pageViewCircularColor: AppColors.mushroomsColors,
              ),
            ],
          ),
          SliverListWidget(
            color: Color(int.tryParse(data['color'])!.toInt()),
            colorStatus: Color(int.tryParse(data['colorStatus'])!.toInt()),
            status: data['status'],
            name: data['name'],
            nameLat: data['nameLat'],
            nameLatColor: AppColors.mushroomsColors,
            statusBody: data['statusBody'],
            descriptionBody: data['descriptionBody'],
            featuresOfBiologyBody: data['featuresOfBiologyBody'],
            spreadingBody: data['spreadingBody'],
            placesBody: data['placesBody'],
            numberBody: data['numberBody'],
            limitBody: data['limitBody'],
            cultivationBody: data['cultivationBody'],
            existingBody: data['existingBody'],
            recommendedBody: data['recommendedBody'],
          ),
        ],
      ),
    );
  }
}
