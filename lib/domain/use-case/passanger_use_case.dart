// file: lib/domain/usecase/passenger_usecase.dart
import 'package:skill_test_mobile_developer/domain/entity/passanger_entity.dart';
import 'package:skill_test_mobile_developer/domain/repository/passanger_repository.dart';

class PassengerUseCase {
  final PassengerRepository _passengerRepository;

  PassengerUseCase(this._passengerRepository);

  Future<String> _generateBookingCode() async {
    final now = DateTime.now();
    final random = now.microsecondsSinceEpoch.remainder(1000000).toString().padLeft(6, '0');
    return 'BOOK$random';
  }

  Future<void> addPassenger(String rawInput, int travelId) async {
    final split = rawInput.trim().split(RegExp(r'\\s+'));
    if (split.length < 3) {
      throw Exception("Format input harus: NAMA USIA KOTA");
    }

    // Ambil usia dan hapus string tambahan
    final cleanedAge = split[split.length - 2].replaceAll(RegExp(r'(TAHUN|THN|TH)', caseSensitive: false), '');
    final usia = int.tryParse(cleanedAge) ?? (throw Exception("Usia tidak valid"));

    final currentYear = DateTime.now().year;
    final tahunLahir = currentYear - usia;

    final kota = split.sublist(split.length - 1).join(' ').toUpperCase();
    final nama = split.sublist(0, split.length - 2).join(' ').toUpperCase();

    final existing = await _passengerRepository.getPassengerByNameAndTravel(nama, travelId);
    if (existing != null) {
      throw Exception("Penumpang dengan nama yang sama sudah ada di travel ini.");
    }

    final bookingCode = await _generateBookingCode();

    final passenger = PassengerEntity(
      id: null,
      idTravel: travelId,
      kodeBooking: bookingCode,
      nama: nama,
      jenisKelamin: "", // Default kosong
      kota: kota,
      usia: usia,
      tahunLahir: tahunLahir,
      createdAt: DateTime.now(),
    );

    await _passengerRepository.insert(passenger);
  }

  Future<List<PassengerEntity>> getPassengersByTravel(int travelId) {
    return _passengerRepository.getByTravelId(travelId);
  }
}
