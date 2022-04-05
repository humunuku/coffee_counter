import 'package:bloc/bloc.dart';
import 'package:coffee_counter/domain/entities/maschine_entity.dart';
import 'package:coffee_counter/domain/usecases/maschine_usecases.dart';
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
        (failure) => emit(MaschinesError()),
        (maschines) => emit(MaschinesLoaded(maschines: maschines)),
      );
    });
  }
}
