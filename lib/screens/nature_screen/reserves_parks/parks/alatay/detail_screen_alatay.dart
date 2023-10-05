import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../../components/app_colors.dart';
import '../../../../widgets/body_text.dart';
import '../../../../widgets/page_view_images.dart';
import '../../../../widgets/sliver_app_bar.dart';
import '../../../../widgets/smooth_page.dart';

class AlatayDetailScreen extends StatefulWidget {
  const AlatayDetailScreen({super.key, required this.documentSnapshot});
  final DocumentSnapshot documentSnapshot;

  @override
  State<AlatayDetailScreen> createState() => _AlatayDetailScreenState();
}

class _AlatayDetailScreenState extends State<AlatayDetailScreen> {
  final _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
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
          SliverAppBarWidget(
            image: data['image'],
            name: data['name'],
            sliverHeight: 75,
            containerHeight: 90,
          ),
          SliverToBoxAdapter(
            child: SizedBox(
                height: 400,
                child: PageView(controller: _controller, children: [
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
                ])),
          ),
          SliverToBoxAdapter(
            child: SmoothIndicatorWidget(
              controller: _controller,
              count: 15,
              color: AppColors.plantsColors,
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
          SliverToBoxAdapter(
            child: BodyTextWidget(
              text: data['bodyText'].toString().replaceAll('\\n', '\n'),
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
