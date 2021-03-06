part of 'maschine_bloc.dart';

@immutable
abstract class MaschineState {}

class MaschineInitial extends MaschineState {}

class MaschinesLoading extends MaschineState {}

class ReloadMaschines extends MaschineState {}

class MaschinesLoaded extends MaschineState {
  final List<MaschineEntity> maschines;

  MaschinesLoaded({required this.maschines});
}

class MaschinesError extends MaschineState {
  final String errorMessage;

  MaschinesError({required this.errorMessage});
}
