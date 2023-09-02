import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return BlocBuilder<ReservesBloc, ReservesState>(
      builder: (context, state) {
        if (state is SuccessReserves) {
          return PageView.builder(
            controller: PageController(viewportFraction: 0.9),
            itemCount: state.reserves.length,
            itemBuilder: (context, index) {
              return MainReservesItem(model: state.reserves[index]);
            },
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
