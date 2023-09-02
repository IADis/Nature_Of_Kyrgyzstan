import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/water_resources/main_water_resourses/bloc/water_resourses_bloc.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/water_resources/main_water_resourses/widgets/main_water_resourses_item.dart';

class MainWaterResourses extends StatelessWidget {
  const MainWaterResourses({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterResouresBloc, WaterResoursesState>(
      builder: (context, state) {
        if (state is WaterResoursesSuccess) {
          return PageView.builder(
            controller: PageController(viewportFraction: 0.9),
            itemCount: state.waterResourses.length,
            itemBuilder: (context, index) {
              return WaterResoursesItem(model: state.waterResourses[index]);
            },
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
