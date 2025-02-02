// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_detail_anak_by_id_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDetailAnakByIdResponse _$GetDetailAnakByIdResponseFromJson(
        Map<String, dynamic> json) =>
    GetDetailAnakByIdResponse(
      message: json['message'] as String,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetDetailAnakByIdResponseToJson(
        GetDetailAnakByIdResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'],
      nik: json['nik'] as String,
      namaAnak: json['nama_anak'] as String,
      tempatLahir: json['tempat_lahir'] as String,
      anakKe: (json['anak_ke'] as num).toInt(),
      tanggalLahir: DateTime.parse(json['tanggal_lahir'] as String),
      jenisKelamin: json['jenis_kelamin'] as String,
      beratBadanLahir: json['berat_badan_lahir'] as String,
      tinggiBadanLahir: json['tinggi_badan_lahir'] as String,
      lingkarLenganAtasLahir: json['lingkar_lengan_atas_lahir'] as String,
      lingkarKepalaLahir: json['lingkar_kepala_lahir'] as String,
      caraLahir: json['cara_lahir'] as String,
      statusKelahiran: json['status_kelahiran'] as String,
      statusStunting: json['status_stunting'] as String,
      statusGizi: json['status_gizi'] as String,
      statusWasting: json['status_wasting'] as String,
      statusOrangTua: json['status_orang_tua'] as String,
      jenisDisabilitas: (json['jenis_disabilitas'] as List<dynamic>?)
          ?.map((e) => JenisDisabilitas.fromJson(e as Map<String, dynamic>))
          .toList(),
      kartuKeluarga: KartuKeluarga.fromJson(
          json['kartu_keluarga'] as Map<String, dynamic>),
      pengasuhAnak: json['pengasuhAnak'],
      posyandu: Posyandu.fromJson(json['posyandu'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'deleted_at': instance.deletedAt,
      'nik': instance.nik,
      'nama_anak': instance.namaAnak,
      'tempat_lahir': instance.tempatLahir,
      'anak_ke': instance.anakKe,
      'tanggal_lahir': instance.tanggalLahir.toIso8601String(),
      'jenis_kelamin': instance.jenisKelamin,
      'berat_badan_lahir': instance.beratBadanLahir,
      'tinggi_badan_lahir': instance.tinggiBadanLahir,
      'lingkar_lengan_atas_lahir': instance.lingkarLenganAtasLahir,
      'lingkar_kepala_lahir': instance.lingkarKepalaLahir,
      'cara_lahir': instance.caraLahir,
      'status_kelahiran': instance.statusKelahiran,
      'status_stunting': instance.statusStunting,
      'status_gizi': instance.statusGizi,
      'status_wasting': instance.statusWasting,
      'status_orang_tua': instance.statusOrangTua,
      'jenis_disabilitas': instance.jenisDisabilitas,
      'kartu_keluarga': instance.kartuKeluarga,
      'pengasuhAnak': instance.pengasuhAnak,
      'posyandu': instance.posyandu,
    };

JenisDisabilitas _$JenisDisabilitasFromJson(Map<String, dynamic> json) =>
    JenisDisabilitas(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'],
      namaDisabilitas: json['nama_disabilitas'] as String,
    );

Map<String, dynamic> _$JenisDisabilitasToJson(JenisDisabilitas instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'deleted_at': instance.deletedAt,
      'nama_disabilitas': instance.namaDisabilitas,
    };

KartuKeluarga _$KartuKeluargaFromJson(Map<String, dynamic> json) =>
    KartuKeluarga(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'],
      nomorKartuKeluarga: json['nomor_kartu_keluarga'] as String,
    );

Map<String, dynamic> _$KartuKeluargaToJson(KartuKeluarga instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'deleted_at': instance.deletedAt,
      'nomor_kartu_keluarga': instance.nomorKartuKeluarga,
    };

Posyandu _$PosyanduFromJson(Map<String, dynamic> json) => Posyandu(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'],
      namaPosyandu: json['nama_posyandu'] as String,
      alamat: json['alamat'],
    );

Map<String, dynamic> _$PosyanduToJson(Posyandu instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'deleted_at': instance.deletedAt,
      'nama_posyandu': instance.namaPosyandu,
      'alamat': instance.alamat,
    };
