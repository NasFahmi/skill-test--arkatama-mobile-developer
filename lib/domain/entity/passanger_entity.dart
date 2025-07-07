class PassengerEntity {
  final int? id;
  final int idTravel;
  final String kodeBooking;
  final String nama;
  final String jenisKelamin;
  final String kota;
  final int usia;
  final int tahunLahir;
  final DateTime createdAt;

  const PassengerEntity({
    this.id,
    required this.idTravel,
    required this.kodeBooking,
    required this.nama,
    required this.jenisKelamin,
    required this.kota,
    required this.usia,
    required this.tahunLahir,
    required this.createdAt,
  });

  factory PassengerEntity.fromMap(Map<String, dynamic> map) {
    return PassengerEntity(
      id: map['id'],
      idTravel: map['id_travel'],
      kodeBooking: map['kode_booking'],
      nama: map['nama'],
      jenisKelamin: map['jenis_kelamin'],
      kota: map['kota'],
      usia: map['usia'],
      tahunLahir: map['tahun_lahir'],
      createdAt: DateTime.parse(map['created_at']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'id_travel': idTravel,
      'kode_booking': kodeBooking,
      'nama': nama,
      'jenis_kelamin': jenisKelamin,
      'kota': kota,
      'usia': usia,
      'tahun_lahir': tahunLahir,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
