import 'package:coffee_counter/domain/entities/maschine_entity.dart';
import 'package:coffee_counter/domain/failures/failure.dart';
import 'package:coffee_counter/domain/repositories/maschine_repository.dart';
import 'package:coffee_counter/infrastructure/models/maschine_model.dart';
import 'package:dartz/dartz.dart';

class MaschineUsecases {
  MaschineUsecases(this.maschineRepository);
  final MaschineRepository maschineRepository;

  Future<Either<Failure, List<MaschineEntity>>> getAllMaschinesUseCase() {
    // Man könnte hier auch die Daten zwischenspeichern,
    // manipulieren und eventuell andere Fehler zurückgeben.
    return maschineRepository.getAllMaschines();
  }

  Future<MaschineEntity> insertMaschine(MaschineEntity maschine) {
    return maschineRepository.insertMaschine(maschine);
  }
}
