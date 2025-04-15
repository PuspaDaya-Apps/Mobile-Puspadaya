import 'package:json_annotation/json_annotation.dart';
part 'get_detail_user_by_id.g.dart';

@JsonSerializable()
class GetDetailUserByIdModel {
  @JsonKey(name: "message")
  final String message;
  @JsonKey(name: "data")
  final Data data;

  GetDetailUserByIdModel({
    required this.message,
    required this.data,
  });

  factory GetDetailUserByIdModel.fromJson(Map<String, dynamic> json) =>
      _$GetDetailUserByIdModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetDetailUserByIdModelToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "nama_lengkap")
  final String namaLengkap;
  @JsonKey(name: "nomor_telepon")
  final String nomorTelepon;
  @JsonKey(name: "tanggal_lahir")
  final DateTime tanggalLahir;
  @JsonKey(name: "rt")
  final String rt;
  @JsonKey(name: "rw")
  final String rw;
  @JsonKey(name: "alamat_lengkap")
  final String alamatLengkap;
  @JsonKey(name: "posyandu")
  final Posyandu posyandu;
  @JsonKey(name: "role")
  final Role role;
  @JsonKey(name: "dusun")
  final Dusun dusun;

  Data({
    required this.id,
    required this.namaLengkap,
    required this.nomorTelepon,
    required this.tanggalLahir,
    required this.rt,
    required this.rw,
    required this.alamatLengkap,
    required this.posyandu,
    required this.role,
    required this.dusun,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Dusun {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "nama_dusun")
  final String namaDusun;
  @JsonKey(name: "desa_kelurahan")
  final DesaKelurahan desaKelurahan;

  Dusun({
    required this.id,
    required this.namaDusun,
    required this.desaKelurahan,
  });

  factory Dusun.fromJson(Map<String, dynamic> json) => _$DusunFromJson(json);

  Map<String, dynamic> toJson() => _$DusunToJson(this);
}

@JsonSerializable()
class DesaKelurahan {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "nama_desa_kelurahan")
  final String namaDesaKelurahan;
  @JsonKey(name: "kecamatan")
  final Kecamatan kecamatan;

  DesaKelurahan({
    required this.id,
    required this.namaDesaKelurahan,
    required this.kecamatan,
  });

  factory DesaKelurahan.fromJson(Map<String, dynamic> json) =>
      _$DesaKelurahanFromJson(json);

  Map<String, dynamic> toJson() => _$DesaKelurahanToJson(this);
}

@JsonSerializable()
class Kecamatan {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "nama_kecamatan")
  final String namaKecamatan;
  @JsonKey(name: "kabupaten_kota")
  final KabupatenKota kabupatenKota;

  Kecamatan({
    required this.id,
    required this.namaKecamatan,
    required this.kabupatenKota,
  });

  factory Kecamatan.fromJson(Map<String, dynamic> json) =>
      _$KecamatanFromJson(json);

  Map<String, dynamic> toJson() => _$KecamatanToJson(this);
}

@JsonSerializable()
class KabupatenKota {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "nama_kabupaten_kota")
  final String namaKabupatenKota;
  @JsonKey(name: "provinsi")
  final Provinsi provinsi;

  KabupatenKota({
    required this.id,
    required this.namaKabupatenKota,
    required this.provinsi,
  });

  factory KabupatenKota.fromJson(Map<String, dynamic> json) =>
      _$KabupatenKotaFromJson(json);

  Map<String, dynamic> toJson() => _$KabupatenKotaToJson(this);
}

@JsonSerializable()
class Provinsi {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "nama_provinsi")
  final String namaProvinsi;

  Provinsi({
    required this.id,
    required this.namaProvinsi,
  });

  factory Provinsi.fromJson(Map<String, dynamic> json) =>
      _$ProvinsiFromJson(json);

  Map<String, dynamic> toJson() => _$ProvinsiToJson(this);
}

@JsonSerializable()
class Posyandu {
  @JsonKey(name: "nama_posyandu")
  final String namaPosyandu;

  Posyandu({
    required this.namaPosyandu,
  });

  factory Posyandu.fromJson(Map<String, dynamic> json) =>
      _$PosyanduFromJson(json);

  Map<String, dynamic> toJson() => _$PosyanduToJson(this);
}

@JsonSerializable()
class Role {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;
  @JsonKey(name: "deleted_at")
  final DateTime? deletedAt;
  @JsonKey(name: "nama_role")
  final String namaRole;

  Role({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.namaRole,
  });

  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);

  Map<String, dynamic> toJson() => _$RoleToJson(this);
}
