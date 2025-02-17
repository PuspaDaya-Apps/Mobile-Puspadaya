// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_jadwal_posyandu_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDataJadwalPosyandu _$GetDataJadwalPosyanduFromJson(
        Map<String, dynamic> json) =>
    GetDataJadwalPosyandu(
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetDataJadwalPosyanduToJson(
        GetDataJadwalPosyandu instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      id: json['id'] as String,
      namaKegiatan: json['nama_kegiatan'] as String,
      tanggalPelaksanaan: DateTime.parse(json['tanggal_pelaksanaan'] as String),
      waktuMulai: json['waktu_mulai'] as String,
      waktuSelesai: json['waktu_selesai'] as String,
      lokasi: json['lokasi'] as String,
      posyandu: Posyandu.fromJson(json['posyandu'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
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
