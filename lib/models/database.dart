import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Database {
  Database._();
  static final Database db = Database._();
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }

    _database = await initDB();
    return _database;
  }

  initDB() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'hivemind.db'),
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE students (
            id 
          )
        ''');
      },
    );
  }
}
