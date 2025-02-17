// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_detail_jadwal_posyandu_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDetailJadwalPosyanduModel _$GetDetailJadwalPosyanduModelFromJson(
        Map<String, dynamic> json) =>
    GetDetailJadwalPosyanduModel(
      message: json['message'] as String,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetDetailJadwalPosyanduModelToJson(
        GetDetailJadwalPosyanduModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as String,
      namaKegiatan: json['nama_kegiatan'] as String,
      tanggalPelaksanaan: DateTime.parse(json['tanggal_pelaksanaan'] as String),
      waktuMulai: json['waktu_mulai'] as String,
      waktuSelesai: json['waktu_selesai'] as String,
      lokasi: json['lokasi'] as String,
      posyandu: Posyandu.fromJson(json['posyandu'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'nama_kegiatan': instance.namaKegiatan,
      'tanggal_pelaksanaan': instance.tanggalPelaksanaan.toIso8601String(),
      'waktu_mulai': instance.waktuMulai,
      'waktu_selesai': instance.waktuSelesai,
      'lokasi': instance.lokasi,
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
