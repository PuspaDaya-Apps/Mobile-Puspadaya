import 'package:json_annotation/json_annotation.dart';
part 'get_detail_anak_response.g.dart';

@JsonSerializable()
class GetDetailAnakResponse {
  @JsonKey(name: "message")
  final String message;
  @JsonKey(name: "data")
  final Data data;

  GetDetailAnakResponse({
    required this.message,
    required this.data,
  });

  factory GetDetailAnakResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDetailAnakResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetDetailAnakResponseToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;
  @JsonKey(name: "deleted_at")
  final DateTime? deletedAt;
  @JsonKey(name: "nik")
  final String nik;
  @JsonKey(name: "nama_anak")
  final String namaAnak;
  @JsonKey(name: "tempat_lahir")
  final String tempatLahir;
  @JsonKey(name: "anak_ke")
  final int anakKe;
  @JsonKey(name: "tanggal_lahir")
  final DateTime tanggalLahir;
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
  @JsonKey(name: "jarak_posyandu")
  final String? jarakPosyandu;
  @JsonKey(name: "cara_lahir")
  final String caraLahir;
  @JsonKey(name: "status_kelahiran")
  final String? statusKelahiran;
  @JsonKey(name: "status_stunting")
  final String? statusStunting;
  @JsonKey(name: "status_gizi")
  final String? statusGizi;
  @JsonKey(name: "status_wasting")
  final String? statusWasting;
  @JsonKey(name: "status_orang_tua")
  final String statusOrangTua;
  @JsonKey(name: "disabilitasAnak", defaultValue: [])
  final List<DisabilitasAnak>? disabilitasAnak;
  @JsonKey(name: "kartu_keluarga")
  final KartuKeluarga kartuKeluarga;
  @JsonKey(name: "pengasuhAnak")
  final PengasuhAnak? pengasuhAnak;
  @JsonKey(name: "pengukuran", defaultValue: [])
  final List<Pengukuran>? pengukuran;
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
    required this.jarakPosyandu,
    required this.caraLahir,
    required this.statusKelahiran,
    required this.statusStunting,
    required this.statusGizi,
    required this.statusWasting,
    required this.statusOrangTua,
    required this.disabilitasAnak,
    required this.kartuKeluarga,
    required this.pengasuhAnak,
    required this.pengukuran,
    required this.posyandu,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class DisabilitasAnak {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;
  @JsonKey(name: "deleted_at")
  final DateTime? deletedAt;
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

@JsonSerializable()
class KartuKeluarga {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;
  @JsonKey(name: "deleted_at")
  final DateTime? deletedAt;
  @JsonKey(name: "nomor_kartu_keluarga")
  final String nomorKartuKeluarga;
  @JsonKey(name: "ibu")
  final Ibu? ibu;
  @JsonKey(name: "ayah")
  final Ayah? ayah;

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
//ibu
@JsonSerializable()
class Ibu {
    @JsonKey(name: "id")
    final String id;
    @JsonKey(name: "created_at")
    final DateTime? createdAt;
    @JsonKey(name: "updated_at")
    final DateTime? updatedAt;
    @JsonKey(name: "deleted_at")
    final DateTime? deletedAt;
    @JsonKey(name: "nik")
    final String nik;
    @JsonKey(name: "nama_ibu")
    final String namaIbu;
    @JsonKey(name: "tempat_lahir")
    final String tempatLahir;
    @JsonKey(name: "tanggal_lahir")
    final DateTime tanggalLahir;
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
    final DateTime tanggalMelahirkanSebelumnya;
    @JsonKey(name: "jumlah_anak")
    final int jumlahAnak;
    @JsonKey(name: "user_id")
    final String? userId;
    @JsonKey(name: "posyandu")
    final PosyanduIbu posyandu;
    @JsonKey(name: "jenis_disabilitas", defaultValue: [])
    final List<JenisDisabilitasIbu>? jenisDisabilitas;

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
        required this.jenisDisabilitas,
    });

    factory Ibu.fromJson(Map<String, dynamic> json) => _$IbuFromJson(json);

    Map<String, dynamic> toJson() => _$IbuToJson(this);
}

@JsonSerializable()
class JenisDisabilitasIbu {
    @JsonKey(name: "id")
    final String id;
    @JsonKey(name: "created_at")
    final DateTime? createdAt;
    @JsonKey(name: "updated_at")
    final DateTime? updatedAt;
    @JsonKey(name: "deleted_at")
    final DateTime? deletedAt;
    @JsonKey(name: "nama_disabilitas")
    final String namaDisabilitas;

    JenisDisabilitasIbu({
        required this.id,
        required this.createdAt,
        required this.updatedAt,
        required this.deletedAt,
        required this.namaDisabilitas,
    });

    factory JenisDisabilitasIbu.fromJson(Map<String, dynamic> json) => _$JenisDisabilitasIbuFromJson(json);

    Map<String, dynamic> toJson() => _$JenisDisabilitasIbuToJson(this);
}

@JsonSerializable()
class PosyanduIbu {
    @JsonKey(name: "id")
    final String id;
    @JsonKey(name: "created_at")
    final DateTime? createdAt;
    @JsonKey(name: "updated_at")
    final DateTime? updatedAt;
    @JsonKey(name: "deleted_at")
    final DateTime? deletedAt;
    @JsonKey(name: "nama_posyandu")
    final String namaPosyandu;
    @JsonKey(name: "alamat")
    final String? alamat;

    PosyanduIbu({
        required this.id,
        required this.createdAt,
        required this.updatedAt,
        required this.deletedAt,
        required this.namaPosyandu,
        required this.alamat,
    });

    factory PosyanduIbu.fromJson(Map<String, dynamic> json) => _$PosyanduIbuFromJson(json);

