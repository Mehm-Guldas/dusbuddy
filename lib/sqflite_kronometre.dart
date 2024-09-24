import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ChronometerDatabase {
  Database? _database;

  // Veritabanını açma veya oluşturma
  Future<void> openDb() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'chrono_db.db'),
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE chronometers(id INTEGER PRIMARY KEY, name TEXT, duration INTEGER, date TEXT)",
        );
      },
    );
  }

  // Kronometre verisini kaydetme
  Future<void> insertChronometer(String name, int duration, String date) async {
    await _database?.insert(
      'chronometers',
      {'name': name, 'duration': duration, 'date': date},
    );
  }

  // Kaydedilen verileri alma
  Future<List<Map<String, dynamic>>> getChronometers() async {
    List<Map<String, dynamic>> chronometers = await _database?.query('chronometers') ?? [];
    print("Veritabanından çekilen veriler: $chronometers");  // Verileri konsolda yazdır
    return chronometers;
  }

}
