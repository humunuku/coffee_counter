import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'maschinebloc_event.dart';
part 'maschinebloc_state.dart';

class MaschineblocBloc extends Bloc<MaschineblocEvent, MaschineblocState> {
  MaschineblocBloc() : super(MaschineblocInitial()) {
    on<MaschineblocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
