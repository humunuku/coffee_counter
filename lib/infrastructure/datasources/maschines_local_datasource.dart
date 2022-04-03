import 'package:coffee_counter/domain/entities/maschine_entity.dart';
import 'package:coffee_counter/infrastructure/models/maschine_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

abstract class MaschinesLocalDatasource {
  Future<List<MaschineEntity>> getallMaschines();
  Future<MaschineEntity> insertMaschine(final MaschineEntity maschineEntity);
  Future<void> updateMaschine(final MaschineEntity maschineEntity);
  Future<void> deleteMaschine(final int id);
}

class MaschineLocalDatasourceImpl implements MaschinesLocalDatasource {
  static const _databaseName = 'maschines_database';
  static const _tableName = 'maschines_table';
  static const _databaseVersion = 1;
  static const _columnId = 'id';
  static const _columnTitle = 'title';
  static const _columnDescription = 'description';
  static const _columnBalance = 'balance';
  static const _columnCostOfCoffee = 'costOfCoffee';
  static Database? _database;

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), _databaseName),
      onCreate: (db, _) {
        db.execute('''
          CREATE TABLE $_tableName(
            $_columnId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            $_columnTitle TEXT NOT NULL,
            $_columnDescription TEXT,
            $_columnBalance FLOAT NOT NULL,
            $_columnCostOfCoffee FLOAT NOT NULL
          )
        ''');
      },
      version: _databaseVersion,
    );
  }

  @override
  Future<void> deleteMaschine(int id) {
    // TODO: implement deleteMaschine
    throw UnimplementedError();
  }

  @override
  Future<List<MaschineEntity>> getallMaschines() async {
    final db = await database;
    final result = await db.query(_tableName);
    return result
        .map((maschineJSON) => MaschineModel.fromJson(maschineJSON))
        .toList();
  }

  @override
  Future<MaschineEntity> insertMaschine(MaschineEntity maschineEntity) {
    // TODO: implement insertMaschine
    throw UnimplementedError();
  }

  @override
  Future<void> updateMaschine(MaschineEntity maschineEntity) {
    // TODO: implement updateMaschine
    throw UnimplementedError();
  }
}
