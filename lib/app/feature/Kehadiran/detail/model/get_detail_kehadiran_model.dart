import 'package:json_annotation/json_annotation.dart';
part 'get_detail_kehadiran_model.g.dart';
@JsonSerializable()
class GetDetailKehadiranModel {
    @JsonKey(name: "message")
    final String message;
    @JsonKey(name: "data")
    final Data data;

    GetDetailKehadiranModel({
        required this.message,
        required this.data,
    });

    factory GetDetailKehadiranModel.fromJson(Map<String, dynamic> json) => _$GetDetailKehadiranModelFromJson(json);

    Map<String, dynamic> toJson() => _$GetDetailKehadiranModelToJson(this);
}

@JsonSerializable()
class Data {
    @JsonKey(name: "id")
    final String id;
    @JsonKey(name: "created_at")
    final DateTime createdAt;
    @JsonKey(name: "updated_at")
    final DateTime updatedAt;
    @JsonKey(name: "deleted_at")
    final dynamic deletedAt;
    @JsonKey(name: "tanggal_pelaksanaan")
    final DateTime tanggalPelaksanaan;
    @JsonKey(name: "waktu_mulai")
    final String waktuMulai;
    @JsonKey(name: "waktu_selesai")
    final String waktuSelesai;
    @JsonKey(name: "durasi")
    final String durasi;
    @JsonKey(name: "status_kegiatan")
    final String statusKegiatan;
    @JsonKey(name: "posyandu")
    final Posyandu posyandu;
    @JsonKey(name: "kehadiran_anak")
    final List<KehadiranAnak> kehadiranAnak;
    @JsonKey(name: "kehadiran_ibu_hamil")
    final List<KehadiranIbuHamil> kehadiranIbuHamil;
    @JsonKey(name: "kehadiran_tamu")
    final List<KehadiranTamu> kehadiranTamu;
    @JsonKey(name: "tidak_hadir")
    final TidakHadir tidakHadir;

    Data({
        required this.id,
        required this.createdAt,
        required this.updatedAt,
        required this.deletedAt,
        required this.tanggalPelaksanaan,
        required this.waktuMulai,
        required this.waktuSelesai,
        required this.durasi,
        required this.statusKegiatan,
        required this.posyandu,
        required this.kehadiranAnak,
        required this.kehadiranIbuHamil,
        required this.kehadiranTamu,
        required this.tidakHadir,
    });

    factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

    Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class KehadiranAnak {
    @JsonKey(name: "id")
    final String id;
    @JsonKey(name: "anak_id")
    final String anakId;
    @JsonKey(name: "nama_anak")
    final String namaAnak;
    @JsonKey(name: "nik")
    final String nik;
    @JsonKey(name: "nama_ibu")
    final String namaIbu;

    KehadiranAnak({
        required this.namaIbu,
        required this.id,
        required this.anakId,
        required this.namaAnak,
        required this.nik,
    });

    factory KehadiranAnak.fromJson(Map<String, dynamic> json) => _$KehadiranAnakFromJson(json);

    Map<String, dynamic> toJson() => _$KehadiranAnakToJson(this);
}

@JsonSerializable()
class KehadiranIbuHamil {
    @JsonKey(name: "id")
    final String id;
    @JsonKey(name: "ibu_hamil_id")
    final String ibuHamilId;
    @JsonKey(name: "nama_ibu_hamil")
    final String namaIbuHamil;
    @JsonKey(name: "nik")
    final String nik;

    KehadiranIbuHamil({
        required this.id,
        required this.ibuHamilId,
        required this.namaIbuHamil,
        required this.nik,
    });

    factory KehadiranIbuHamil.fromJson(Map<String, dynamic> json) => _$KehadiranIbuHamilFromJson(json);

    Map<String, dynamic> toJson() => _$KehadiranIbuHamilToJson(this);
}

@JsonSerializable()
class KehadiranTamu {
    @JsonKey(name: "id")
    final String id;
    @JsonKey(name: "anak_id")
    final String anakId;
    @JsonKey(name: "nama_anak")
    final String namaAnak;
    @JsonKey(name: "posyandu_asal")
    final String posyanduAsal;

    KehadiranTamu({
        required this.id,
        required this.anakId,
        required this.namaAnak,
        required this.posyanduAsal,
    });

    factory KehadiranTamu.fromJson(Map<String, dynamic> json) => _$KehadiranTamuFromJson(json);

    Map<String, dynamic> toJson() => _$KehadiranTamuToJson(this);
}

@JsonSerializable()
class Posyandu {
    @JsonKey(name: "id")
    final String id;
    @JsonKey(name: "created_at")
    final DateTime createdAt;
    @JsonKey(name: "updated_at")
    final DateTime updatedAt;
    @JsonKey(name: "deleted_at")
    final dynamic deletedAt;
    @JsonKey(name: "nama_posyandu")
    final String namaPosyandu;
    @JsonKey(name: "alamat")
    final dynamic alamat;

    Posyandu({
        required this.id,
        required this.createdAt,
        required this.updatedAt,
        required this.deletedAt,
        required this.namaPosyandu,
        required this.alamat,
    });

    factory Posyandu.fromJson(Map<String, dynamic> json) => _$PosyanduFromJson(json);

    Map<String, dynamic> toJson() => _$PosyanduToJson(this);
}

@JsonSerializable()
class TidakHadir {
    @JsonKey(name: "anak")
    final List<AnakTidakHadir> anak;
    @JsonKey(name: "ibu_hamil")
    final List<IbuHamilTidakHadir> ibuHamil;

    TidakHadir({
        required this.anak,
        required this.ibuHamil,
    });

    factory TidakHadir.fromJson(Map<String, dynamic> json) => _$TidakHadirFromJson(json);

    Map<String, dynamic> toJson() => _$TidakHadirToJson(this);
}

@JsonSerializable()
class AnakTidakHadir {
    @JsonKey(name: "id")
    final String id;
    @JsonKey(name: "nama_anak")
    final String namaAnak;
    @JsonKey(name: "nik")
    final String nik;
    @JsonKey(name: "nama_ibu")
    final String namaIbu;

    AnakTidakHadir({
        required this.id,
        required this.namaAnak,
        required this.nik,
        required this.namaIbu,
    });

    factory AnakTidakHadir.fromJson(Map<String, dynamic> json) => _$AnakTidakHadirFromJson(json);

    Map<String, dynamic> toJson() => _$AnakTidakHadirToJson(this);
}

@JsonSerializable()
class IbuHamilTidakHadir {
    @JsonKey(name: "id")
    final String id;
    @JsonKey(name: "nama_ibu_hamil")
    final String namaIbuHamil;
    @JsonKey(name: "nik")
    final String nik;

    IbuHamilTidakHadir({
        required this.id,
        required this.namaIbuHamil,
        required this.nik,
    });

    factory IbuHamilTidakHadir.fromJson(Map<String, dynamic> json) => _$IbuHamilTidakHadirFromJson(json);

    Map<String, dynamic> toJson() => _$IbuHamilTidakHadirToJson(this);
}
