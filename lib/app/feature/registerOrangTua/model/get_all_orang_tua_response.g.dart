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
      dusun: Dusun.fromJson(json['dusun'] as Map<String, dynamic>),
      usiaAyah: (json['usia_ayah'] as num).toInt(),
      id: json['id'] as String,
      namaAyah: json['nama_ayah'] as String,
      kartuKeluarga: KartuKeluarga.fromJson(
          json['kartu_keluarga'] as Map<String, dynamic>),
      nik: json['nik'] as String,
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$AyahToJson(Ayah instance) => <String, dynamic>{
      'id': instance.id,
      'nama_ayah': instance.namaAyah,
      'nik': instance.nik,
      'kartu_keluarga': instance.kartuKeluarga,
      'usia_ayah': instance.usiaAyah,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'dusun': instance.dusun,
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
      usiaIbu: (json['usia_ibu'] as num).toInt(),
      nik: json['nik'] as String,
      dusun: Dusun.fromJson(json['dusun'] as Map<String, dynamic>),
      id: json['id'] as String,
      namaIbu: json['nama_ibu'] as String,
      kartuKeluarga: KartuKeluarga.fromJson(
          json['kartu_keluarga'] as Map<String, dynamic>),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$IbuToJson(Ibu instance) => <String, dynamic>{
      'id': instance.id,
      'nama_ibu': instance.namaIbu,
      'nik': instance.nik,
      'usia_ibu': instance.usiaIbu,
      'kartu_keluarga': instance.kartuKeluarga,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'dusun': instance.dusun,
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

Dusun _$DusunFromJson(Map<String, dynamic> json) => Dusun(
      id: json['id'] as String,
      namaDusun: json['nama_dusun'] as String,
      desaKelurahan: DesaKelurahan.fromJson(
          json['desa_kelurahan'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DusunToJson(Dusun instance) => <String, dynamic>{
      'id': instance.id,
      'nama_dusun': instance.namaDusun,
      'desa_kelurahan': instance.desaKelurahan,
    };

DesaKelurahan _$DesaKelurahanFromJson(Map<String, dynamic> json) =>
    DesaKelurahan(
      id: json['id'] as String,
      namaDesaKelurahan: json['nama_desa_kelurahan'] as String,
      kecamatan: Kecamatan.fromJson(json['kecamatan'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DesaKelurahanToJson(DesaKelurahan instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama_desa_kelurahan': instance.namaDesaKelurahan,
      'kecamatan': instance.kecamatan,
    };

Kecamatan _$KecamatanFromJson(Map<String, dynamic> json) => Kecamatan(
      id: json['id'] as String,
      namaKecamatan: json['nama_kecamatan'] as String,
      kabupatenKota: KabupatenKota.fromJson(
          json['kabupaten_kota'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$KecamatanToJson(Kecamatan instance) => <String, dynamic>{
      'id': instance.id,
      'nama_kecamatan': instance.namaKecamatan,
      'kabupaten_kota': instance.kabupatenKota,
    };

KabupatenKota _$KabupatenKotaFromJson(Map<String, dynamic> json) =>
    KabupatenKota(
      id: json['id'] as String,
      namaKabupatenKota: json['nama_kabupaten_kota'] as String,
      provinsi: Provinsi.fromJson(json['provinsi'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$KabupatenKotaToJson(KabupatenKota instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama_kabupaten_kota': instance.namaKabupatenKota,
      'provinsi': instance.provinsi,
    };

Provinsi _$ProvinsiFromJson(Map<String, dynamic> json) => Provinsi(
      id: json['id'] as String,
      namaProvinsi: json['nama_provinsi'] as String,
    );

Map<String, dynamic> _$ProvinsiToJson(Provinsi instance) => <String, dynamic>{
      'id': instance.id,
      'nama_provinsi': instance.namaProvinsi,
    };
