import 'package:bloc/bloc.dart';
import 'package:coffee_counter/domain/entities/maschine_entity.dart';
import 'package:coffee_counter/domain/usecases/maschine_usecases.dart';
import 'package:coffee_counter/infrastructure/models/maschine_model.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../domain/failures/failure.dart';

part 'maschine_event.dart';
part 'maschine_state.dart';

class MaschineBloc extends Bloc<MaschineEvent, MaschineState> {
  final MaschineUsecases maschineUsecases;

  MaschineBloc({required this.maschineUsecases}) : super(MaschineInitial()) {
    on<MaschinesRequestedEvent>((event, emit) async {
      emit(MaschinesLoading());

      Either<Failure, List<MaschineEntity>> maschinesOrFailure =
          await maschineUsecases.getAllMaschinesUseCase();

      maschinesOrFailure.fold(
        (failure) => emit(MaschinesError(errorMessage: failure.toString())),
        (maschines) => emit(MaschinesLoaded(maschines: maschines)),
      );
    });

    on<AddMaschineEvent>((event, emit) async {
      emit(MaschinesLoading());

      // Temporary
      MaschineEntity maschine = MaschineEntity(
          title: "erste Maschine",
          description: "Beschreibung",
          balance: 100.0,
          costOfCoffee: 0.30);
      await maschineUsecases.insertMaschine(maschine);
      emit(ReloadMaschines());
    });
  }
}
