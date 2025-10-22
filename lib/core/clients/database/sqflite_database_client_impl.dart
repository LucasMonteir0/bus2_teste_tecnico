import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../../data/models/user/user_model.dart';
import '../../errors/database_error.dart';
import '../../wrappers/result_wrapper.dart';
import 'database_client.dart';

class SqfliteDatabaseClientImpl implements DatabaseClient {
  Database? _db;
  static const String _tableName = 'users';

  SqfliteDatabaseClientImpl();

  Database _getDb() {
    if (_db == null) {
      throw Exception('Database not initialized. Call init() before using.');
    }
    return _db!;
  }

  @override
  Future<void> init() async {
    if (_db != null) {
      return;
    }
    _db = await _initDB();
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'users_database.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_tableName (
        uuid TEXT PRIMARY KEY,
        email TEXT,
        phone TEXT,
        cell TEXT,
        name TEXT,       
        location TEXT,   
        dob TEXT,        
        picture TEXT  
      )
    ''');
  }

  @override
  Future<ResultWrapper<bool>> saveUser(UserModel user) async {
    try {
      final db = _getDb();

      await db.insert(
        _tableName,
        user.toSqfliteJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      return ResultWrapper.success(true);
    } catch (e) {
      return ResultWrapper.error(
        DatabaseError(message: 'Failed to save user: ${e.toString()}'),
      );
    }
  }

  @override
  Future<ResultWrapper<List<UserModel>>> getAllUsers() async {
    try {
      final db = _getDb();
      final List<Map<String, dynamic>> maps = await db.query(_tableName);

      final users = List<UserModel>.from(
        maps.map((map) => UserModel.fromSqfliteJson(map)),
      );

      return ResultWrapper.success(users);
    } catch (e) {
      return ResultWrapper.error(
        DatabaseError(message: 'Failed to get users: ${e.toString()}'),
      );
    }
  }

  @override
  Future<ResultWrapper<bool>> clearUsers() async {
    try {
      final db = _getDb();
      await db.delete(_tableName);

      return ResultWrapper.success(true);
    } catch (e) {
      return ResultWrapper.error(
        DatabaseError(message: 'Failed to clear users: ${e.toString()}'),
      );
    }
  }
}
