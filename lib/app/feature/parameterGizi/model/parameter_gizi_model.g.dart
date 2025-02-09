// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parameter_gizi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParameterGiziModel _$ParameterGiziModelFromJson(Map<String, dynamic> json) =>
    ParameterGiziModel(
      jenisKelamin: json['jenis_kelamin'] as String,
      satuan: json['satuan'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ParameterGiziModelToJson(ParameterGiziModel instance) =>
    <String, dynamic>{
      'jenis_kelamin': instance.jenisKelamin,
      'satuan': instance.satuan,
      'data': instance.data,
    };

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      day: (json['Day'] as num).toDouble(),
      l: (json['L'] as num).toDouble(),
      m: (json['M'] as num).toDouble(),
      s: (json['S'] as num).toDouble(),
      sd4Neg: (json['SD4neg'] as num).toDouble(),
      sd3Neg: (json['SD3neg'] as num).toDouble(),
      sd2Neg: (json['SD2neg'] as num).toDouble(),
      sd1Neg: (json['SD1neg'] as num).toDouble(),
      sd0: (json['SD0'] as num).toDouble(),
      sd1: (json['SD1'] as num).toDouble(),
      sd2: (json['SD2'] as num).toDouble(),
      sd3: (json['SD3'] as num).toDouble(),
      sd4: (json['SD4'] as num).toDouble(),
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'Day': instance.day,
      'L': instance.l,
      'M': instance.m,
      'S': instance.s,
      'SD4neg': instance.sd4Neg,
      'SD3neg': instance.sd3Neg,
      'SD2neg': instance.sd2Neg,
      'SD1neg': instance.sd1Neg,
      'SD0': instance.sd0,
      'SD1': instance.sd1,
      'SD2': instance.sd2,
      'SD3': instance.sd3,
      'SD4': instance.sd4,
    };
