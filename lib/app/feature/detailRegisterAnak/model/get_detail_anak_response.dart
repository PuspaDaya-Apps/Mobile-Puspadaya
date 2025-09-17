import 'package:json_annotation/json_annotation.dart';
// part 'get_detail_anak_response.g.dart';

// @JsonSerializable()
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

// @JsonSerializable()
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
  final String tanggalLahir;
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

  @JsonKey(name: "pindah")
  bool anakPindah = false;
  @JsonKey(name: "meninggal")
  bool anakMeninggal= false;

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
    required this.anakPindah,
    required this.anakMeninggal
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

// @JsonSerializable()
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

// @JsonSerializable()
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
// @JsonSerializable()
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
    final String? nomorTelepon;
    @JsonKey(name: "gol_darah")
    final String golDarah;
    @JsonKey(name: "jenis_kb")
    final String jenisKb;
    @JsonKey(name: "tanggal_melahirkan_sebelumnya")
    final DateTime? tanggalMelahirkanSebelumnya;
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

// @JsonSerializable()
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

// @JsonSerializable()
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
// @JsonSerializable()
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
  final String? nomorTelepon;
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

// @JsonSerializable()
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

// @JsonSerializable()
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
// @JsonSerializable()
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

// @JsonSerializable()
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
// @JsonSerializable()
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
  final String? namaKader;
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
// @JsonSerializable()
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

