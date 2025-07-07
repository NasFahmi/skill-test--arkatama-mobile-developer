import 'package:skill_test_mobile_developer/config/db/db.dart';
import 'package:skill_test_mobile_developer/domain/entity/travel_entity.dart';

class TravelRepository {
  final DBHelper dbHelper;

  TravelRepository(this.dbHelper);

  Future<int> insert(TravelEntity travel) async {
    final db = await dbHelper.database;
    return await db.insert('travel', travel.toMap());
  }

  Future<List<TravelEntity>> getAll() async {
    final db = await dbHelper.database;
    final maps = await db.query('travel');
    return maps.map((map) => TravelEntity.fromMap(map)).toList();
  }

  Future<TravelEntity?> getById(int id) async {
    final db = await dbHelper.database;
    final maps = await db.query('travel', where: 'id = ?', whereArgs: [id]);
    if (maps.isNotEmpty) {
      return TravelEntity.fromMap(maps.first);
    }
    return null;
  }

  Future<int> update(TravelEntity travel) async {
    final db = await dbHelper.database;
    return await db.update(
      'travel',
      travel.toMap(),
      where: 'id = ?',
      whereArgs: [travel.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await dbHelper.database;
    return await db.delete('travel', where: 'id = ?', whereArgs: [id]);
  }
}
