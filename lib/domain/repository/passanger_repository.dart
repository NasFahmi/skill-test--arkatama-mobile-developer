import 'package:skill_test_mobile_developer/config/db/db.dart';
import 'package:skill_test_mobile_developer/domain/entity/passanger_entity.dart';

class PassengerRepository {
  final DBHelper dbHelper;

  PassengerRepository(this.dbHelper);

  Future<int> insert(PassengerEntity passenger) async {
    final db = await dbHelper.database;
    return await db.insert('penumpang', passenger.toMap());
  }

  Future<List<PassengerEntity>> getAll() async {
    final db = await dbHelper.database;
    final maps = await db.query('penumpang');
    return maps.map((map) => PassengerEntity.fromMap(map)).toList();
  }

  Future<List<PassengerEntity>> getByTravelId(int travelId) async {
    final db = await dbHelper.database;
    final maps = await db.query(
      'penumpang',
      where: 'id_travel = ?',
      whereArgs: [travelId],
    );
    return maps.map((map) => PassengerEntity.fromMap(map)).toList();
  }

  Future<PassengerEntity?> getPassengerByNameAndTravel(String nama, int travelId) async {
    final db = await dbHelper.database;
    final result = await db.query(
      'penumpang',
      where: 'UPPER(nama) = ? AND id_travel = ?',
      whereArgs: [nama.toUpperCase(), travelId],
    );

    if (result.isNotEmpty) {
      return PassengerEntity.fromMap(result.first);
    } else {
      return null;
    }
  }

  Future<int> delete(int id) async {
    final db = await dbHelper.database;
    return await db.delete('penumpang', where: 'id = ?', whereArgs: [id]);
  }
}
