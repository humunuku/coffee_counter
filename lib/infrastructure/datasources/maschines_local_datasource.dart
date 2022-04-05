import 'package:coffee_counter/domain/entities/maschine_entity.dart';
import 'package:coffee_counter/infrastructure/models/maschine_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

abstract class MaschinesLocalDatasource {
  Future<List<MaschineEntity>> getAllMaschines();
  Future<MaschineEntity> insertMaschine(final MaschineModel maschineEntity);
  Future<int> updateMaschine(final MaschineModel maschineEntity);
  Future<int> deleteMaschine(final int id);
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
            $_columnBalance NUMBER NOT NULL,
            $_columnCostOfCoffee NUMBER NOT NULL
          )
        ''');
      },
      version: _databaseVersion,
    );
  }

  @override
  Future<int> deleteMaschine(int id) async {
    final db = await database;
    return await db.delete(
      _tableName,
      where: '$_columnId = ?',
      whereArgs: [id],
    );
  }

  @override
  Future<List<MaschineEntity>> getAllMaschines() async {
    final db = await database;
    const orderBy = '$_columnTitle ASC';

    final result = await db.query(_tableName, orderBy: orderBy);
    return result
        .map((maschineJSON) => MaschineModel.fromJson(maschineJSON))
        .toList();
  }

  @override
  Future<MaschineEntity> insertMaschine(MaschineModel maschineModel) async {
    final db = await database;
    final id = await db.insert(_tableName, maschineModel.toJson());
    return maschineModel.copy(id: id);
  }

  @override
  Future<int> updateMaschine(MaschineModel maschineModel) async {
    final db = await database;

    return db.update(
      _tableName,
      maschineModel.toJson(),
      where: '$_columnId = ?',
      whereArgs: [maschineModel.id],
    );
  }
}
