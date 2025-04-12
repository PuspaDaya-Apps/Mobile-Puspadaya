import 'package:json_annotation/json_annotation.dart';
// part 'get_detail_anak_by_id_response.g.dart';

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

  @JsonKey(name: "nomor_kartu_keluarga")
  final String nomorKartuKeluarga;

  @JsonKey(name: "ibu")
  final Ibu ibu;

  @JsonKey(name: "ayah")
  final Ayah ayah;

  KartuKeluarga({
    required this.id,
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
  final String? tanggalMelahirkanSebelumnya;

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
    this.tanggalMelahirkanSebelumnya,
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

  @JsonKey(name: "nomor_kartu_keluarga")
  final String nomorKartuKeluarga;

  KartuKeluargaOrangTua({
    required this.id,
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

  @JsonKey(name: "nama_disabilitas")
  final String namaDisabilitas;

  DisabilitasAnak({
    required this.id,
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

  @JsonKey(name: "nama_posyandu")
  final String namaPosyandu;

  @JsonKey(name: "alamat")
  final dynamic alamat;

  Posyandu({
    required this.id,
    required this.namaPosyandu,
    required this.alamat,
  });

  factory Posyandu.fromJson(Map<String, dynamic> json) =>
      _$PosyanduFromJson(json);

  Map<String, dynamic> toJson() => _$PosyanduToJson(this);
}


GetDetailAnakByIdResponse _$GetDetailAnakByIdResponseFromJson(
        Map<String, dynamic> json) =>
    GetDetailAnakByIdResponse(
      message: json['message'] as String,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetDetailAnakByIdResponseToJson(
        GetDetailAnakByIdResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as String,
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
      caraLahir: json['cara_lahir'] as String,
      statusKelahiran: json['status_kelahiran'] as String,
      statusStunting: json['status_stunting'],
      statusGizi: json['status_gizi'],
      statusWasting: json['status_wasting'],
      statusOrangTua: json['status_orang_tua'] as String,
      disabilitasAnak: (json['disabilitasAnak'] as List<dynamic>)
          .map((e) => DisabilitasAnak.fromJson(e as Map<String, dynamic>))
          .toList(),
      kartuKeluarga: KartuKeluarga.fromJson(
          json['kartu_keluarga'] as Map<String, dynamic>),
      pengasuhAnak: json['pengasuhAnak'],
      posyandu: Posyandu.fromJson(json['posyandu'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
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
      'cara_lahir': instance.caraLahir,
      'status_kelahiran': instance.statusKelahiran,
      'status_stunting': instance.statusStunting,
      'status_gizi': instance.statusGizi,
      'status_wasting': instance.statusWasting,
      'status_orang_tua': instance.statusOrangTua,
      'disabilitasAnak': instance.disabilitasAnak,
      'kartu_keluarga': instance.kartuKeluarga,
      'pengasuhAnak': instance.pengasuhAnak,
      'posyandu': instance.posyandu,
    };

KartuKeluarga _$KartuKeluargaFromJson(Map<String, dynamic> json) =>
    KartuKeluarga(
      id: json['id'] as String,
      nomorKartuKeluarga: json['nomor_kartu_keluarga'] as String,
      ibu: Ibu.fromJson(json['ibu'] as Map<String, dynamic>),
      ayah: Ayah.fromJson(json['ayah'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$KartuKeluargaToJson(KartuKeluarga instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nomor_kartu_keluarga': instance.nomorKartuKeluarga,
      'ibu': instance.ibu,
      'ayah': instance.ayah,
    };

Ibu _$IbuFromJson(Map<String, dynamic> json) => Ibu(
      id: json['id'] as String,
      nik: json['nik'] as String,
      namaIbu: json['nama_ibu'] as String,
      tempatLahir: json['tempat_lahir'] as String,
      tanggalLahir: json['tanggal_lahir'] as String,
      rt: json['rt'] as String,
      rw: json['rw'] as String,
      alamat: json['alamat'] as String,
      nomorTelepon: json['nomor_telepon'] as String,
      golDarah: json['gol_darah'] as String,
      jenisKb: json['jenis_kb'] as String,
      tanggalMelahirkanSebelumnya:
          json['tanggal_melahirkan_sebelumnya'] as String?,
      jumlahAnak: (json['jumlah_anak'] as num).toInt(),
      userId: json['user_id'],
      posyandu: Posyandu.fromJson(json['posyandu'] as Map<String, dynamic>),
      kartuKeluarga: KartuKeluarga.fromJson(
          json['kartu_keluarga'] as Map<String, dynamic>),
      jenisDisabilitas: json['jenis_disabilitas'] as List<dynamic>?,
    );

Map<String, dynamic> _$IbuToJson(Ibu instance) => <String, dynamic>{
      'id': instance.id,
      'nik': instance.nik,
      'nama_ibu': instance.namaIbu,
      'tempat_lahir': instance.tempatLahir,
      'tanggal_lahir': instance.tanggalLahir,
      'rt': instance.rt,
      'rw': instance.rw,
      'alamat': instance.alamat,
      'nomor_telepon': instance.nomorTelepon,
      'gol_darah': instance.golDarah,
      'jenis_kb': instance.jenisKb,
      'tanggal_melahirkan_sebelumnya': instance.tanggalMelahirkanSebelumnya,
      'jumlah_anak': instance.jumlahAnak,
      'user_id': instance.userId,
      'posyandu': instance.posyandu,
      'kartu_keluarga': instance.kartuKeluarga,
      'jenis_disabilitas': instance.jenisDisabilitas,
    };

Ayah _$AyahFromJson(Map<String, dynamic> json) => Ayah(
      id: json['id'] as String,
      nik: json['nik'] as String,
      namaAyah: json['nama_ayah'] as String,
      tempatLahir: json['tempat_lahir'] as String,
      tanggalLahir: json['tanggal_lahir'] as String,
      nomorTelepon: json['nomor_telepon'] as String,
      rt: json['rt'] as String,
      rw: json['rw'] as String,
      alamat: json['alamat'] as String,
      golDarah: json['gol_darah'] as String,
      userId: json['user_id'],
      posyandu: Posyandu.fromJson(json['posyandu'] as Map<String, dynamic>),
      kartuKeluarga: KartuKeluargaOrangTua.fromJson(
          json['kartu_keluarga'] as Map<String, dynamic>),
      jenisDisabilitas: json['jenis_disabilitas'] as List<dynamic>?,
    );

Map<String, dynamic> _$AyahToJson(Ayah instance) => <String, dynamic>{
      'id': instance.id,
      'nik': instance.nik,
      'nama_ayah': instance.namaAyah,
      'tempat_lahir': instance.tempatLahir,
      'tanggal_lahir': instance.tanggalLahir,
      'nomor_telepon': instance.nomorTelepon,
      'rt': instance.rt,
      'rw': instance.rw,
      'alamat': instance.alamat,
      'gol_darah': instance.golDarah,
      'user_id': instance.userId,
      'posyandu': instance.posyandu,
      'kartu_keluarga': instance.kartuKeluarga,
      'jenis_disabilitas': instance.jenisDisabilitas,
    };

KartuKeluargaOrangTua _$KartuKeluargaOrangTuaFromJson(
        Map<String, dynamic> json) =>
    KartuKeluargaOrangTua(
      id: json['id'] as String,
      nomorKartuKeluarga: json['nomor_kartu_keluarga'] as String,
    );

Map<String, dynamic> _$KartuKeluargaOrangTuaToJson(
        KartuKeluargaOrangTua instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nomor_kartu_keluarga': instance.nomorKartuKeluarga,
    };

JenisDisabilitas _$JenisDisabilitasFromJson(Map<String, dynamic> json) =>
    JenisDisabilitas(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'],
      namaDisabilitas: json['nama_disabilitas'] as String,
    );

Map<String, dynamic> _$JenisDisabilitasToJson(JenisDisabilitas instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'deleted_at': instance.deletedAt,
      'nama_disabilitas': instance.namaDisabilitas,
    };

DisabilitasAnak _$DisabilitasAnakFromJson(Map<String, dynamic> json) =>
    DisabilitasAnak(
      id: json['id'] as String,
      namaDisabilitas: json['nama_disabilitas'] as String,
    );

Map<String, dynamic> _$DisabilitasAnakToJson(DisabilitasAnak instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama_disabilitas': instance.namaDisabilitas,
    };

Posyandu _$PosyanduFromJson(Map<String, dynamic> json) => Posyandu(
      id: json['id'] as String,
      namaPosyandu: json['nama_posyandu'] as String,
      alamat: json['alamat'],
    );

Map<String, dynamic> _$PosyanduToJson(Posyandu instance) => <String, dynamic>{
      'id': instance.id,
      'nama_posyandu': instance.namaPosyandu,
      'alamat': instance.alamat,
    };
