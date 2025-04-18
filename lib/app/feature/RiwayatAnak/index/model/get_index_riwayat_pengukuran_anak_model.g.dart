// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_index_riwayat_pengukuran_anak_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetIndexRiwayatPengukuranAnakModel _$GetIndexRiwayatPengukuranAnakModelFromJson(
        Map<String, dynamic> json) =>
    GetIndexRiwayatPengukuranAnakModel(
      data: (json['data'] as List<dynamic>)
          .map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
      links: Links.fromJson(json['links'] as Map<String, dynamic>),
      message: json['message'] as String,
    );

Map<String, dynamic> _$GetIndexRiwayatPengukuranAnakModelToJson(
        GetIndexRiwayatPengukuranAnakModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'meta': instance.meta,
      'links': instance.links,
      'message': instance.message,
    };

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      id: json['id'] as String,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      nik: json['nik'] as String,
      namaAnak: json['nama_anak'] as String,
      tanggalLahir: DateTime.parse(json['tanggal_lahir'] as String),
      jenisKelamin: $enumDecode(_$JenisKelaminEnumMap, json['jenis_kelamin']),
      kartuKeluarga: KartuKeluarga.fromJson(
          json['kartu_keluarga'] as Map<String, dynamic>),
      posyandu: Posyandu.fromJson(json['posyandu'] as Map<String, dynamic>),
      pengukuran: (json['pengukuran'] as List<dynamic>)
          .map((e) => Pengukuran.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'nik': instance.nik,
      'nama_anak': instance.namaAnak,
      'tanggal_lahir': instance.tanggalLahir.toIso8601String(),
      'jenis_kelamin': _$JenisKelaminEnumMap[instance.jenisKelamin]!,
      'kartu_keluarga': instance.kartuKeluarga,
      'posyandu': instance.posyandu,
      'pengukuran': instance.pengukuran,
    };

const _$JenisKelaminEnumMap = {
  JenisKelamin.LAKI_LAKI: 'Laki-laki',
  JenisKelamin.PEREMPUAN: 'Perempuan',
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

Pengukuran _$PengukuranFromJson(Map<String, dynamic> json) => Pengukuran(
      tempatPengukuran:
          $enumDecode(_$TempatPengukuranEnumMap, json['tempat_pengukuran']),
      tanggalPengukuran: DateTime.parse(json['tanggal_pengukuran'] as String),
    );

Map<String, dynamic> _$PengukuranToJson(Pengukuran instance) =>
    <String, dynamic>{
      'tempat_pengukuran':
          _$TempatPengukuranEnumMap[instance.tempatPengukuran]!,
      'tanggal_pengukuran': instance.tanggalPengukuran.toIso8601String(),
    };

const _$TempatPengukuranEnumMap = {
  TempatPengukuran.POSYANDU: 'Posyandu',
  TempatPengukuran.RUMAH: 'Rumah',
};

Posyandu _$PosyanduFromJson(Map<String, dynamic> json) => Posyandu(
      namaPosyandu: json['nama_posyandu'] as String,
    );

Map<String, dynamic> _$PosyanduToJson(Posyandu instance) => <String, dynamic>{
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
