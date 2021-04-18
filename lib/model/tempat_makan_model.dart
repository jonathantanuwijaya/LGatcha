part of 'model.dart';

class TempatMakan extends Equatable{
  final String id;
  final String namaTempat;
  final String lokasi;

  @override
  // TODO: implement props
  List<Object> get props => [id,namaTempat,lokasi];

  const TempatMakan({
    @required this.id,
    @required this.namaTempat,
    @required this.lokasi,
  });

  TempatMakan copyWith({
    int id,
    String namaTempat,
    String lokasi,
  }) {
    if ((id == null || identical(id, this.id)) &&
        (namaTempat == null || identical(namaTempat, this.namaTempat)) &&
        (lokasi == null || identical(lokasi, this.lokasi))) {
      return this;
    }

    return new TempatMakan(
      id: id ?? this.id,
      namaTempat: namaTempat ?? this.namaTempat,
      lokasi: lokasi ?? this.lokasi,
    );
  }

  @override
  String toString() {
    return 'TempatMakan{id: $id, namaTempat: $namaTempat, lokasi: $lokasi}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TempatMakan &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          namaTempat == other.namaTempat &&
          lokasi == other.lokasi);

  @override
  int get hashCode => id.hashCode ^ namaTempat.hashCode ^ lokasi.hashCode;

  factory TempatMakan.fromMap(Map<String, dynamic> map) {
    return new TempatMakan(
      id: map['id'] as String,
      namaTempat: map['namaTempat'] as String,
      lokasi: map['lokasi'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'id': this.id,
      'namaTempat': this.namaTempat,
      'lokasi': this.lokasi,
    } as Map<String, dynamic>;
  }


}