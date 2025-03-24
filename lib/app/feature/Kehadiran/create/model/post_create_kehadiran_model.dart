import 'package:json_annotation/json_annotation.dart';
part 'post_create_kehadiran_model.g.dart';
@JsonSerializable()
class PostCreateKehadiranModel {
    @JsonKey(name: "tanggal_pelaksanaan")
    final String tanggalPelaksanaan;
    @JsonKey(name: "waktu_mulai")
    final String waktuMulai;
    @JsonKey(name: "waktu_selesai")
    final String waktuSelesai;
    @JsonKey(name: "durasi")
    final String durasi;
    @JsonKey(name: "status_kegiatan")
    final String statusKegiatan;
    @JsonKey(name: "kehadiran_anak")
    final List<String> kehadiranAnak;
    @JsonKey(name: "kehadiran_ibu_hamil")
    final List<String> kehadiranIbuHamil;
    @JsonKey(name: "kehadiran_tamu")
    final List<String> kehadiranTamu;

    PostCreateKehadiranModel({
        required this.tanggalPelaksanaan,
        required this.waktuMulai,
        required this.waktuSelesai,
        required this.durasi,
        required this.statusKegiatan,
        required this.kehadiranAnak,
        required this.kehadiranIbuHamil,
        required this.kehadiranTamu,
    });

    factory PostCreateKehadiranModel.fromJson(Map<String, dynamic> json) => _$PostCreateKehadiranModelFromJson(json);

    Map<String, dynamic> toJson() => _$PostCreateKehadiranModelToJson(this);
}
