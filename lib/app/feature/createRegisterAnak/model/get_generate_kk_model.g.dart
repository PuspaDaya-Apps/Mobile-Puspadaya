// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_generate_kk_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetGenerateKKModel _$GetGenerateKKModelFromJson(Map<String, dynamic> json) =>
    GetGenerateKKModel(
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetGenerateKKModelToJson(GetGenerateKKModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      nomorKartuKeluarga: json['nomor_kartu_keluarga'] as String,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'nomor_kartu_keluarga': instance.nomorKartuKeluarga,
    };
