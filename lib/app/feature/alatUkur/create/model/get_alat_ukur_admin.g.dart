// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_alat_ukur_admin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllAlatUkurAdmin _$GetAllAlatUkurAdminFromJson(Map<String, dynamic> json) =>
    GetAllAlatUkurAdmin(
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
      imageUrl: json['image_url'] as String?,
    );

Map<String, dynamic> _$GetAllAlatUkurAdminToJson(
        GetAllAlatUkurAdmin instance) =>
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
