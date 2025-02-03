import 'package:json_annotation/json_annotation.dart';
part 'get_detail_anak_by_id_response.g.dart';

@JsonSerializable()
class GetDetailAnakByIdResponse {
  @JsonKey(name: "message")
  final String message;
  @JsonKey(name: "data")
  final Data data;

  GetDetailAnakByIdResponse({
    required this.message,
    required this.data,
  });

  factory GetDetailAnakByIdResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDetailAnakByIdResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetDetailAnakByIdResponseToJson(this);
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

  @JsonKey(name: "nik")
  final String nik;

  @JsonKey(name: "nama_anak")
  final String namaAnak;

  @JsonKey(name: "tempat_lahir")
  final String tempatLahir;

  @JsonKey(name: "anak_ke")
  final int anakKe;

  @JsonKey(name: "tanggal_lahir")
  final String tanggalLahir; // Keep as String if you want to parse it later

  @JsonKey(name: "jenis_kelamin")
  final String jenisKelamin;

  @JsonKey(name: "berat_badan_lahir")
  final String beratBadanLahir;

  @JsonKey(name: "tinggi_badan_lahir")
  final String tinggiBadanLahir;

  @JsonKey(name: "lingkar_lengan_atas_lahir")
  final String lingkarLenganAtasLahir;

  @JsonKey(name: "lingkar_kepala_lahir")
  final String lingkarKepalaLahir;

  @JsonKey(name: "cara_lahir")
  final String caraLahir;

  @JsonKey(name: "status_kelahiran")
  final String statusKelahiran;

  @JsonKey(name: "status_stunting")
  final dynamic statusStunting;

  @JsonKey(name: "status_gizi")
  final dynamic statusGizi;

  @JsonKey(name: "status_wasting")
  final dynamic statusWasting;

  @JsonKey(name: "status_orang_tua")
  final String statusOrangTua;

  @JsonKey(name: "disabilitasAnak")
  final List<DisabilitasAnak> disabilitasAnak;

  @JsonKey(name: "kartu_keluarga")
  final KartuKeluarga kartuKeluarga;

  @JsonKey(name: "pengasuhAnak")
  final dynamic pengasuhAnak;

  @JsonKey(name: "posyandu")
  final Posyandu posyandu;

