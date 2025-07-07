import 'package:get_it/get_it.dart';
import 'package:skill_test_mobile_developer/config/db/db.dart';
import 'package:skill_test_mobile_developer/domain/repository/passanger_repository.dart';
import 'package:skill_test_mobile_developer/domain/repository/travel_repository.dart';
import 'package:skill_test_mobile_developer/domain/use-case/passanger_use_case.dart';
import 'package:skill_test_mobile_developer/domain/use-case/travel_use_case.dart';

final di = GetIt.instance;

Future<void> init() async {
  // 1. Register DBHelper secara async
  di.registerSingletonAsync<DBHelper>(() async {
    final dbHelper = DBHelper.instance;
    await dbHelper.database; // memastikan DB sudah ready
    return dbHelper;
  });

  // 2. Register repository yang bergantung pada DBHelper
  di.registerLazySingletonAsync<TravelRepository>(() async {
    final dbHelper = await di.getAsync<DBHelper>();
    return TravelRepository(dbHelper);
  });

  di.registerLazySingletonAsync<PassengerRepository>(() async {
    final dbHelper = await di.getAsync<DBHelper>();
    return PassengerRepository(dbHelper);
  });

    // 3. Register UseCases
  di.registerLazySingletonAsync<TravelUseCase>(() async {
    final repo = await di.getAsync<TravelRepository>();
    return TravelUseCase(repo);
  });

  di.registerLazySingletonAsync<PassengerUseCase>(() async {
    final repo = await di.getAsync<PassengerRepository>();
    return PassengerUseCase(repo);
  });


  // 3. Tunggu semua dependency async selesai sebelum app berjalan
  await di.allReady();
}
