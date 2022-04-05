import 'package:coffee_counter/domain/failures/failure.dart';
import 'package:coffee_counter/domain/entities/maschine_entity.dart';
import 'package:coffee_counter/domain/repositories/maschine_repository.dart';
import 'package:coffee_counter/infrastructure/datasources/maschines_local_datasource.dart';
import 'package:coffee_counter/infrastructure/exceptions/exceptions.dart';
import 'package:dartz/dartz.dart';

class MaschineRepositoryImpl extends MaschineRepository {
  MaschineRepositoryImpl(this.maschinesLocalDatasource);
  final MaschinesLocalDatasource maschinesLocalDatasource;

  @override
  Future<Either<Failure, List<MaschineEntity>>> getAllMaschines() async {
    List<MaschineEntity> maschines;

    try {
      maschines = await maschinesLocalDatasource.getAllMaschines();
      return Right(maschines);
    } catch (e) {
      if (e is DatabaseException) {
        return Left(DatabaseFailure());
      } else {
        return Left(GeneralFailure());
      }
    }
  }
}
