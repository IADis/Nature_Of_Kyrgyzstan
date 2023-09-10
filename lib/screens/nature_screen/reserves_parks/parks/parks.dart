import 'package:flutter/material.dart';
import 'package:nature_of_kyrgyzstan/components/app_colors.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/reserves_parks/parks/ala_archa/ala_archa.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/reserves_parks/parks/alatay/alatay.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/reserves_parks/parks/besh_tash/besh_tash.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/reserves_parks/parks/chon_kemin/chon_kemin.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/reserves_parks/parks/kan_achuu/kan_achuu.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/reserves_parks/parks/kara_buura/kara_buura.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/reserves_parks/parks/kara_shoro/kara_shoro.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/reserves_parks/parks/karakol/karakol.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/reserves_parks/parks/khan_teniri/khan_teniri.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/reserves_parks/parks/salkyn_tor/salkyn_tor.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/reserves_parks/parks/sarkent/sarkent.dart';
import '../../../../components/app_text.dart';
import 'kyrgyz_ata/kyrgyz_ata.dart';
import 'saimaluu_tash/saimaluu_tash.dart';

class ParksScreen extends StatefulWidget {
  const ParksScreen({super.key});

  @override
  State<ParksScreen> createState() => _ParksScreenState();
}

class _ParksScreenState extends State<ParksScreen> {
  List parks = const [
    AlaArcha(),
    KyrgyzAta(),
    KaraShoro(),
    BeshTash(),
    ChonKemin(),
    Karakol(),
    SalkynTor(),
    SaimaluuTash(),
    Sarkent(),
    KaraBuura(),
    KanAchuu(),
    Alatay(),
    KhanTeniri(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        appBar: AppBar(
          toolbarHeight: 165,
          leadingWidth: double.infinity,
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  splashColor: const Color(0x00000000),
                  splashRadius: 0.1,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'ГНПП - Государственный национальный природный парк',
                  style: AppText.titleTextStyle,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          foregroundColor: AppColors.appBarForegruoundColor,
          backgroundColor: AppColors.appBarBackgroundColor,
          elevation: 0,
        ),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              AlaArcha(),
              SizedBox(height: 20),
              KyrgyzAta(),
              SizedBox(height: 20),
              KaraShoro(),
              SizedBox(height: 20),
              BeshTash(),
              SizedBox(height: 20),
              ChonKemin(),
              SizedBox(height: 20),
              Karakol(),
              SizedBox(height: 20),
              SalkynTor(),
              SizedBox(height: 20),
              SaimaluuTash(),
              SizedBox(height: 20),
              Sarkent(),
              SizedBox(height: 20),
              KaraBuura(),
              SizedBox(height: 20),
              KanAchuu(),
              SizedBox(height: 20),
              Alatay(),
              SizedBox(height: 20),
              KhanTeniri(),
              SizedBox(height: 20),
            ],
          ),
        ));
  }
}
