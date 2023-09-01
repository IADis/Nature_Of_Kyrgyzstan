import 'package:flutter/material.dart';
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
import 'package:nature_of_kyrgyzstan/screens/widgets/app_bar.dart';
import 'kyrgyz_ata/kyrgyz_ata.dart';
import 'saimaluu_tash/saimaluu_tash.dart';

class ParksScreen extends StatelessWidget {
  const ParksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: ListView(
        children: const [
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
    );
  }
}
