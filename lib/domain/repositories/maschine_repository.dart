import 'package:coffee_counter/domain/entities/maschine_entity.dart';
import 'package:coffee_counter/domain/failures/failure.dart';
import 'package:dartz/dartz.dart';

abstract class MaschineRepository {
  Future<Either<Failure, List<MaschineEntity>>> getAllMaschines();
  Future<MaschineEntity> insertMaschine(MaschineEntity maschine);
}
