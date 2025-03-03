// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_post_ibu_hamil_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorPostIbuHamilModel _$ErrorPostIbuHamilModelFromJson(
        Map<String, dynamic> json) =>
    ErrorPostIbuHamilModel(
      message: json['message'] as String,
      error: json['error'] as String,
      statusCode: (json['statusCode'] as num).toInt(),
    );

Map<String, dynamic> _$ErrorPostIbuHamilModelToJson(
        ErrorPostIbuHamilModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'error': instance.error,
      'statusCode': instance.statusCode,
    };
