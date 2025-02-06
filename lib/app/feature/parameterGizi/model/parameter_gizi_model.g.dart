// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parameter_gizi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetParamaterGizi _$GetParamaterGiziFromJson(Map<String, dynamic> json) =>
    GetParamaterGizi(
      jenisKelamin: json['jenis_kelamin'] as String,
      satuan: json['satuan'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => (e as Map<String, dynamic>).map(
                (k, e) => MapEntry(k, (e as num).toDouble()),
              ))
          .toList(),
    );

Map<String, dynamic> _$GetParamaterGiziToJson(GetParamaterGizi instance) =>
    <String, dynamic>{
      'jenis_kelamin': instance.jenisKelamin,
      'satuan': instance.satuan,
      'data': instance.data,
    };
