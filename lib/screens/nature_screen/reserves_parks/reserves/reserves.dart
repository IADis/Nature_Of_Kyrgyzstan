import 'package:flutter/material.dart';
import 'package:nature_of_kyrgyzstan/components/app_colors.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/reserves_parks/reserves/besh_aral/besh_aral.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/reserves_parks/reserves/dashman/dashman.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/reserves_parks/reserves/issyk_kul/issyk_kul.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/reserves_parks/reserves/karatal_khapyryk/karatal_khapyryk.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/reserves_parks/reserves/kulun_ata/kulun_ata.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/reserves_parks/reserves/naryn/naryn.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/reserves_parks/reserves/padysh_ata/padysh_ata.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/reserves_parks/reserves/sary_chelek/sary_chelek.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/reserves_parks/reserves/sarychat_ertash/sarychat_ertash.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/reserves_parks/reserves/surma_tash/surma_tash.dart';
import 'package:nature_of_kyrgyzstan/screens/widgets/app_bar.dart';

class ReservesScreen extends StatelessWidget {
  const ReservesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: const AppBarWidget(),
      body: const CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: 20),
                IssykKul(),
                SizedBox(height: 20),
                SaryChelek(),
                SizedBox(height: 20),
                BeshAral(),
                SizedBox(height: 20),
                Naryn(),
                SizedBox(height: 20),
                KaratalKhapyryk(),
                SizedBox(height: 20),
                SarychatErtash(),
                SizedBox(height: 20),
                PadyshAta(),
                SizedBox(height: 20),
                KulunAta(),
                SizedBox(height: 20),
                SurmaTash(),
                SizedBox(height: 20),
                Dashman(),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
