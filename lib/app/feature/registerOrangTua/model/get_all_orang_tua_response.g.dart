// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_orang_tua_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllOrangTuaResponse _$GetAllOrangTuaResponseFromJson(
        Map<String, dynamic> json) =>
    GetAllOrangTuaResponse(
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
      links: Links.fromJson(json['links'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetAllOrangTuaResponseToJson(
        GetAllOrangTuaResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
      'meta': instance.meta,
      'links': instance.links,
    };

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      ayah: Ayah.fromJson(json['ayah'] as Map<String, dynamic>),
      ibu: Ibu.fromJson(json['ibu'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'ayah': instance.ayah,
      'ibu': instance.ibu,
    };

Ayah _$AyahFromJson(Map<String, dynamic> json) => Ayah(
      id: json['id'] as String,
      namaAyah: json['nama_ayah'] as String,
      kartuKeluarga: KartuKeluarga.fromJson(
          json['kartu_keluarga'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AyahToJson(Ayah instance) => <String, dynamic>{
      'id': instance.id,
      'nama_ayah': instance.namaAyah,
      'kartu_keluarga': instance.kartuKeluarga,
    };

KartuKeluarga _$KartuKeluargaFromJson(Map<String, dynamic> json) =>
    KartuKeluarga(
      id: json['id'] as String,
      nomorKartuKeluarga: json['nomor_kartu_keluarga'] as String,
    );

Map<String, dynamic> _$KartuKeluargaToJson(KartuKeluarga instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nomor_kartu_keluarga': instance.nomorKartuKeluarga,
    };

Ibu _$IbuFromJson(Map<String, dynamic> json) => Ibu(
      id: json['id'] as String,
      namaIbu: json['nama_ibu'] as String,
      kartuKeluarga: KartuKeluarga.fromJson(
          json['kartu_keluarga'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IbuToJson(Ibu instance) => <String, dynamic>{
      'id': instance.id,
      'nama_ibu': instance.namaIbu,
      'kartu_keluarga': instance.kartuKeluarga,
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
