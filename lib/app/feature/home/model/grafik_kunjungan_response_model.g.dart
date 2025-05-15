// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grafik_kunjungan_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GrafikKunjunganResponseModel _$GrafikKunjunganResponseModelFromJson(
        Map<String, dynamic> json) =>
    GrafikKunjunganResponseModel(
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$GrafikKunjunganResponseModelToJson(
        GrafikKunjunganResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
