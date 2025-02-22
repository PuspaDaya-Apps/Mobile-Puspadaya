// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_index_riwayat_faktor_resiko_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetIndexRiwayatFaktorResikoModel _$GetIndexRiwayatFaktorResikoModelFromJson(
        Map<String, dynamic> json) =>
    GetIndexRiwayatFaktorResikoModel(
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetIndexRiwayatFaktorResikoModelToJson(
        GetIndexRiwayatFaktorResikoModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      id: json['id'] as String,
      tanggalPeriode: DateTime.parse(json['tanggal_periode'] as String),
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'id': instance.id,
      'tanggal_periode': instance.tanggalPeriode.toIso8601String(),
    };
