// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_alat_ukur.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllAlatUkur _$GetAllAlatUkurFromJson(Map<String, dynamic> json) =>
    GetAllAlatUkur(
      data: (json['data'] as List<dynamic>)
          .map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$GetAllAlatUkurToJson(GetAllAlatUkur instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
    };

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
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
      merekAlat: json['merek_alat'] as String?,
      kondisiAlat: json['kondisi_alat'] as String,
      alatPengukuranAdmin: AlatPengukuranAdmin.fromJson(
          json['alat_pengukuran_admin'] as Map<String, dynamic>),
      posyandu: Posyandu.fromJson(json['posyandu'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'merek_alat': instance.merekAlat,
      'kondisi_alat': instance.kondisiAlat,
      'alat_pengukuran_admin': instance.alatPengukuranAdmin,
      'posyandu': instance.posyandu,
    };

AlatPengukuranAdmin _$AlatPengukuranAdminFromJson(Map<String, dynamic> json) =>
    AlatPengukuranAdmin(
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
      jenisAlat: json['jenis_alat'] as String,
      merekAlat: json['merek_alat'] as String,
      statusAlat: json['status_alat'] as String,
      kondisiAlat: json['kondisi_alat'] as String,
      imageUrl: json['image_url'] as String,
    );

Map<String, dynamic> _$AlatPengukuranAdminToJson(
        AlatPengukuranAdmin instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'jenis_alat': instance.jenisAlat,
      'merek_alat': instance.merekAlat,
      'status_alat': instance.statusAlat,
      'kondisi_alat': instance.kondisiAlat,
      'image_url': instance.imageUrl,
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
      alamat: json['alamat'],
    );

Map<String, dynamic> _$PosyanduToJson(Posyandu instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'nama_posyandu': instance.namaPosyandu,
      'alamat': instance.alamat,
    };
