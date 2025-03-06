// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_alat_ukur_alat_deteksi_dini_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostAlatUkurAlatDeteksiDiniModel _$PostAlatUkurAlatDeteksiDiniModelFromJson(
        Map<String, dynamic> json) =>
    PostAlatUkurAlatDeteksiDiniModel(
      alatPengukuranAdminId: json['alat_pengukuran_admin_id'] as String,
      merekAlat: json['merek_alat'] as String,
      kondisiAlat: json['kondisi_alat'] as String,
      checklistItems: (json['checklist_items'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$PostAlatUkurAlatDeteksiDiniModelToJson(
        PostAlatUkurAlatDeteksiDiniModel instance) =>
    <String, dynamic>{
      'alat_pengukuran_admin_id': instance.alatPengukuranAdminId,
      'merek_alat': instance.merekAlat,
      'kondisi_alat': instance.kondisiAlat,
      'checklist_items': instance.checklistItems,
    };
