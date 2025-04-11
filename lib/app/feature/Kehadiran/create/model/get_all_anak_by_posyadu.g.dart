// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_anak_by_posyadu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllAnakByPosyandu _$GetAllAnakByPosyanduFromJson(
        Map<String, dynamic> json) =>
    GetAllAnakByPosyandu(
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
      links: Links.fromJson(json['links'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetAllAnakByPosyanduToJson(
        GetAllAnakByPosyandu instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
      'meta': instance.meta,
      'links': instance.links,
    };

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      isChecked: json['isChecked'] as bool? ?? false,
      id: json['id'] as String,
      nik: json['nik'] as String,
      namaAnak: json['nama_anak'] as String,
      jenisKelamin: json['jenis_kelamin'] as String,
      tanggalLahir: DateTime.parse(json['tanggal_lahir'] as String),
      usia: json['usia'] as String,
      namaIbu: json['nama_ibu'] as String,
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'id': instance.id,
      'nik': instance.nik,
      'nama_anak': instance.namaAnak,
      'jenis_kelamin': instance.jenisKelamin,
      'tanggal_lahir': instance.tanggalLahir.toIso8601String(),
      'usia': instance.usia,
      'nama_ibu': instance.namaIbu,
      'isChecked': instance.isChecked,
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
      itemsPerPage: (json['itemsPerPage'] as num?)?.toInt(),
      totalItems: (json['totalItems'] as num?)?.toInt(),
      currentPage: (json['currentPage'] as num?)?.toInt(),
      totalPages: (json['totalPages'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'itemsPerPage': instance.itemsPerPage,
      'totalItems': instance.totalItems,
      'currentPage': instance.currentPage,
      'totalPages': instance.totalPages,
    };
