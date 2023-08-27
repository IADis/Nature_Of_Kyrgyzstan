import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/mountains/main_mountains/model/mountain_model.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/mountains/main_mountains/repository/mountain_repo.dart';

class MountainsBloc extends Bloc<MountainsEvent, MountainsState> {
  MountainsBloc({required MountainsRepo mountainsRepo})
      : _mountainsRepo = mountainsRepo,
        super(InitialMountains()) {
    on<GetMountains>(
      (event, emit) async {
        final mountains = _mountainsRepo.getMountains();
        emit(SuccessMountains(mountains: mountains));
      },
    );
  }

  final MountainsRepo _mountainsRepo;
}

abstract class MountainsEvent {}

class GetMountains extends MountainsEvent {}

abstract class MountainsState {}

class InitialMountains extends MountainsState {}

class LoadingMountains extends MountainsState {}

class SuccessMountains extends MountainsState {
  SuccessMountains({required this.mountains});
  final List<MountainsModel> mountains;
}

class ErrorMountains extends MountainsState {}
