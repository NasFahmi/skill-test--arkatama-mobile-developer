class TravelEntity {
  final int? id;
  final String name;
  final String tanggalKeberangkatan;
  final int kuota;

  TravelEntity({
    this.id,
    required this.name,
    required this.tanggalKeberangkatan,
    required this.kuota,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'tanggal_keberangkatan': tanggalKeberangkatan,
      'kuota': kuota,
    };
  }

  factory TravelEntity.fromMap(Map<String, dynamic> map) {
    return TravelEntity(
      id: map['id'],
      name: map['name'],
      tanggalKeberangkatan: map['tanggal_keberangkatan'],
      kuota: map['kuota'],
    );
  }
}