GetDetailAnakResponse _$GetDetailAnakResponseFromJson(
        Map<String, dynamic> json) =>
    GetDetailAnakResponse(
      message: json['message'] as String,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetDetailAnakResponseToJson(
        GetDetailAnakResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as String,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
      nik: json['nik'] as String,
      namaAnak: json['nama_anak'] as String,
      tempatLahir: json['tempat_lahir'] as String,
      anakKe: (json['anak_ke'] as num).toInt(),
      tanggalLahir: json['tanggal_lahir'] as String,
      jenisKelamin: json['jenis_kelamin'] as String,
      beratBadanLahir: json['berat_badan_lahir'] as String,
      tinggiBadanLahir: json['tinggi_badan_lahir'] as String,
      lingkarLenganAtasLahir: json['lingkar_lengan_atas_lahir'] as String,
      lingkarKepalaLahir: json['lingkar_kepala_lahir'] as String,
      jarakPosyandu: json['jarak_posyandu'] as String?,
      caraLahir: json['cara_lahir'] as String,
      statusKelahiran: json['status_kelahiran'] as String?,
      statusStunting: json['status_stunting'] as String?,
      statusGizi: json['status_gizi'] as String?,
      statusWasting: json['status_wasting'] as String?,
      statusOrangTua: json['status_orang_tua'] as String,
      disabilitasAnak: (json['disabilitasAnak'] as List<dynamic>?)
              ?.map((e) => DisabilitasAnak.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      kartuKeluarga: KartuKeluarga.fromJson(
          json['kartu_keluarga'] as Map<String, dynamic>),
      pengasuhAnak: json['pengasuhAnak'] == null
          ? null
          : PengasuhAnak.fromJson(json['pengasuhAnak'] as Map<String, dynamic>),
      pengukuran: (json['pengukuran'] as List<dynamic>?)
              ?.map((e) => Pengukuran.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      posyandu: Posyandu.fromJson(json['posyandu'] as Map<String, dynamic>),
      anakPindah: json['pindah'] != null
      ? json['pindah'] as bool
      : false,
      anakMeninggal: json['meninggal'] != null
      ? json['meninggal'] as bool
      : false,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'nik': instance.nik,
      'nama_anak': instance.namaAnak,
      'tempat_lahir': instance.tempatLahir,
      'anak_ke': instance.anakKe,
      'tanggal_lahir': instance.tanggalLahir,
      'jenis_kelamin': instance.jenisKelamin,
      'berat_badan_lahir': instance.beratBadanLahir,
      'tinggi_badan_lahir': instance.tinggiBadanLahir,
      'lingkar_lengan_atas_lahir': instance.lingkarLenganAtasLahir,
      'lingkar_kepala_lahir': instance.lingkarKepalaLahir,
      'jarak_posyandu': instance.jarakPosyandu,
      'cara_lahir': instance.caraLahir,
      'status_kelahiran': instance.statusKelahiran,
      'status_stunting': instance.statusStunting,
      'status_gizi': instance.statusGizi,
      'status_wasting': instance.statusWasting,
      'status_orang_tua': instance.statusOrangTua,
      'disabilitasAnak': instance.disabilitasAnak,
      'kartu_keluarga': instance.kartuKeluarga,
      'pengasuhAnak': instance.pengasuhAnak,
      'pengukuran': instance.pengukuran,
      'posyandu': instance.posyandu,
    };

DisabilitasAnak _$DisabilitasAnakFromJson(Map<String, dynamic> json) =>
    DisabilitasAnak(
      id: json['id'] as String,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
      namaDisabilitas: json['nama_disabilitas'] as String,
    );

Map<String, dynamic> _$DisabilitasAnakToJson(DisabilitasAnak instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'nama_disabilitas': instance.namaDisabilitas,
    };

KartuKeluarga _$KartuKeluargaFromJson(Map<String, dynamic> json) =>
    KartuKeluarga(
      id: json['id'] as String,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
      nomorKartuKeluarga: json['nomor_kartu_keluarga'] as String,
      ibu: json['ibu'] == null
          ? null
          : Ibu.fromJson(json['ibu'] as Map<String, dynamic>),
      ayah: json['ayah'] == null
          ? null
          : Ayah.fromJson(json['ayah'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$KartuKeluargaToJson(KartuKeluarga instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'nomor_kartu_keluarga': instance.nomorKartuKeluarga,
      'ibu': instance.ibu,
      'ayah': instance.ayah,
    };

Ibu _$IbuFromJson(Map<String, dynamic> json) => Ibu(
      id: json['id'] as String,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
      nik: json['nik'] as String,
      namaIbu: json['nama_ibu'] as String,
      tempatLahir: json['tempat_lahir'] as String,
      tanggalLahir: DateTime.parse(json['tanggal_lahir'] as String),
      rt: json['rt'] as String,
      rw: json['rw'] as String,
      alamat: json['alamat'] as String,
      nomorTelepon: json['nomor_telepon'] as String?,
      golDarah: json['gol_darah'] as String,
      jenisKb: json['jenis_kb'] as String,
      tanggalMelahirkanSebelumnya: json['tanggal_melahirkan_sebelumnya'] == null
          ? null
          : DateTime.parse(json['tanggal_melahirkan_sebelumnya'] as String),
      jumlahAnak: (json['jumlah_anak'] as num).toInt(),
      userId: json['user_id'] as String?,
      posyandu: PosyanduIbu.fromJson(json['posyandu'] as Map<String, dynamic>),
      jenisDisabilitas: (json['jenis_disabilitas'] as List<dynamic>?)
              ?.map((e) =>
                  JenisDisabilitasIbu.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$IbuToJson(Ibu instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'nik': instance.nik,
      'nama_ibu': instance.namaIbu,
      'tempat_lahir': instance.tempatLahir,
      'tanggal_lahir': instance.tanggalLahir.toIso8601String(),
      'rt': instance.rt,
      'rw': instance.rw,
      'alamat': instance.alamat,
      'nomor_telepon': instance.nomorTelepon,
      'gol_darah': instance.golDarah,
      'jenis_kb': instance.jenisKb,
      'tanggal_melahirkan_sebelumnya':
          instance.tanggalMelahirkanSebelumnya?.toIso8601String(),
      'jumlah_anak': instance.jumlahAnak,
      'user_id': instance.userId,
      'posyandu': instance.posyandu,
      'jenis_disabilitas': instance.jenisDisabilitas,
    };

JenisDisabilitasIbu _$JenisDisabilitasIbuFromJson(Map<String, dynamic> json) =>
    JenisDisabilitasIbu(
      id: json['id'] as String,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
      namaDisabilitas: json['nama_disabilitas'] as String,
    );

Map<String, dynamic> _$JenisDisabilitasIbuToJson(
        JenisDisabilitasIbu instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'nama_disabilitas': instance.namaDisabilitas,
    };

PosyanduIbu _$PosyanduIbuFromJson(Map<String, dynamic> json) => PosyanduIbu(
      id: json['id'] as String,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
      namaPosyandu: json['nama_posyandu'] as String,
      alamat: json['alamat'] as String?,
    );

Map<String, dynamic> _$PosyanduIbuToJson(PosyanduIbu instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'nama_posyandu': instance.namaPosyandu,
      'alamat': instance.alamat,
    };

Ayah _$AyahFromJson(Map<String, dynamic> json) => Ayah(
      id: json['id'] as String,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
      nik: json['nik'] as String,
      namaAyah: json['nama_ayah'] as String,
      tempatLahir: json['tempat_lahir'] as String,
      tanggalLahir: DateTime.parse(json['tanggal_lahir'] as String),
      nomorTelepon: json['nomor_telepon'] as String?,
      rt: json['rt'] as String,
      rw: json['rw'] as String,
      alamat: json['alamat'] as String,
      golDarah: json['gol_darah'] as String,
      userId: json['user_id'] as String?,
      posyandu: PosyanduAyah.fromJson(json['posyandu'] as Map<String, dynamic>),
      jenisDisabilitas: (json['jenis_disabilitas'] as List<dynamic>?)
              ?.map((e) =>
                  JenisDisabilitasAyah.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$AyahToJson(Ayah instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'nik': instance.nik,
      'nama_ayah': instance.namaAyah,
      'tempat_lahir': instance.tempatLahir,
      'tanggal_lahir': instance.tanggalLahir.toIso8601String(),
      'nomor_telepon': instance.nomorTelepon,
      'rt': instance.rt,
      'rw': instance.rw,
      'alamat': instance.alamat,
      'gol_darah': instance.golDarah,
      'user_id': instance.userId,
      'posyandu': instance.posyandu,
      'jenis_disabilitas': instance.jenisDisabilitas,
    };

JenisDisabilitasAyah _$JenisDisabilitasAyahFromJson(
        Map<String, dynamic> json) =>
    JenisDisabilitasAyah(
      id: json['id'] as String,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
      namaDisabilitas: json['nama_disabilitas'] as String,
    );

Map<String, dynamic> _$JenisDisabilitasAyahToJson(
        JenisDisabilitasAyah instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'nama_disabilitas': instance.namaDisabilitas,
    };

PosyanduAyah _$PosyanduAyahFromJson(Map<String, dynamic> json) => PosyanduAyah(
      id: json['id'] as String,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
      namaPosyandu: json['nama_posyandu'] as String,
      alamat: json['alamat'] as String?,
    );

Map<String, dynamic> _$PosyanduAyahToJson(PosyanduAyah instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'nama_posyandu': instance.namaPosyandu,
      'alamat': instance.alamat,
    };

PengasuhAnak _$PengasuhAnakFromJson(Map<String, dynamic> json) => PengasuhAnak(
      id: json['id'] as String,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
      statusHubungan: json['status_hubungan'] as String,
      nik: json['nik'] as String,
      namaPengasuh: json['nama_pengasuh'] as String,
      tempatLahir: json['tempat_lahir'] as String,
      tanggalLahir: DateTime.parse(json['tanggal_lahir'] as String),
      rt: json['rt'] as String,
      rw: json['rw'] as String,
      alamatLengkap: json['alamat_lengkap'] as String,
      golDarah: json['gol_darah'] as String,
      kartuKeluarga: KartuKeluargaPengasuh.fromJson(
          json['kartu_keluarga'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PengasuhAnakToJson(PengasuhAnak instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'status_hubungan': instance.statusHubungan,
      'nik': instance.nik,
      'nama_pengasuh': instance.namaPengasuh,
      'tempat_lahir': instance.tempatLahir,
      'tanggal_lahir': instance.tanggalLahir.toIso8601String(),
      'rt': instance.rt,
      'rw': instance.rw,
      'alamat_lengkap': instance.alamatLengkap,
      'gol_darah': instance.golDarah,
      'kartu_keluarga': instance.kartuKeluarga,
    };

KartuKeluargaPengasuh _$KartuKeluargaPengasuhFromJson(
        Map<String, dynamic> json) =>
    KartuKeluargaPengasuh(
      id: json['id'] as String,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
      nomorKartuKeluarga: json['nomor_kartu_keluarga'] as String,
    );

Map<String, dynamic> _$KartuKeluargaPengasuhToJson(
        KartuKeluargaPengasuh instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'nomor_kartu_keluarga': instance.nomorKartuKeluarga,
    };

Pengukuran _$PengukuranFromJson(Map<String, dynamic> json) => Pengukuran(
      tanggalPengukuran: DateTime.parse(json['tanggal_pengukuran'] as String),
      beratBadan: json['berat_badan'] as String?,
      tinggiBadan: json['tinggi_badan'] as String?,
      lingkarLenganAtas: json['lingkar_lengan_atas'] as String?,
      lingkarKepala: json['lingkar_kepala'] as String?,
      namaKader: json['nama_kader'] as String?,
      statusStunting: json['status_stunting'] as String?,
      statusGizi: json['status_gizi'] as String?,
    );

Map<String, dynamic> _$PengukuranToJson(Pengukuran instance) =>
    <String, dynamic>{
      'tanggal_pengukuran': instance.tanggalPengukuran.toIso8601String(),
      'berat_badan': instance.beratBadan,
      'tinggi_badan': instance.tinggiBadan,
      'lingkar_lengan_atas': instance.lingkarLenganAtas,
      'lingkar_kepala': instance.lingkarKepala,
      'nama_kader': instance.namaKader,
      'status_stunting': instance.statusStunting,
      'status_gizi': instance.statusGizi,
    };

Posyandu _$PosyanduFromJson(Map<String, dynamic> json) => Posyandu(
      id: json['id'] as String,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
      namaPosyandu: json['nama_posyandu'] as String,
      alamat: json['alamat'] as String?,
    );

Map<String, dynamic> _$PosyanduToJson(Posyandu instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'nama_posyandu': instance.namaPosyandu,
      'alamat': instance.alamat,
    };
