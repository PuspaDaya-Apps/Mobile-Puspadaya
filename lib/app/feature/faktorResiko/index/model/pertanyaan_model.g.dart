// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pertanyaan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PertanyaanModel _$PertanyaanModelFromJson(Map<String, dynamic> json) =>
    PertanyaanModel(
      id: json['id'] as String,
      pertanyaan: json['question'] as String,
      opsi: (json['option'] as List<dynamic>)
          .map((e) => Opsi.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PertanyaanModelToJson(PertanyaanModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.pertanyaan,
      'option': instance.opsi,
    };

Opsi _$OpsiFromJson(Map<String, dynamic> json) => Opsi(
      id: json['id'] as String,
      opsi: json['option'] as String,
    );

Map<String, dynamic> _$OpsiToJson(Opsi instance) => <String, dynamic>{
      'id': instance.id,
      'option': instance.opsi,
    };
