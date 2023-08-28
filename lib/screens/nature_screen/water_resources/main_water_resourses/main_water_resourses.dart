import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nature_of_kyrgyzstan/components/app_colors.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/water_resources/main_water_resourses/bloc/water_resourses_bloc.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/water_resources/main_water_resourses/widgets/main_water_resourses_item.dart';

class MainWaterResourses extends StatelessWidget {
  const MainWaterResourses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: BlocBuilder<WaterResouresBloc, WaterResoursesState>(
        builder: (context, state) {
          if (state is WaterResoursesError) {
            return const Center(
              child: Text('ERROR'),
            );
          }
          if (state is WaterResoursesSuccess) {
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(
                width: 20,
              ),
              itemCount: state.waterResourses.length,
              itemBuilder: (context, index) =>
                  WaterResoursesItem(model: state.waterResourses[index]),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
