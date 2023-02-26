import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _databaseName = "hivemind.db";
  static const _databaseVersion = 1;

  static const eventTable = 'events';

  static const columnId = '_id';
  static const columnName = 'name';
  static const columnYear = 'year';

  late Database _db;

  // this opens the database (and creates it if it doesn't exist)
  Future<void> init() async {
// Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, _databaseName);
    _db = await openDatabase(path, onCreate: _onCreate, version: 1);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $eventTable (
            $columnId TEXT PRIMARY KEY,
            $columnName TEXT NOT NULL,
            $columnYear INTEGER NOT NULL
          )
          ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    return await _db.insert(eventTable, row);
  }

  Future<List<Map<String, dynamic>>> query(String query) async {
    return await _db.query(query);
  }
}
