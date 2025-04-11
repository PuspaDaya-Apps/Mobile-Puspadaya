// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grafik_kunjungan_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GrafikKunjunganResponseModel _$GrafikKunjunganResponseModelFromJson(
        Map<String, dynamic> json) =>
    GrafikKunjunganResponseModel(
      bulan: json['bulan'] as String,
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$GrafikKunjunganResponseModelToJson(
        GrafikKunjunganResponseModel instance) =>
    <String, dynamic>{
      'bulan': instance.bulan,
      'total': instance.total,
    };
