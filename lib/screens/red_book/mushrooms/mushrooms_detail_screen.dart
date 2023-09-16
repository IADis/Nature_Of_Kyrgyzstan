import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
            images: [
              RedBookPageViewImages(image: data['image']),
              RedBookPageViewImages(image: data['pageViewImage1']),
              RedBookPageViewImages(image: data['pageViewImage2']),
              RedBookPageViewImages(image: data['pageViewImage3']),
              RedBookPageViewImages(image: data['pageViewImage4']),
            ],
          ),
          SliverListWidget(
            color: Color(int.tryParse(data['color'])!.toInt()),
            colorStatus: Color(int.tryParse(data['colorStatus'])!.toInt()),
            status: data['status'],
            name: data['name'],
            nameLat: data['nameLat'],
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

// SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 15),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     data['name'].toString(),
//                     style: GoogleFonts.montserratAlternates(
//                       fontSize: 24,
//                       color: const Color(0xff232828),
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                   const SizedBox(height: 5),
//                   Text(
//                     data['nameLat'].toString(),
//                     style: GoogleFonts.raleway(
//                       fontSize: 18,
//                       color: AppColors.activeColors,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           const SliverToBoxAdapter(
//             child: SizedBox(height: 20),
//           ),
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 15),
//               child: Text(
//                 'Статус',
//                 style: GoogleFonts.montserratAlternates(
//                   fontSize: 24,
//                   color: const Color(0xff232828),
//                   fontWeight: FontWeight.w700,
//                 ),
//               ),
//             ),
//           ),
//           const SliverToBoxAdapter(
//             child: SizedBox(height: 10),
//           ),
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 15),
//               child: Text(
//                 data['statusBody'],
//                 style: GoogleFonts.raleway(
//                   fontSize: 18,
//                   color: Colors.black,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ),
//           ),
//           const SliverToBoxAdapter(
//             child: SizedBox(height: 20),
//           ),
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 15),
//               child: Text(
//                 'Описание',
//                 style: AppText.titleTextStyle,
//               ),
//             ),
//           ),
//           const SliverToBoxAdapter(
//             child: SizedBox(height: 10),
//           ),
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 15),
//               child: Text(
//                 data['descriptionBody'],
//                 style: AppText.bodyTextStyle,
//               ),
//             ),
//           ),
//           const SliverToBoxAdapter(
//             child: SizedBox(height: 20),
//           ),
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 15),
//               child: Text(
//                 'Особенности биологии',
//                 style: AppText.titleTextStyle,
//               ),
//             ),
//           ),
//           const SliverToBoxAdapter(
//             child: SizedBox(height: 10),
//           ),
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 15),
//               child: Text(
//                 data['featuresOfBiologyBody'],
//                 style: AppText.bodyTextStyle,
//               ),
//             ),
//           ),
//           const SliverToBoxAdapter(
//             child: SizedBox(height: 20),
//           ),
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 15),
//               child: Text(
//                 'Распространение',
//                 style: AppText.titleTextStyle,
//               ),
//             ),
//           ),
//           const SliverToBoxAdapter(
//             child: SizedBox(height: 10),
//           ),
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 15),
//               child: Text(
//                 data['spreadingBody'],
//                 style: AppText.bodyTextStyle,
//               ),
//             ),
//           ),
//           const SliverToBoxAdapter(
//             child: SizedBox(height: 20),
//           ),
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 15),
//               child: Text(
//                 'Места произрастания',
//                 style: AppText.titleTextStyle,
//               ),
//             ),
//           ),
//           const SliverToBoxAdapter(
//             child: SizedBox(height: 10),
//           ),
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 15),
//               child: Text(
//                 data['placesBody'],
//                 style: AppText.bodyTextStyle,
//               ),
//             ),
//           ),
//           const SliverToBoxAdapter(
//             child: SizedBox(height: 20),
//           ),
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 15),
//               child: Text(
//                 'Численность',
//                 style: AppText.titleTextStyle,
//               ),
//             ),
//           ),
//           const SliverToBoxAdapter(
//             child: SizedBox(height: 10),
//           ),
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 15),
//               child: Text(
//                 data['numberBody'],
//                 style: AppText.bodyTextStyle,
//               ),
//             ),
//           ),
//           const SliverToBoxAdapter(
//             child: SizedBox(height: 20),
//           ),
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 15),
//               child: Text(
//                 'Лимитирующие факторы',
//                 style: AppText.titleTextStyle,
//               ),
//             ),
//           ),
//           const SliverToBoxAdapter(
//             child: SizedBox(height: 10),
//           ),
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 15),
//               child: Text(
//                 data['limitBody'],
//                 style: AppText.bodyTextStyle,
//               ),
//             ),
//           ),
//           const SliverToBoxAdapter(
//             child: SizedBox(height: 20),
//           ),
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 15),
//               child: Text(
//                 'Культивирование',
//                 style: AppText.titleTextStyle,
//               ),
//             ),
//           ),
//           const SliverToBoxAdapter(
//             child: SizedBox(height: 10),
//           ),
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 15),
//               child: Text(
//                 data['cultivationBody'],
//                 style: AppText.bodyTextStyle,
//               ),
//             ),
//           ),
//           const SliverToBoxAdapter(
//             child: SizedBox(height: 20),
//           ),
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 15),
//               child: Text(
//                 'Меры охраны существующие',
//                 style: AppText.titleTextStyle,
//               ),
//             ),
//           ),
//           const SliverToBoxAdapter(
//             child: SizedBox(height: 10),
//           ),
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 15),
//               child: Text(
//                 data['existingBody'],
//                 style: AppText.bodyTextStyle,
//               ),
//             ),
//           ),
//           const SliverToBoxAdapter(
//             child: SizedBox(height: 20),
//           ),
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 15),
//               child: Text(
//                 'Меры охраны рекомендуемые',
//                 style: AppText.titleTextStyle,
//               ),
//             ),
//           ),
//           const SliverToBoxAdapter(
//             child: SizedBox(height: 10),
//           ),
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 15),
//               child: Text(
//                 data['recommendedBody'],
//                 style: AppText.bodyTextStyle,
//               ),
//             ),
//           ),
//           const SliverToBoxAdapter(
//             child: SizedBox(height: 20),
//           ),
