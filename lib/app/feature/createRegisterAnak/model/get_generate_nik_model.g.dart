// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_generate_nik_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetGenerateNikModel _$GetGenerateNikModelFromJson(Map<String, dynamic> json) =>
    GetGenerateNikModel(
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetGenerateNikModelToJson(
        GetGenerateNikModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      nomorIndukKeluarga: json['nomor_induk_keluarga'] as String,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'nomor_induk_keluarga': instance.nomorIndukKeluarga,
    };
