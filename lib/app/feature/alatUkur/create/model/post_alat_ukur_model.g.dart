// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_alat_ukur_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostAlatUkurModel _$PostAlatUkurModelFromJson(Map<String, dynamic> json) =>
    PostAlatUkurModel(
      jenisAlatId: json['jenis_alat_id'] as String,
      merekAlat: json['merek_alat'] as String,
      kondisiAlat: json['kondisi_alat'] as String,
    );

Map<String, dynamic> _$PostAlatUkurModelToJson(PostAlatUkurModel instance) =>
    <String, dynamic>{
      'jenis_alat_id': instance.jenisAlatId,
      'merek_alat': instance.merekAlat,
      'kondisi_alat': instance.kondisiAlat,
    };
