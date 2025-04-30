// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'total_kunjungan_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TotalKunjunganResponseModel _$TotalKunjunganResponseModelFromJson(
        Map<String, dynamic> json) =>
    TotalKunjunganResponseModel(
      message: json['message'] as String,
      data: (json['data'] as num).toInt(),
    );

Map<String, dynamic> _$TotalKunjunganResponseModelToJson(
        TotalKunjunganResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
