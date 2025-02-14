import 'package:json_annotation/json_annotation.dart';

// part 'current_user_model.g.dart';

// @JsonSerializable()
class CurrentUserModel {
  String id;
  @JsonKey(name: 'nama_lengkap')
  String namaLengkap;
  @JsonKey(name: 'nomor_telepon')
  String nomorTelepon;
  @JsonKey(name: 'tanggal_lahir')
  String tanggalLahir;
  PosyanduModel posyandu;
  RoleModel role;
  Provinsi provinsi;

  CurrentUserModel({
    required this.id,
    required this.namaLengkap,
    required this.nomorTelepon,
    required this.tanggalLahir,
    required this.posyandu,
    required this.role,
    required this.provinsi
  });

   factory CurrentUserModel.fromJson(Map<String, dynamic> json) => _$CurrentUserModelFromJson(json);

  Map<String, dynamic> toJson()=>_$CurrentUserModelToJson(this);
}

// @JsonSerializable()
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

// @JsonSerializable()
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

// @JsonSerializable()
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

CurrentUserModel _$CurrentUserModelFromJson(Map<String, dynamic> json) =>
    CurrentUserModel(
      id: json['id'] as String,
      namaLengkap: json['nama_lengkap'] as String,
      nomorTelepon: json['nomor_telepon'] as String,
      tanggalLahir: json['tanggal_lahir'] as String,
      posyandu:
          PosyanduModel.fromJson(json['posyandu'] as Map<String, dynamic>),
      role: RoleModel.fromJson(json['role'] as Map<String, dynamic>),
      provinsi: Provinsi.fromJson(json['provinsi'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CurrentUserModelToJson(CurrentUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama_lengkap': instance.namaLengkap,
      'nomor_telepon': instance.nomorTelepon,
      'tanggal_lahir': instance.tanggalLahir,
      'posyandu': instance.posyandu,
      'role': instance.role,
      'provinsi': instance.provinsi,
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
