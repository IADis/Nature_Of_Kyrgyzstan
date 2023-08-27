import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nature_of_kyrgyzstan/components/app_colors.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/reserves_parks/main_reserves/bloc/reserves_bloc.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/reserves_parks/main_reserves/widgets/main_reserves_item.dart';

class MainReserves extends StatefulWidget {
  const MainReserves({super.key});

  @override
  State<MainReserves> createState() => _MainMountainState();
}

class _MainMountainState extends State<MainReserves> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: BlocBuilder<ReservesBloc, ReservesState>(
        builder: (context, state) {
          if (state is SuccessReserves) {
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(
                width: 20,
              ),
              itemCount: state.reserves.length,
              itemBuilder: (context, index) =>
                  MainReservesItem(model: state.reserves[index]),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      // const MainMountainsWidget(),
    );
  }
}
