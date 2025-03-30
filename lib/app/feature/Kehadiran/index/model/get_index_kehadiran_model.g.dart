// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_index_kehadiran_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetIndexKehadiranModel _$GetIndexKehadiranModelFromJson(
        Map<String, dynamic> json) =>
    GetIndexKehadiranModel(
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
      links: Links.fromJson(json['links'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetIndexKehadiranModelToJson(
        GetIndexKehadiranModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
      'meta': instance.meta,
      'links': instance.links,
    };

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      id: json['id'] as String,
      tanggalPelaksanaan: DateTime.parse(json['tanggal_pelaksanaan'] as String),
      waktuMulai: json['waktu_mulai'] as String,
      waktuSelesai: json['waktu_selesai'] as String,
      durasi: json['durasi'] as String,
      statusKegiatan: json['status_kegiatan'] as String,
      posyandu: Posyandu.fromJson(json['posyandu'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'id': instance.id,
      'tanggal_pelaksanaan': instance.tanggalPelaksanaan.toIso8601String(),
      'waktu_mulai': instance.waktuMulai,
      'waktu_selesai': instance.waktuSelesai,
      'durasi': instance.durasi,
      'status_kegiatan': instance.statusKegiatan,
      'posyandu': instance.posyandu,
    };

Posyandu _$PosyanduFromJson(Map<String, dynamic> json) => Posyandu(
      id: json['id'] as String,
      namaPosyandu: json['nama_posyandu'] as String,
    );

Map<String, dynamic> _$PosyanduToJson(Posyandu instance) => <String, dynamic>{
      'id': instance.id,
      'nama_posyandu': instance.namaPosyandu,
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
