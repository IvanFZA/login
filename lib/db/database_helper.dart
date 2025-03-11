import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'users.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE users(id INTEGER PRIMARY KEY, name TEXT, email TEXT UNIQUE, password TEXT)"
        );
      },
    );
  }

  Future<int> registerUser(String name, String email, String password) async {
    final db = await database;
    return db.insert('users', {'name': name, 'email': email, 'password': password});
  }

  Future<Map<String, dynamic>?> loginUser(String email, String password) async {
    final db = await database;
    final List<Map<String, dynamic>> users = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    return users.isNotEmpty ? users.first : null;
  }
}
