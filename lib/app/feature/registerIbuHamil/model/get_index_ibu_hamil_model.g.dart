// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_index_ibu_hamil_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetIndexIbuHamilModel _$GetIndexIbuHamilModelFromJson(
        Map<String, dynamic> json) =>
    GetIndexIbuHamilModel(
      data: (json['data'] as List<dynamic>)
          .map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
      links: Links.fromJson(json['links'] as Map<String, dynamic>),
      message: json['message'] as String,
    );

Map<String, dynamic> _$GetIndexIbuHamilModelToJson(
        GetIndexIbuHamilModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'meta': instance.meta,
      'links': instance.links,
      'message': instance.message,
    };

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      id: json['id'] as String,
      nik: json['nik'] as String,
      namaIbu: json['nama_ibu'] as String,
      usiaKehamilan: json['usia_kehamilan'] as String,
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'id': instance.id,
      'nik': instance.nik,
      'nama_ibu': instance.namaIbu,
      'usia_kehamilan': instance.usiaKehamilan,
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

Links _$LinksFromJson(Map<String, dynamic> json) => Links(
      first: json['first'] as String,
      last: json['last'] as String,
      current: json['current'] as String,
      next: json['next'] as String,
      previous: json['previous'] as String,
    );

Map<String, dynamic> _$LinksToJson(Links instance) => <String, dynamic>{
      'first': instance.first,
      'last': instance.last,
      'current': instance.current,
      'next': instance.next,
      'previous': instance.previous,
    };

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
      itemsPerPage: (json['itemsPerPage'] as num).toInt(),
      totalItems: (json['totalItems'] as num).toInt(),
      currentPage: (json['currentPage'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
    );

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'itemsPerPage': instance.itemsPerPage,
      'totalItems': instance.totalItems,
      'currentPage': instance.currentPage,
      'totalPages': instance.totalPages,
    };