  Data({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.nik,
    required this.namaAnak,
    required this.tempatLahir,
    required this.anakKe,
    required this.tanggalLahir,
    required this.jenisKelamin,
    required this.beratBadanLahir,
    required this.tinggiBadanLahir,
    required this.lingkarLenganAtasLahir,
    required this.lingkarKepalaLahir,
    required this.caraLahir,
    required this.statusKelahiran,
    required this.statusStunting,
    required this.statusGizi,
    required this.statusWasting,
    required this.statusOrangTua,
    required this.disabilitasAnak,
    required this.kartuKeluarga,
    required this.pengasuhAnak,
    required this.posyandu,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class KartuKeluarga {
  @JsonKey(name: "id")
  final String id;

  @JsonKey(name: "created_at")
  final String createdAt;

  @JsonKey(name: "updated_at")
  final String updatedAt;

  @JsonKey(name: "deleted_at")
  final dynamic deletedAt;

  @JsonKey(name: "nomor_kartu_keluarga")
  final String nomorKartuKeluarga;

  @JsonKey(name: "ibu")
  final Ibu ibu;

  @JsonKey(name: "ayah")
  final Ayah ayah;

  KartuKeluarga({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.nomorKartuKeluarga,
    required this.ibu,
    required this.ayah,
  });

  factory KartuKeluarga.fromJson(Map<String, dynamic> json) =>
      _$KartuKeluargaFromJson(json);

  Map<String, dynamic> toJson() => _$KartuKeluargaToJson(this);
}

@JsonSerializable()
class Ibu {
  @JsonKey(name: "id")
  final String id;

  @JsonKey(name: "created_at")
  final DateTime createdAt;

  @JsonKey(name: "updated_at")
  final DateTime updatedAt;

  @JsonKey(name: "deleted_at")
  final dynamic deletedAt;

  @JsonKey(name: "nik")
  final String nik;

  @JsonKey(name: "nama_ibu")
  final String namaIbu;

  @JsonKey(name: "tempat_lahir")
  final String tempatLahir;

  @JsonKey(name: "tanggal_lahir")
  final String tanggalLahir; // Keep as String if you want to parse it later

  @JsonKey(name: "rt")
  final String rt;

  @JsonKey(name: "rw")
  final String rw;

  @JsonKey(name: "alamat")
  final String alamat;

  @JsonKey(name: "nomor_telepon")
  final String nomorTelepon;

  @JsonKey(name: "gol_darah")
  final String golDarah;

  @JsonKey(name: "jenis_kb")
  final String jenisKb;

  @JsonKey(name: "tanggal_melahirkan_sebelumnya")
  final String tanggalMelahirkanSebelumnya;

  @JsonKey(name: "jumlah_anak")
  final int jumlahAnak;

  @JsonKey(name: "user_id")
  final dynamic userId;

  @JsonKey(name: "posyandu")
  final Posyandu posyandu;

  @JsonKey(name: "kartu_keluarga")
  final KartuKeluarga kartuKeluarga;

  @JsonKey(name: "jenis_disabilitas")
  final List<dynamic>? jenisDisabilitas;

  Ibu({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.nik,
    required this.namaIbu,
    required this.tempatLahir,
    required this.tanggalLahir,
    required this.rt,
    required this.rw,
    required this.alamat,
    required this.nomorTelepon,
    required this.golDarah,
    required this.jenisKb,
    required this.tanggalMelahirkanSebelumnya,
    required this.jumlahAnak,
    required this.userId,
    required this.posyandu,
    required this.kartuKeluarga,
    required this.jenisDisabilitas,
  });

  factory Ibu.fromJson(Map<String, dynamic> json) => _$IbuFromJson(json);

  Map<String, dynamic> toJson() => _$IbuToJson(this);
}

@JsonSerializable()
class Ayah {
  @JsonKey(name: "id")
  final String id;

  @JsonKey(name: "created_at")
  final DateTime createdAt;

  @JsonKey(name: "updated_at")
  final DateTime updatedAt;

  @JsonKey(name: "deleted_at")
  final dynamic deletedAt;

  @JsonKey(name: "nik")
  final String nik;

  @JsonKey(name: "nama_ayah")
  final String namaAyah;

  @JsonKey(name: "tempat_lahir")
  final String tempatLahir;

  @JsonKey(name: "tanggal_lahir")
  final String tanggalLahir; // Keep as String if you want to parse it later

  @JsonKey(name: "nomor_telepon")
  final String nomorTelepon;

  @JsonKey(name: "rt")
  final String rt;

  @JsonKey(name: "rw")
  final String rw;

  @JsonKey(name: "alamat")
  final String alamat;

  @JsonKey(name: "gol_darah")
  final String golDarah;

  @JsonKey(name: "user_id")
  final dynamic userId;

  @JsonKey(name: "posyandu")
  final Posyandu posyandu;

  @JsonKey(name: "kartu_keluarga")
  final KartuKeluargaOrangTua kartuKeluarga;

  @JsonKey(name: "jenis_disabilitas")
  final List<dynamic>? jenisDisabilitas;

  Ayah({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.nik,
    required this.namaAyah,
    required this.tempatLahir,
    required this.tanggalLahir,
    required this.nomorTelepon,
    required this.rt,
    required this.rw,
    required this.alamat,
    required this.golDarah,
    required this.userId,
    required this.posyandu,
    required this.kartuKeluarga,
    required this.jenisDisabilitas,
  });

  factory Ayah.fromJson(Map<String, dynamic> json) => _$AyahFromJson(json);

  Map<String, dynamic> toJson() => _$AyahToJson(this);
}

@JsonSerializable()
class KartuKeluargaOrangTua {
  @JsonKey(name: "id")
  final String id;

  @JsonKey(name: "created_at")
  final DateTime createdAt;

  @JsonKey(name: "updated_at")
  final DateTime updatedAt;

  @JsonKey(name: "deleted_at")
  final dynamic deletedAt; // Mark as nullable if it can be null

  @JsonKey(name: "nomor_kartu_keluarga")
  final String nomorKartuKeluarga;

  KartuKeluargaOrangTua({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt, // Make this optional
    required this.nomorKartuKeluarga,
  });

  KartuKeluargaOrangTua copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic deletedAt, // Change to DateTime?
    String? nomorKartuKeluarga,
  }) =>
      KartuKeluargaOrangTua(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
        nomorKartuKeluarga: nomorKartuKeluarga ?? this.nomorKartuKeluarga,
      );

  factory KartuKeluargaOrangTua.fromJson(Map<String, dynamic> json) =>
      _$KartuKeluargaOrangTuaFromJson(json); // Corrected factory method name

  Map<String, dynamic> toJson() =>
      _$KartuKeluargaOrangTuaToJson(this); // Corrected method name
}

// disabilitas
@JsonSerializable()
class JenisDisabilitas {
  @JsonKey(name: "id")
  final String id;

  @JsonKey(name: "created_at")
  final DateTime createdAt;

  @JsonKey(name: "updated_at")
  final DateTime updatedAt;

  @JsonKey(name: "deleted_at")
  final dynamic deletedAt;

  @JsonKey(name: "nama_disabilitas")
  final String namaDisabilitas;

  JenisDisabilitas({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.namaDisabilitas,
  });

  factory JenisDisabilitas.fromJson(Map<String, dynamic> json) =>
      _$JenisDisabilitasFromJson(json);

  Map<String, dynamic> toJson() => _$JenisDisabilitasToJson(this);
}

@JsonSerializable()
class DisabilitasAnak {
  @JsonKey(name: "id")
  final String id;

  @JsonKey(name: "created_at")
  final DateTime createdAt;

  @JsonKey(name: "updated_at")
  final DateTime updatedAt;

  @JsonKey(name: "deleted_at")
  final dynamic deletedAt;

  @JsonKey(name: "nama_disabilitas")
  final String namaDisabilitas;

  DisabilitasAnak({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.namaDisabilitas,
  });

  factory DisabilitasAnak.fromJson(Map<String, dynamic> json) =>
      _$DisabilitasAnakFromJson(json);

  Map<String, dynamic> toJson() => _$DisabilitasAnakToJson(this);
}

// posyandu
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

  factory Posyandu.fromJson(Map<String, dynamic> json) =>
      _$PosyanduFromJson(json);

  Map<String, dynamic> toJson() => _$PosyanduToJson(this);
}
