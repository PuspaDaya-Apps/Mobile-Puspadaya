// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patch_jadwal_posyandu_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatchJadwalPosyanduModel _$PatchJadwalPosyanduModelFromJson(
        Map<String, dynamic> json) =>
    PatchJadwalPosyanduModel(
      tanggalPelaksanaan: DateTime.parse(json['tanggal_pelaksanaan'] as String),
      waktuMulai: json['waktu_mulai'] as String,
      waktuSelesai: json['waktu_selesai'] as String,
      lokasi: json['lokasi'] as String,
      namaKegiatan: json['nama_kegiatan'] as String,
    );

Map<String, dynamic> _$PatchJadwalPosyanduModelToJson(
        PatchJadwalPosyanduModel instance) =>
    <String, dynamic>{
      'tanggal_pelaksanaan': instance.tanggalPelaksanaan.toIso8601String(),
      'waktu_mulai': instance.waktuMulai,
      'waktu_selesai': instance.waktuSelesai,
      'lokasi': instance.lokasi,
      'nama_kegiatan': instance.namaKegiatan,
    };
