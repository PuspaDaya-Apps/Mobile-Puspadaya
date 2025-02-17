import 'package:json_annotation/json_annotation.dart';
part 'get_all_jadwal_posyandu_model.g.dart';

@JsonSerializable()
class GetDataJadwalPosyandu {
  @JsonKey(name: "message")
  final String message;
  @JsonKey(name: "data")
  final List<Datum> data;

  GetDataJadwalPosyandu({
    required this.message,
    required this.data,
  });

  factory GetDataJadwalPosyandu.fromJson(Map<String, dynamic> json) =>
      _$GetDataJadwalPosyanduFromJson(json);

  Map<String, dynamic> toJson() => _$GetDataJadwalPosyanduToJson(this);
}

@JsonSerializable()
class Datum {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "nama_kegiatan")
  final String namaKegiatan;
  @JsonKey(name: "tanggal_pelaksanaan")
  final DateTime tanggalPelaksanaan;
  @JsonKey(name: "waktu_mulai")
  final String waktuMulai;
  @JsonKey(name: "waktu_selesai")
  final String waktuSelesai;
  @JsonKey(name: "lokasi")
  final String lokasi;
  @JsonKey(name: "posyandu")
  final Posyandu posyandu;

  Datum({
    required this.id,
    required this.namaKegiatan,
    required this.tanggalPelaksanaan,
    required this.waktuMulai,
    required this.waktuSelesai,
    required this.lokasi,
    required this.posyandu,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}

@JsonSerializable()
class Posyandu {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "nama_posyandu")
  final String namaPosyandu;

  Posyandu({
    required this.id,
    required this.namaPosyandu,
  });

  factory Posyandu.fromJson(Map<String, dynamic> json) =>
      _$PosyanduFromJson(json);

  Map<String, dynamic> toJson() => _$PosyanduToJson(this);
}
