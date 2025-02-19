// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_nik_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenerateNIKModel _$GenerateNIKModelFromJson(Map<String, dynamic> json) =>
    GenerateNIKModel(
      nomorKartuKeluarga: json['nomor_kartu_keluarga'] as String,
      tanggalLahir: json['tanggal_lahir'] as String,
    );

Map<String, dynamic> _$GenerateNIKModelToJson(GenerateNIKModel instance) =>
    <String, dynamic>{
      'nomor_kartu_keluarga': instance.nomorKartuKeluarga,
      'tanggal_lahir': instance.tanggalLahir,
    };
