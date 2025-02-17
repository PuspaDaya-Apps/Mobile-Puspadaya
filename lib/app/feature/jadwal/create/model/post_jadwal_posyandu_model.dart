import 'package:json_annotation/json_annotation.dart';
part 'post_jadwal_posyandu_model.g.dart';

@JsonSerializable()
class PostJadwalPosyanduModel {
  @JsonKey(name: "tanggal_pelaksanaan")
  final DateTime tanggalPelaksanaan;
  @JsonKey(name: "waktu_mulai")
  final String waktuMulai;
  @JsonKey(name: "waktu_selesai")
  final String waktuSelesai;
  @JsonKey(name: "lokasi")
  final String lokasi;
  @JsonKey(name: "nama_kegiatan")
  final String namaKegiatan;

  PostJadwalPosyanduModel({
    required this.tanggalPelaksanaan,
    required this.waktuMulai,
    required this.waktuSelesai,
    required this.lokasi,
    required this.namaKegiatan,
  });

  factory PostJadwalPosyanduModel.fromJson(Map<String, dynamic> json) =>
      _$PostJadwalPosyanduModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostJadwalPosyanduModelToJson(this);
}
