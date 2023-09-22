import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nature_of_kyrgyzstan/components/app_colors.dart';
import 'package:nature_of_kyrgyzstan/screens/red_book/fish/widgets/fish_detail_screen_items.dart';
import '../widgets/red_book_page_view.dart';
import '../widgets/sliver_app_bar_large.dart';

class FishDetailScreen extends StatefulWidget {
  const FishDetailScreen({
    super.key,
    required this.documentSnapshot,
  });

  final DocumentSnapshot documentSnapshot;

  @override
  State<FishDetailScreen> createState() => _LakesDetailScreenState();
}

class _LakesDetailScreenState extends State<FishDetailScreen> {
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
            count: 3,
            color: AppColors.fishColors,
            images: [
              RedBookPageViewImages(image: data['image'], data: data['image']),
              RedBookPageViewImages(
                  image: data['pageViewImage1'], data: data['image']),
              RedBookPageViewImages(
                  image: data['pageViewImage2'], data: data['image']),
            ],
          ),
          FishDetailScreenItems(
            name: data['name'],
            nameLat: data['nameLat'],
            status: data['status'],
            color: Color(int.tryParse(data['color'])!.toInt()),
            colorStatus: Color(int.tryParse(data['colorStatus'])!.toInt()),
            statusBody: data['statusBody'].toString().replaceAll(
                  RegExp(r'\[\d+(,\s*\d+)?\]'),
                  '',
                ),
            descriptionBody: data['descriptionBody'].toString().replaceAll(
                  RegExp(r'\[\d+(,\s*\d+)?\]'),
                  '',
                ),
            distributionBody: data['distributionBody'].toString().replaceAll(
                  RegExp(r'\[\d+(,\s*\d+)?\]'),
                  '',
                ),
            habitatBody: data['habitatBody'].toString().replaceAll(
                  RegExp(r'\[\d+(,\s*\d+)?\]'),
                  '',
                ),
            numberBody: data['numberBody'].toString().replaceAll(
                  RegExp(r'\[\d+(,\s*\d+)?\]'),
                  '',
                ),
            lifeCycleBody: data['lifeCycleBody'].toString().replaceAll(
                  RegExp(r'\[\d+(,\s*\d+)?\]'),
                  '',
                ),
            limitBody: data['limitBody'].toString().replaceAll(
                  RegExp(r'\[\d+(,\s*\d+)?\]'),
                  '',
                ),
            breedingBody: data['breedingBody'].toString().replaceAll(
                  RegExp(r'\[\d+(,\s*\d+)?\]'),
                  '',
                ),
            existingBody: data['existingBody'].toString().replaceAll(
                  RegExp(r'\[\d+(,\s*\d+)?\]'),
                  '',
                ),
            recommendedBody: data['recommendedBody'].toString().replaceAll(
                  RegExp(r'\[\d+(,\s*\d+)?\]'),
                  '',
                ),
          ),
        ],
      ),
    );
  }
}
