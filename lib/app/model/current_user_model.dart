import 'package:json_annotation/json_annotation.dart';

// part 'current_user_model.g.dart';

//@JsonSerializable()
class CurrentUserModel {
  String id;
  @JsonKey(name: 'nama_lengkap')
  String namaLengkap;
  @JsonKey(name: 'nomor_telepon')
  String nomorTelepon;
  @JsonKey(name: 'tanggal_lahir')
  String tanggalLahir;
  String rt;
  String rw;
  @JsonKey(name: 'alamat_lengkap')
  String alamatLengkap;
  PosyanduModel posyandu;
  RoleModel role;
  Provinsi provinsi;
  @JsonKey(name: 'kabupaten_kota')
  KabupatenKota kabupatenKota;
  Kecamatan kecamatan;
  @JsonKey(name: 'desa_kelurahan')
  DesaKelurahan desaKelurahan;
  Dusun dusun;

  CurrentUserModel({
    required this.id,
    required this.namaLengkap,
    required this.nomorTelepon,
    required this.tanggalLahir,
    required this.rt,
    required this.rw,
    required this.alamatLengkap,
    required this.posyandu,
    required this.role,
    required this.provinsi,
    required this.kabupatenKota,
    required this.kecamatan,
    required this.desaKelurahan,
    required this.dusun,
  });

   factory CurrentUserModel.fromJson(Map<String, dynamic> json) => _$CurrentUserModelFromJson(json);

  Map<String, dynamic> toJson()=>_$CurrentUserModelToJson(this);
}

//@JsonSerializable()
class PosyanduModel {
  String id;
  @JsonKey(name: 'nama_posyandu')
  String namaPosyandu;

  PosyanduModel({
    required this.id,
    required this.namaPosyandu,
  });

  factory PosyanduModel.fromJson(Map<String, dynamic> json) => _$PosyanduModelFromJson(json);

  Map<String, dynamic> toJson()=>_$PosyanduModelToJson(this);
}

//@JsonSerializable()
class RoleModel {
  String id;
  @JsonKey(name: 'nama_role')
  String namaRole;

  RoleModel({
    required this.id,
    required this.namaRole,
  });

  factory RoleModel.fromJson(Map<String, dynamic> json) => _$RoleModelFromJson(json);

  Map<String, dynamic> toJson()=>_$RoleModelToJson(this);
}

//@JsonSerializable()
class Provinsi {
  String id;
  @JsonKey(name: 'nama_provinsi')
  String namaProvinsi;

  Provinsi({
    required this.id,
    required this.namaProvinsi,
  });

  factory Provinsi.fromJson(Map<String, dynamic> json) => _$ProvinsiFromJson(json);

  Map<String, dynamic> toJson()=>_$ProvinsiToJson(this);
}

//@JsonSerializable()
class KabupatenKota {
  String id;
  @JsonKey(name: 'nama_kabupaten_kota')
  String namaKabupatenKota;

  KabupatenKota({
    required this.id,
    required this.namaKabupatenKota,
  });

  factory KabupatenKota.fromJson(Map<String, dynamic> json) => _$KabupatenKotaFromJson(json);

  Map<String, dynamic> toJson()=>_$KabupatenKotaToJson(this);
}

//@JsonSerializable()
class Kecamatan {
  String id;
  @JsonKey(name: 'nama_kecamatan')
  String namaKecamatan;

  Kecamatan({
    required this.id,
    required this.namaKecamatan,
  });

  factory Kecamatan.fromJson(Map<String, dynamic> json) => _$KecamatanFromJson(json);

  Map<String, dynamic> toJson()=>_$KecamatanToJson(this);
}

//@JsonSerializable()
class DesaKelurahan {
  String id;
  @JsonKey(name: 'nama_desa_kelurahan')
  String namaDesaKelurahan;

  DesaKelurahan({
    required this.id,
    required this.namaDesaKelurahan,
  });

  factory DesaKelurahan.fromJson(Map<String, dynamic> json) => _$DesaKelurahanFromJson(json);

  Map<String, dynamic> toJson()=>_$DesaKelurahanToJson(this);
}

//@JsonSerializable()
class Dusun {
  String id;
  @JsonKey(name: 'nama_dusun')
  String namaDusun;

  Dusun({
    required this.id,
    required this.namaDusun,
  });

  factory Dusun.fromJson(Map<String, dynamic> json) => _$DusunFromJson(json);

  Map<String, dynamic> toJson()=>_$DusunToJson(this);
}


