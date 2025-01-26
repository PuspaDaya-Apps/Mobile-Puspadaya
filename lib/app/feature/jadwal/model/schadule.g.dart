// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schadule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Schadule _$SchaduleFromJson(Map<String, dynamic> json) => Schadule(
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SchaduleToJson(Schadule instance) => <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
      'meta': instance.meta,
    };

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      id: json['id'] as String,
      name: json['name'] as String,
      time: DateTime.parse(json['time'] as String),
      location: json['location'] as String,
      timeStart: json['time_start'] as String,
      timeEnd: json['time_end'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'time': instance.time.toIso8601String(),
      'location': instance.location,
      'time_start': instance.timeStart,
      'time_end': instance.timeEnd,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
      page: (json['page'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      schaduleCount: (json['schaduleCount'] as num).toInt(),
      pageCount: (json['pageCount'] as num).toInt(),
      hasPreviousPage: json['hasPreviousPage'] as bool,
      hasNextPage: json['hasNextPage'] as bool,
    );

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
      'schaduleCount': instance.schaduleCount,
      'pageCount': instance.pageCount,
      'hasPreviousPage': instance.hasPreviousPage,
      'hasNextPage': instance.hasNextPage,
    };
