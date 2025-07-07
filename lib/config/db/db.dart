import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper instance = DBHelper._internal();
  static Database? _database;

  DBHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'travel_app.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
      onOpen: (db) async {
        await db.execute('PRAGMA foreign_keys = ON');
      },
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE travel (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  tanggal_keberangkatan TEXT,
  kuota INTEGER
)

  ''');

    await db.execute('''
CREATE TABLE penumpang (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  id_travel INTEGER,
  kode_booking TEXT,
  nama TEXT,
  jenis_kelamin TEXT,
  kota TEXT,
  usia INTEGER,
  tahun_lahir INTEGER,
  created_at TEXT,
  FOREIGN KEY (id_travel) REFERENCES travel(id) ON DELETE CASCADE
)
''');
  }
}
