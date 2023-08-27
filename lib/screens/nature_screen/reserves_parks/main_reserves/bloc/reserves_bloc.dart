import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/reserves_parks/main_reserves/model/reserves_model.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/reserves_parks/main_reserves/repository/reserves_repo.dart';

class ReservesBloc extends Bloc<ReservesEvent, ReservesState> {
  ReservesBloc({required ReservesRepo reservesRepo})
      : _reservesRepo = reservesRepo,
        super(InitalReserves()) {
    on<GetReserves>(
      (event, emit) async {
        final reserves = _reservesRepo.getMountains();
        emit(SuccessReserves(reserves: reserves));
      },
    );
  }

  final ReservesRepo _reservesRepo;
}

abstract class ReservesEvent {}

class GetReserves extends ReservesEvent {}

abstract class ReservesState {}

class InitalReserves extends ReservesState {}

class LoadingReserves extends ReservesState {}

class SuccessReserves extends ReservesState {
  SuccessReserves({required this.reserves});
  final List<ReservesModel> reserves;
}

class ErrorMountains extends ReservesState {}
