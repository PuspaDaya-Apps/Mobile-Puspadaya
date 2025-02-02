import 'package:json_annotation/json_annotation.dart';

// part 'current_user_model.g.dart';

// @JsonSerializable()
class CurrentUserModel {
  String id;
  @JsonKey(name: 'nama_lengkap')
  String namaLengkap;
  @JsonKey(name: 'nomor_telepon')
  String nomorTelepon;
  String email;
  PosyanduModel posyandu;
  RoleModel role;

  CurrentUserModel({
    required this.id,
    required this.namaLengkap,
    required this.nomorTelepon,
    required this.email,
    required this.posyandu,
    required this.role
  });

   factory CurrentUserModel.fromJson(Map<String, dynamic> json) => _$CurrentUserModelFromJson(json);

  Map<String, dynamic> toJson()=>_$CurrentUserModelToJson(this);
}

// @JsonSerializable()
class PosyanduModel {
  String id;
  @JsonKey(name: 'nama_posyandu')
  String namaPosyandu;
  String? alamat;

  PosyanduModel({
    required this.id,
    required this.namaPosyandu,
    this.alamat,
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


CurrentUserModel _$CurrentUserModelFromJson(Map<String, dynamic> json) =>
    CurrentUserModel(
      id: json['id'] as String,
      namaLengkap: json['nama_lengkap'] as String,
      nomorTelepon: json['nomor_telepon'] as String,
      email: json['email'] as String,
      posyandu:
          PosyanduModel.fromJson(json['posyandu'] as Map<String, dynamic>),
      role: RoleModel.fromJson(json['role'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CurrentUserModelToJson(CurrentUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama_lengkap': instance.namaLengkap,
      'nomor_telepon': instance.nomorTelepon,
      'email': instance.email,
      'posyandu': instance.posyandu,
      'role': instance.role,
    };

PosyanduModel _$PosyanduModelFromJson(Map<String, dynamic> json) =>
    PosyanduModel(
      id: json['id'] as String,
      namaPosyandu: json['nama_posyandu'] as String,
      alamat: json['alamat'] as String?,
    );

Map<String, dynamic> _$PosyanduModelToJson(PosyanduModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama_posyandu': instance.namaPosyandu,
      'alamat': instance.alamat,
    };

RoleModel _$RoleModelFromJson(Map<String, dynamic> json) => RoleModel(
      id: json['id'] as String,
      namaRole: json['nama_role'] as String,
    );

Map<String, dynamic> _$RoleModelToJson(RoleModel instance) => <String, dynamic>{
      'id': instance.id,
      'nama_role': instance.namaRole,
    };
