import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'sonuclar.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE sonuclar(id INTEGER PRIMARY KEY AUTOINCREMENT, tarih TEXT, temel_net REAL, klinik_net REAL)',
        );
      },
    );
  }

  Future<void> insertSonuc(String tarih, double temelNet, double klinikNet) async {
    final db = await database;
    await db.insert(
      'sonuclar',
      {'tarih': tarih, 'temel_net': temelNet, 'klinik_net': klinikNet},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }



  Future<List<Map<String, dynamic>>> getSonuclar() async {
    final db = await database;
    return await db.query('sonuclar');
  }

  Future<void> deleteSonuc(int id) async {
    final db = await database;
    await db.delete(
      'sonuclar',
      where: 'id = ?',
      whereArgs: [id],
    );
  }


