import 'package:json_annotation/json_annotation.dart';
part 'get_detail_jadwal_posyandu_model.g.dart';

@JsonSerializable()
class GetDetailJadwalPosyanduModel {
  @JsonKey(name: "message")
  final String message;
  @JsonKey(name: "data")
  final Data data;

  GetDetailJadwalPosyanduModel({
    required this.message,
    required this.data,
  });

  factory GetDetailJadwalPosyanduModel.fromJson(Map<String, dynamic> json) =>
      _$GetDetailJadwalPosyanduModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetDetailJadwalPosyanduModelToJson(this);
}

@JsonSerializable()
class Data {
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

  Data({
    required this.id,
    required this.namaKegiatan,
    required this.tanggalPelaksanaan,
    required this.waktuMulai,
    required this.waktuSelesai,
    required this.lokasi,
    required this.posyandu,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
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
