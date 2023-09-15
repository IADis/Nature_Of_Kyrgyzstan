import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nature_of_kyrgyzstan/components/app_colors.dart';
import 'package:nature_of_kyrgyzstan/components/app_text.dart';
import 'package:nature_of_kyrgyzstan/screens/widgets/page_view_images.dart';
import 'package:nature_of_kyrgyzstan/screens/widgets/sliver_app_bar.dart';
import 'package:nature_of_kyrgyzstan/screens/widgets/smooth_page.dart';

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
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar.large(
            title: Text(
              data['name'],
            ),
            pinned: true,
            foregroundColor: Colors.orange,
            backgroundColor: AppColors.scaffoldBackgroundColor,
            elevation: 0,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: Stack(
                children: [
                  PageView(
                    controller: _pageController,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              data['image'],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              data['pageViewImage1'],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              data['pageViewImage2'],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              data['pageViewImage3'],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              data['pageViewImage4'],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    right: 150,
                    top: 290,
                    child: SmoothIndicatorWidget(
                        controller: _pageController, count: 5),
                  ),
                ],
              ),
            ),
            // bottom: PreferredSize(
            //   preferredSize: const Size(0, 0),
            //   child: Container(
            //     height: 25,
            //     width: double.infinity,
            //     decoration: BoxDecoration(
            //       color: AppColors.scaffoldBackgroundColor,
            //       borderRadius: const BorderRadius.only(
            //         topLeft: Radius.circular(40),
            //         topRight: Radius.circular(40),
            //       ),
            //     ),
            //   ),
            // ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data['name'].toString(),
                    style: GoogleFonts.montserratAlternates(
                      fontSize: 24,
                      color: const Color(0xff232828),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    data['nameLat'].toString(),
                    style: GoogleFonts.raleway(
                      fontSize: 18,
                      color: const Color(0xff658282),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 10),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'Статус',
                style: AppText.titleTextStyle,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 10),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                data['statusBody'],
                style: AppText.bodyTextStyle,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'Описание',
                style: AppText.titleTextStyle,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 10),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                data['descriptionBody'],
                style: AppText.bodyTextStyle,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'Особенности биологии',
                style: AppText.titleTextStyle,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 10),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                data['featuresOfBiologyBody'],
                style: AppText.bodyTextStyle,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'Распространение',
                style: AppText.titleTextStyle,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 10),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                data['spreadingBody'],
                style: AppText.bodyTextStyle,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'Места произрастания',
                style: AppText.titleTextStyle,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 10),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                data['placesBody'],
                style: AppText.bodyTextStyle,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'Численность',
                style: AppText.titleTextStyle,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 10),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                data['numberBody'],
                style: AppText.bodyTextStyle,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'Лимитирующие факторы',
                style: AppText.titleTextStyle,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 10),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                data['limitBody'],
                style: AppText.bodyTextStyle,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'Культивирование',
                style: AppText.titleTextStyle,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 10),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                data['cultivationBody'],
                style: AppText.bodyTextStyle,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'Меры охраны существующие',
                style: AppText.titleTextStyle,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 10),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                data['existingBody'],
                style: AppText.bodyTextStyle,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'Меры охраны рекомендуемые',
                style: AppText.titleTextStyle,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 10),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                data['recommendedBody'],
                style: AppText.bodyTextStyle,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
        ],
      ),
    );
  }
}
