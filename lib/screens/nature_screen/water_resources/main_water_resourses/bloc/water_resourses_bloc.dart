import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/water_resources/main_water_resourses/model/water_resourses_model.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/water_resources/main_water_resourses/repository/water_resourses_repo.dart';

class WaterResouresBloc extends Bloc<WaterResoursesEvent, WaterResoursesState> {
  WaterResouresBloc({required WaterResoursesRepo waterResoursesRepo})
      : _waterResoursesRepo = waterResoursesRepo,
        super(WaterResoursesInitial()) {
    on<GetWaterResourses>(
      (event, emit) {
        final model = _waterResoursesRepo.getWaterResourses();
        emit(WaterResoursesSuccess(waterResourses: model));
      },
    );
  }

  final WaterResoursesRepo _waterResoursesRepo;
}

abstract class WaterResoursesEvent {}

class GetWaterResourses extends WaterResoursesEvent {}

abstract class WaterResoursesState {}

class WaterResoursesInitial extends WaterResoursesState {}

class WaterResoursesLoading extends WaterResoursesState {}

class WaterResoursesSuccess extends WaterResoursesState {
  WaterResoursesSuccess({required this.waterResourses});
  final List<WaterResoursesModel> waterResourses;
}

class WaterResoursesError extends WaterResoursesState {}
