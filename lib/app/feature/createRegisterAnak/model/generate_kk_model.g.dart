// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_kk_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenerateKKModel _$GenerateKKModelFromJson(Map<String, dynamic> json) =>
    GenerateKKModel(
      provinsiId: json['provinsi_id'] as String,
      kabupatenKotaId: json['kabupaten_kota_id'] as String,
      kecamatanId: json['kecamatan_id'] as String,
      tanggalLahir: json['tanggal_lahir'] as String,
    );

Map<String, dynamic> _$GenerateKKModelToJson(GenerateKKModel instance) =>
    <String, dynamic>{
      'provinsi_id': instance.provinsiId,
      'kabupaten_kota_id': instance.kabupatenKotaId,
      'kecamatan_id': instance.kecamatanId,
      'tanggal_lahir': instance.tanggalLahir,
    };
