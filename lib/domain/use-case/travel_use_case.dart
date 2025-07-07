
import 'package:skill_test_mobile_developer/domain/entity/travel_entity.dart';
import 'package:skill_test_mobile_developer/domain/repository/travel_repository.dart';

class TravelUseCase {
  final TravelRepository _travelRepository;

  TravelUseCase(this._travelRepository);

  Future<List<TravelEntity>> getAvailableTravels() async {
    final allTravels = await _travelRepository.getAll();
    return allTravels.where((travel) => travel.kuota > 0).toList();
  }

  Future<int> addTravel(TravelEntity travel) {
    return _travelRepository.insert(travel);
  }

  Future<TravelEntity?> getTravelById(int id) {
    return _travelRepository.getById(id);
  }

  Future<int> updateTravel(TravelEntity travel) {
    return _travelRepository.update(travel);
  }

  Future<int> deleteTravel(int id) {
    return _travelRepository.delete(id);
  }
}
