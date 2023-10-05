import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nature_of_kyrgyzstan/components/app_colors.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/water_resources/watterfalls/widgets/watterfalls_list.dart';
import 'package:nature_of_kyrgyzstan/screens/widgets/page_view_images.dart';

import '../../../widgets/app_bar.dart';

class WatterfallsScreen extends StatefulWidget {
  const WatterfallsScreen({super.key});

  @override
  State<WatterfallsScreen> createState() => _WatterfallsScreenState();
}

class _WatterfallsScreenState extends State<WatterfallsScreen> {
  final _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> watterfalls =
        FirebaseFirestore.instance.collection('watterfalls').snapshots();
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: const AppBarWidget(
        name: '',
        elevation: 0,
      ),
      body: StreamBuilder(
        stream: watterfalls,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('ERROR'));
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
            return WatterfallsList(
              name: data['name'],
              nameTearsOfTheLeopard: data['nameTearsOfTheLeopard'],
              bodyTearsOfTheLeopard: data['bodyTearsOfTheLeopard'],
              imageTearsOfTheLeopard: data['imageTearsOfTheLeopard'],
              nameKegetinsy: data['nameKegetinsy'],
              bodyKegetinsy: data['bodyKegetinsy'],
              imageKegetinsy: data['imageKegetinsy'],
              nameShaar: data['nameShaar'],
              bodyShaar: data['bodyShaar'],
              imageShaar: data['imageShaar'],
              name33Parrots: data['name33Parrots'],
              body33Parrots: data['body33Parrots'],
              image33Parrots: data['image33Parrots'],
              nameGirlsTears: data['nameGirlsTears'],
              bodyGirlsTears: data['bodyGirlsTears'],
              imageGirlsTears: data['imageGirlsTears'],
              nameAbshirAta: data['nameAbshirAta'],
              bodyAbshirAta: data['bodyAbshirAta'],
              imageAbshirAta: data['imageAbshirAta'],
              nameArslanBob: data['nameArslanBob'],
              bodyArslanBob: data['bodyArslanBob'],
              pageViewImage: [
                PageViewImages(image: data['imageArslanBobBig']),
                PageViewImages(image: data['imageArslanBobSmall']),
              ],
              controller: _controller,
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}



// ListView(
//               padding: const EdgeInsets.symmetric(vertical: 10),
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 15),
//                   child: Text(
//                     data['name'],
//                     style: AppText.mainTitleTextStyle,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 15),
//                   child: Text(
//                     data['nameTearsOfTheLeopard'],
//                     style: AppText.titleTextStyle,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 15),
//                   child: Text(
//                     data['bodyTearsOfTheLeopard'],
//                     style: AppText.bodyTextStyle,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 400,
//                   child: PageView(children: [
//                     PageViewImages(
//                       image: data['imageTearsOfTheLeopard'],
//                     ),
//                   ]),
//                 ),
//                 const SizedBox(height: 20),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 15),
//                   child: Text(
//                     data['nameKegetinsy'],
//                     style: AppText.titleTextStyle,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 15),
//                   child: Text(
//                     data['bodyKegetinsy'],
//                     style: AppText.bodyTextStyle,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 400,
//                   child: PageView(children: [
//                     PageViewImages(
//                       image: data['imageKegetinsy'],
//                     ),
//                   ]),
//                 ),
//                 const SizedBox(height: 20),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 15),
//                   child: Text(
//                     data['nameShaar'],
//                     style: AppText.titleTextStyle,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 15),
//                   child: Text(
//                     data['bodyShaar'],
//                     style: AppText.bodyTextStyle,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 400,
//                   child: PageView(children: [
//                     PageViewImages(
//                       image: data['imageShaar'],
//                     ),
//                   ]),
//                 ),
//                 const SizedBox(height: 20),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 15),
//                   child: Text(
//                     data['name33Parrots'],
//                     style: AppText.titleTextStyle,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 15),
//                   child: Text(
//                     data['body33Parrots'],
//                     style: AppText.bodyTextStyle,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 400,
//                   child: PageView(children: [
//                     PageViewImages(
//                       image: data['image33Parrots'],
//                     ),
//                   ]),
//                 ),
//                 const SizedBox(height: 20),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 15),
//                   child: Text(
//                     data['nameGirlsTears'],
//                     style: AppText.titleTextStyle,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 15),
//                   child: Text(
//                     data['bodyGirlsTears'],
//                     style: AppText.bodyTextStyle,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 400,
//                   child: PageView(children: [
//                     PageViewImages(
//                       image: data['imageGirlsTears'],
//                     ),
//                   ]),
//                 ),
//                 const SizedBox(height: 20),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 15),
//                   child: Text(
//                     data['nameAbshirAta'],
//                     style: AppText.titleTextStyle,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 15),
//                   child: Text(
//                     data['bodyAbshirAta'],
//                     style: AppText.bodyTextStyle,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 400,
//                   child: PageView(children: [
//                     PageViewImages(
//                       image: data['imageAbshirAta'],
//                     ),
//                   ]),
//                 ),
//                 const SizedBox(height: 20),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 15),
//                   child: Text(
//                     data['nameArslanBob'],
//                     style: AppText.titleTextStyle,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 15),
//                   child: Text(
//                     data['bodyArslanBob'],
//                     style: AppText.bodyTextStyle,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 400,
//                   child: PageView(children: [
//                     PageViewImages(
//                       image: data['imageArslanBobBig'],
//                       image: data['imageArslanBobSmall'],
//                     ),
//                   ]),
//                 ),
//               ],
//             );