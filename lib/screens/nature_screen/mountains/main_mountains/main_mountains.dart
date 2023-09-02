import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return BlocBuilder<MountainsBloc, MountainsState>(
      builder: (context, state) {
        if (state is SuccessMountains) {
          return PageView.builder(
            controller: PageController(viewportFraction: 0.9),
            itemCount: state.mountains.length,
            itemBuilder: (context, index) {
              return MainMountainsItem(model: state.mountains[index]);
            },
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}




// ListView.separated(
//             scrollDirection: Axis.horizontal,
//             physics: const BouncingScrollPhysics(),
//             padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
//             separatorBuilder: (context, index) => const SizedBox(
//               width: 20,
//             ),
//             itemCount: state.mountains.length,
//             itemBuilder: (context, index) =>
//                 MainMountainsItem(model: state.mountains[index]),
//           );