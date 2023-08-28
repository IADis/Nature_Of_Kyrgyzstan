import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nature_of_kyrgyzstan/components/app_colors.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/mountains/main_mountains/bloc/mountains_bloc.dart';
import 'widgets/main_mountain_item.dart';

class MainMountain extends StatefulWidget {
  const MainMountain({super.key});

  @override
  State<MainMountain> createState() => _MainMountainState();
}

class _MainMountainState extends State<MainMountain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: BlocBuilder<MountainsBloc, MountainsState>(
        builder: (context, state) {
          if (state is SuccessMountains) {
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(
                width: 20,
              ),
              itemCount: state.mountains.length,
              itemBuilder: (context, index) =>
                  MainMountainsItem(model: state.mountains[index]),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      // const MainMountainsWidget(),
    );
  }
}
