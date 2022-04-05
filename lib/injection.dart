import 'package:coffee_counter/domain/repositories/maschine_repository.dart';
import 'package:coffee_counter/infrastructure/datasources/maschines_local_datasource.dart';
import 'package:coffee_counter/infrastructure/repositories/maschine_repository_impl.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.I;

Future<void> init() async {
//! Repos
  sl.registerLazySingleton<MaschineRepository>(
      () => MaschineRepositoryImpl(sl()));

//! Datasources
  sl.registerLazySingleton<MaschinesLocalDatasource>(
      () => MaschineLocalDatasourceImpl());
}