CurrentUserModel _$CurrentUserModelFromJson(Map<String, dynamic> json) =>
    CurrentUserModel(
      id: json['id'] as String,
      namaLengkap: json['nama_lengkap'] as String,
      nomorTelepon: json['nomor_telepon'] as String,
      tanggalLahir: json['tanggal_lahir'] as String,
      rt: json['rt'] as String,
      rw: json['rw'] as String,
      alamatLengkap: json['alamat_lengkap'] as String,
      posyandu:
          PosyanduModel.fromJson(json['posyandu'] as Map<String, dynamic>),
      role: RoleModel.fromJson(json['role'] as Map<String, dynamic>),
      provinsi: Provinsi.fromJson(json['provinsi'] as Map<String, dynamic>),
      kabupatenKota: KabupatenKota.fromJson(
          json['kabupaten_kota'] as Map<String, dynamic>),
      kecamatan: Kecamatan.fromJson(json['kecamatan'] as Map<String, dynamic>),
      desaKelurahan: DesaKelurahan.fromJson(
          json['desa_kelurahan'] as Map<String, dynamic>),
      dusun: Dusun.fromJson(json['dusun'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CurrentUserModelToJson(CurrentUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama_lengkap': instance.namaLengkap,
      'nomor_telepon': instance.nomorTelepon,
      'tanggal_lahir': instance.tanggalLahir,
      'rt': instance.rt,
      'rw': instance.rw,
      'alamat_lengkap': instance.alamatLengkap,
      'posyandu': instance.posyandu,
      'role': instance.role,
      'provinsi': instance.provinsi,
      'kabupaten_kota': instance.kabupatenKota,
      'kecamatan': instance.kecamatan,
      'desa_kelurahan': instance.desaKelurahan,
      'dusun': instance.dusun,
    };

PosyanduModel _$PosyanduModelFromJson(Map<String, dynamic> json) =>
    PosyanduModel(
      id: json['id'] as String,
      namaPosyandu: json['nama_posyandu'] as String,
    );

Map<String, dynamic> _$PosyanduModelToJson(PosyanduModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama_posyandu': instance.namaPosyandu,
    };

RoleModel _$RoleModelFromJson(Map<String, dynamic> json) => RoleModel(
      id: json['id'] as String,
      namaRole: json['nama_role'] as String,
    );

Map<String, dynamic> _$RoleModelToJson(RoleModel instance) => <String, dynamic>{
      'id': instance.id,
      'nama_role': instance.namaRole,
    };

Provinsi _$ProvinsiFromJson(Map<String, dynamic> json) => Provinsi(
      id: json['id'] as String,
      namaProvinsi: json['nama_provinsi'] as String,
    );

Map<String, dynamic> _$ProvinsiToJson(Provinsi instance) => <String, dynamic>{
      'id': instance.id,
      'nama_provinsi': instance.namaProvinsi,
    };

KabupatenKota _$KabupatenKotaFromJson(Map<String, dynamic> json) =>
    KabupatenKota(
      id: json['id'] as String,
      namaKabupatenKota: json['nama_kabupaten_kota'] as String,
    );

Map<String, dynamic> _$KabupatenKotaToJson(KabupatenKota instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama_kabupaten_kota': instance.namaKabupatenKota,
    };

Kecamatan _$KecamatanFromJson(Map<String, dynamic> json) => Kecamatan(
      id: json['id'] as String,
      namaKecamatan: json['nama_kecamatan'] as String,
    );

Map<String, dynamic> _$KecamatanToJson(Kecamatan instance) => <String, dynamic>{
      'id': instance.id,
      'nama_kecamatan': instance.namaKecamatan,
    };

DesaKelurahan _$DesaKelurahanFromJson(Map<String, dynamic> json) =>
    DesaKelurahan(
      id: json['id'] as String,
      namaDesaKelurahan: json['nama_desa_kelurahan'] as String,
    );

Map<String, dynamic> _$DesaKelurahanToJson(DesaKelurahan instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama_desa_kelurahan': instance.namaDesaKelurahan,
    };

Dusun _$DusunFromJson(Map<String, dynamic> json) => Dusun(
      id: json['id'] as String,
      namaDusun: json['nama_dusun'] as String,
    );

Map<String, dynamic> _$DusunToJson(Dusun instance) => <String, dynamic>{
      'id': instance.id,
      'nama_dusun': instance.namaDusun,
    };
