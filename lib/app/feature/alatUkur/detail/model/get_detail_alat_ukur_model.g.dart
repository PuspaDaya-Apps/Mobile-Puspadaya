// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_detail_alat_ukur_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDetailAlatUkurKaderModel _$GetDetailAlatUkurKaderModelFromJson(
        Map<String, dynamic> json) =>
    GetDetailAlatUkurKaderModel(
      message: json['message'] as String,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetDetailAlatUkurKaderModelToJson(
        GetDetailAlatUkurKaderModel instance) =>
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
      merekAlat: json['merek_alat'] as String,
      kondisiAlat: json['kondisi_alat'] as String,
      alatPengukuranAdmin: AlatPengukuranAdmin.fromJson(
          json['alat_pengukuran_admin'] as Map<String, dynamic>),
      posyandu: Posyandu.fromJson(json['posyandu'] as Map<String, dynamic>),
      checklists: (json['checklists'] as List<dynamic>?)
          ?.map((e) => Checklist.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'merek_alat': instance.merekAlat,
      'kondisi_alat': instance.kondisiAlat,
      'alat_pengukuran_admin': instance.alatPengukuranAdmin,
      'posyandu': instance.posyandu,
      'checklists': instance.checklists,
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

Checklist _$ChecklistFromJson(Map<String, dynamic> json) => Checklist(
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
      namaChecklist: json['nama_checklist'] as String,
    );

Map<String, dynamic> _$ChecklistToJson(Checklist instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'nama_checklist': instance.namaChecklist,
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