    Map<String, dynamic> toJson() => _$PosyanduIbuToJson(this);
}
// ayah
@JsonSerializable()
class Ayah {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;
  @JsonKey(name: "deleted_at")
  final DateTime? deletedAt;
  @JsonKey(name: "nik")
  final String nik;
  @JsonKey(name: "nama_ayah")
  final String namaAyah;
  @JsonKey(name: "tempat_lahir")
  final String tempatLahir;
  @JsonKey(name: "tanggal_lahir")
  final DateTime tanggalLahir;
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
  final String? userId;
  @JsonKey(name: "posyandu")
  final PosyanduAyah posyandu;
  @JsonKey(name: "jenis_disabilitas", defaultValue: [])
  final List<JenisDisabilitasAyah>? jenisDisabilitas;

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
    required this.jenisDisabilitas,
  });

  factory Ayah.fromJson(Map<String, dynamic> json) => _$AyahFromJson(json);

  Map<String, dynamic> toJson() => _$AyahToJson(this);
}

@JsonSerializable()
class JenisDisabilitasAyah {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;
  @JsonKey(name: "deleted_at")
  final DateTime? deletedAt;
  @JsonKey(name: "nama_disabilitas")
  final String namaDisabilitas;

  JenisDisabilitasAyah({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.namaDisabilitas,
  });

  factory JenisDisabilitasAyah.fromJson(Map<String, dynamic> json) =>
      _$JenisDisabilitasAyahFromJson(json);

  Map<String, dynamic> toJson() => _$JenisDisabilitasAyahToJson(this);
}

@JsonSerializable()
class PosyanduAyah {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;
  @JsonKey(name: "deleted_at")
  final DateTime? deletedAt;
  @JsonKey(name: "nama_posyandu")
  final String namaPosyandu;
  @JsonKey(name: "alamat")
  final String? alamat;

  PosyanduAyah({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.namaPosyandu,
    required this.alamat,
  });

  factory PosyanduAyah.fromJson(Map<String, dynamic> json) =>
      _$PosyanduAyahFromJson(json);

  Map<String, dynamic> toJson() => _$PosyanduAyahToJson(this);
}
// pengasuh
@JsonSerializable()
class PengasuhAnak {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;
  @JsonKey(name: "deleted_at")
  final DateTime? deletedAt;
  @JsonKey(name: "status_hubungan")
  final String statusHubungan;
  @JsonKey(name: "nik")
  final String nik;
  @JsonKey(name: "nama_pengasuh")
  final String namaPengasuh;
  @JsonKey(name: "tempat_lahir")
  final String tempatLahir;
  @JsonKey(name: "tanggal_lahir")
  final DateTime tanggalLahir;
  @JsonKey(name: "rt")
  final String rt;
  @JsonKey(name: "rw")
  final String rw;
  @JsonKey(name: "alamat_lengkap")
  final String alamatLengkap;
  @JsonKey(name: "gol_darah")
  final String golDarah;
  @JsonKey(name: "kartu_keluarga")
  final KartuKeluargaPengasuh kartuKeluarga;

  PengasuhAnak({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.statusHubungan,
    required this.nik,
    required this.namaPengasuh,
    required this.tempatLahir,
    required this.tanggalLahir,
    required this.rt,
    required this.rw,
    required this.alamatLengkap,
    required this.golDarah,
    required this.kartuKeluarga,
  });

  factory PengasuhAnak.fromJson(Map<String, dynamic> json) =>
      _$PengasuhAnakFromJson(json);

  Map<String, dynamic> toJson() => _$PengasuhAnakToJson(this);
}

@JsonSerializable()
class KartuKeluargaPengasuh {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;
  @JsonKey(name: "deleted_at")
  final DateTime? deletedAt;
  @JsonKey(name: "nomor_kartu_keluarga")
  final String nomorKartuKeluarga;

  KartuKeluargaPengasuh({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.nomorKartuKeluarga,
  });

  factory KartuKeluargaPengasuh.fromJson(Map<String, dynamic> json) =>
      _$KartuKeluargaPengasuhFromJson(json);

  Map<String, dynamic> toJson() => _$KartuKeluargaPengasuhToJson(this);
}
// pengukuran
@JsonSerializable()
class Pengukuran {
  @JsonKey(name: "tanggal_pengukuran")
  final DateTime tanggalPengukuran;
  @JsonKey(name: "berat_badan")
  final String? beratBadan;
  @JsonKey(name: "tinggi_badan")
  final String? tinggiBadan;
  @JsonKey(name: "lingkar_lengan_atas")
  final String? lingkarLenganAtas;
  @JsonKey(name: "lingkar_kepala")
  final String? lingkarKepala;
  @JsonKey(name: "nama_kader")
  final String namaKader;
  @JsonKey(name: "status_stunting")
  final String? statusStunting;
  @JsonKey(name: "status_gizi")
  final String? statusGizi;

  Pengukuran({
    required this.tanggalPengukuran,
    required this.beratBadan,
    required this.tinggiBadan,
    required this.lingkarLenganAtas,
    required this.lingkarKepala,
    required this.namaKader,
    required this.statusStunting,
    required this.statusGizi,
  });

  factory Pengukuran.fromJson(Map<String, dynamic> json) =>
      _$PengukuranFromJson(json);

  Map<String, dynamic> toJson() => _$PengukuranToJson(this);
}
// posyandu
@JsonSerializable()
class Posyandu {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;
  @JsonKey(name: "deleted_at")
  final DateTime? deletedAt;
  @JsonKey(name: "nama_posyandu")
  final String namaPosyandu;
  @JsonKey(name: "alamat")
  final String? alamat;

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
