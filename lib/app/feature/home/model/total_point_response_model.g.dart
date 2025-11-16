// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'total_point_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TotalPointResponseModel _$TotalPointResponseModelFromJson(
        Map<String, dynamic> json) =>
    TotalPointResponseModel(
      totalSkorKeseluruhan: json['total_skor_keseluruhan'] as num,
      jumlahBulan: (json['jumlah_bulan'] as num).toInt(),
    );

Map<String, dynamic> _$TotalPointResponseModelToJson(
        TotalPointResponseModel instance) =>
    <String, dynamic>{
      'total_skor_keseluruhan': instance.totalSkorKeseluruhan,
      'jumlah_bulan': instance.jumlahBulan,
    };
