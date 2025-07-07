// file: lib/domain/usecase/passenger_usecase.dart
import 'package:skill_test_mobile_developer/domain/entity/passanger_entity.dart';
import 'package:skill_test_mobile_developer/domain/repository/passanger_repository.dart';

class PassengerUseCase {
  final PassengerRepository _passengerRepository;

  PassengerUseCase(this._passengerRepository);

  Future<String> _generateBookingCode() async {
    final now = DateTime.now();
    final random = now.microsecondsSinceEpoch
        .remainder(1000000)
        .toString()
        .padLeft(6, '0');
    return 'BOOK$random';
  }

  Future<void> addPassenger({
    required String inputText,
    required int travelId,
    required String pickupLocation,
    required String phoneNumber,
  }) async {
    final now = DateTime.now();
    final parts = inputText.trim().split(RegExp(r'\s+'));

    // Validasi jumlah kata minimal 3
    if (parts.length < 3) throw Exception("Format input tidak sesuai.");

    // Ambil Usia
    final usiaIndex = parts.indexWhere(
      (word) =>
          RegExp(r'^\d+(TAHUN|THN|TH)?$', caseSensitive: false).hasMatch(word),
    );

    if (usiaIndex == -1) throw Exception("Tidak ditemukan usia yang valid.");

    // Nama = sebelum usia, Kota = setelah usia
    final nama = parts.sublist(0, usiaIndex).join(' ').toUpperCase();
    final kota = parts.sublist(usiaIndex + 1).join(' ').toUpperCase();

    final usiaRaw = parts[usiaIndex].replaceAll(
      RegExp(r'[^\d]'),
      '',
    ); // hilangkan "TAHUN", "TH", dsb
    final usia = int.tryParse(usiaRaw) ?? (throw Exception("Usia tidak valid"));

    final tahunLahir = now.year - usia;

    final kodeBooking = await _generateBookingCode();

    final passenger = PassengerEntity(
      idTravel: travelId,
      kodeBooking: kodeBooking,
      nama: nama,
      jenisKelamin: "-", // default
      kota: kota,
      usia: usia,
      tahunLahir: tahunLahir,
      createdAt: now,
    );

    await _passengerRepository.insert(passenger);
  }


  Future<List<PassengerEntity>> getPassengersByTravel(int travelId) {
    return _passengerRepository.getByTravelId(travelId);
  }
}
