import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'accounts.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE accounts(
            id INTEGER PRIMARY KEY AUTOINCREMENT, 
            username TEXT, 
            password TEXT,
            email TEXT
          )
        ''');
      },
    );
  }

  Future<void> insertAccount(String username,String email, String password) async {
    final db = await database;
    await db.insert(
      'accounts',
      {'username': username,'email': email, 'password': password},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getAccounts() async {
    final db = await database;
    return await db.query('accounts');
  }

  Future<void> deleteAccount(int id) async {
    final db = await database;
    await db.delete(
      'accounts',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}