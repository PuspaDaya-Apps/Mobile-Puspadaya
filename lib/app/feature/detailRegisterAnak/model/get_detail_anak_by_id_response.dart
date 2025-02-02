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

  GetDetailAnakByIdResponse copyWith({
    String? message,
    Data? data,
  }) =>
      GetDetailAnakByIdResponse(
        message: message ?? this.message,
        data: data ?? this.data,
      );

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
  @JsonKey(name: "cara_lahir")
  final String caraLahir;
  @JsonKey(name: "status_kelahiran")
  final String statusKelahiran;
  @JsonKey(name: "status_stunting")
  final String statusStunting;
  @JsonKey(name: "status_gizi")
  final String statusGizi;
  @JsonKey(name: "status_wasting")
  final String statusWasting;
  @JsonKey(name: "status_orang_tua")
  final String statusOrangTua;
  @JsonKey(name: "jenis_disabilitas")
  final List<JenisDisabilitas>? jenisDisabilitas;
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
    required this.jenisDisabilitas,
    required this.kartuKeluarga,
    required this.pengasuhAnak,
    required this.posyandu,
  });

  Data copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic deletedAt,
    String? nik,
    String? namaAnak,
    String? tempatLahir,
    int? anakKe,
    DateTime? tanggalLahir,
    String? jenisKelamin,
    String? beratBadanLahir,
    String? tinggiBadanLahir,
    String? lingkarLenganAtasLahir,
    String? lingkarKepalaLahir,
    String? caraLahir,
    String? statusKelahiran,
    String? statusStunting,
    String? statusGizi,
    String? statusWasting,
    String? statusOrangTua,
    List<dynamic>? disabilitasAnak,
    KartuKeluarga? kartuKeluarga,
    dynamic pengasuhAnak,
    Posyandu? posyandu,
  }) =>
      Data(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
        nik: nik ?? this.nik,
        namaAnak: namaAnak ?? this.namaAnak,
        tempatLahir: tempatLahir ?? this.tempatLahir,
        anakKe: anakKe ?? this.anakKe,
        tanggalLahir: tanggalLahir ?? this.tanggalLahir,
        jenisKelamin: jenisKelamin ?? this.jenisKelamin,
        beratBadanLahir: beratBadanLahir ?? this.beratBadanLahir,
        tinggiBadanLahir: tinggiBadanLahir ?? this.tinggiBadanLahir,
        lingkarLenganAtasLahir:
            lingkarLenganAtasLahir ?? this.lingkarLenganAtasLahir,
        lingkarKepalaLahir: lingkarKepalaLahir ?? this.lingkarKepalaLahir,
        caraLahir: caraLahir ?? this.caraLahir,
        statusKelahiran: statusKelahiran ?? this.statusKelahiran,
        statusStunting: statusStunting ?? this.statusStunting,
        statusGizi: statusGizi ?? this.statusGizi,
        statusWasting: statusWasting ?? this.statusWasting,
        statusOrangTua: statusOrangTua ?? this.statusOrangTua,
        jenisDisabilitas: jenisDisabilitas ?? this.jenisDisabilitas,
        kartuKeluarga: kartuKeluarga ?? this.kartuKeluarga,
        pengasuhAnak: pengasuhAnak ?? this.pengasuhAnak,
        posyandu: posyandu ?? this.posyandu,
      );

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

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

  JenisDisabilitas copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic deletedAt,
    String? namaDisabilitas,
  }) =>
      JenisDisabilitas(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
        namaDisabilitas: namaDisabilitas ?? this.namaDisabilitas,
      );

  factory JenisDisabilitas.fromJson(Map<String, dynamic> json) =>
      _$JenisDisabilitasFromJson(json);

  Map<String, dynamic> toJson() => _$JenisDisabilitasToJson(this);
}

@JsonSerializable()
class KartuKeluarga {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "created_at")
  final DateTime createdAt;
  @JsonKey(name: "updated_at")
  final DateTime updatedAt;
  @JsonKey(name: "deleted_at")
  final dynamic deletedAt;
  @JsonKey(name: "nomor_kartu_keluarga")
  final String nomorKartuKeluarga;

  KartuKeluarga({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.nomorKartuKeluarga,
  });

  KartuKeluarga copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic deletedAt,
    String? nomorKartuKeluarga,
  }) =>
      KartuKeluarga(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
        nomorKartuKeluarga: nomorKartuKeluarga ?? this.nomorKartuKeluarga,
      );

  factory KartuKeluarga.fromJson(Map<String, dynamic> json) =>
      _$KartuKeluargaFromJson(json);

  Map<String, dynamic> toJson() => _$KartuKeluargaToJson(this);
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

  Posyandu copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic deletedAt,
    String? namaPosyandu,
    dynamic alamat,
  }) =>
      Posyandu(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
        namaPosyandu: namaPosyandu ?? this.namaPosyandu,
        alamat: alamat ?? this.alamat,
      );

  factory Posyandu.fromJson(Map<String, dynamic> json) =>
      _$PosyanduFromJson(json);

  Map<String, dynamic> toJson() => _$PosyanduToJson(this);
}
