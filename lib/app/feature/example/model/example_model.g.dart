// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Example _$ExampleFromJson(Map<String, dynamic> json) => Example(
      id: (json['example_id'] as num).toInt(),
      nama: json['example_name'] as String,
      deskripsi: (json['description'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ExampleToJson(Example instance) => <String, dynamic>{
      'example_id': instance.id,
      'example_name': instance.nama,
      'description': instance.deskripsi,
    };
