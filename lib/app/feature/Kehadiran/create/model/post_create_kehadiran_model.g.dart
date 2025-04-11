// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_create_kehadiran_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostCreateKehadiranModel _$PostCreateKehadiranModelFromJson(
        Map<String, dynamic> json) =>
    PostCreateKehadiranModel(
      tanggalPelaksanaan: json['tanggal_pelaksanaan'] as String,
      waktuMulai: json['waktu_mulai'] as String,
      waktuSelesai: json['waktu_selesai'] as String,
      durasi: json['durasi'] as String,
      statusKegiatan: json['status_kegiatan'] as String,
      kehadiranAnak: (json['kehadiran_anak'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      kehadiranIbuHamil: (json['kehadiran_ibu_hamil'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      kehadiranTamu: (json['kehadiran_tamu'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$PostCreateKehadiranModelToJson(
        PostCreateKehadiranModel instance) =>
    <String, dynamic>{
      'tanggal_pelaksanaan': instance.tanggalPelaksanaan,
      'waktu_mulai': instance.waktuMulai,
      'waktu_selesai': instance.waktuSelesai,
      'durasi': instance.durasi,
      'status_kegiatan': instance.statusKegiatan,
      'kehadiran_anak': instance.kehadiranAnak,
      'kehadiran_ibu_hamil': instance.kehadiranIbuHamil,
      'kehadiran_tamu': instance.kehadiranTamu,
    };
