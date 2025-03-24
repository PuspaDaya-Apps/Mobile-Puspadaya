// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_detail_kehadiran_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDetailKehadiranModel _$GetDetailKehadiranModelFromJson(
        Map<String, dynamic> json) =>
    GetDetailKehadiranModel(
      message: json['message'] as String,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetDetailKehadiranModelToJson(
        GetDetailKehadiranModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'],
      tanggalPelaksanaan: DateTime.parse(json['tanggal_pelaksanaan'] as String),
      waktuMulai: json['waktu_mulai'] as String,
      waktuSelesai: json['waktu_selesai'] as String,
      durasi: json['durasi'] as String,
      statusKegiatan: json['status_kegiatan'] as String,
      posyandu: Posyandu.fromJson(json['posyandu'] as Map<String, dynamic>),
      kehadiranAnak: (json['kehadiran_anak'] as List<dynamic>)
          .map((e) => KehadiranAnak.fromJson(e as Map<String, dynamic>))
          .toList(),
      kehadiranIbuHamil: (json['kehadiran_ibu_hamil'] as List<dynamic>)
          .map((e) => KehadiranIbuHamil.fromJson(e as Map<String, dynamic>))
          .toList(),
      kehadiranTamu: (json['kehadiran_tamu'] as List<dynamic>)
          .map((e) => KehadiranTamu.fromJson(e as Map<String, dynamic>))
          .toList(),
      tidakHadir:
          TidakHadir.fromJson(json['tidak_hadir'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'deleted_at': instance.deletedAt,
      'tanggal_pelaksanaan': instance.tanggalPelaksanaan.toIso8601String(),
      'waktu_mulai': instance.waktuMulai,
      'waktu_selesai': instance.waktuSelesai,
      'durasi': instance.durasi,
      'status_kegiatan': instance.statusKegiatan,
      'posyandu': instance.posyandu,
      'kehadiran_anak': instance.kehadiranAnak,
      'kehadiran_ibu_hamil': instance.kehadiranIbuHamil,
      'kehadiran_tamu': instance.kehadiranTamu,
      'tidak_hadir': instance.tidakHadir,
    };

KehadiranAnak _$KehadiranAnakFromJson(Map<String, dynamic> json) =>
    KehadiranAnak(
      namaIbu: json['nama_ibu'] as String,
      id: json['id'] as String,
      anakId: json['anak_id'] as String,
      namaAnak: json['nama_anak'] as String,
      nik: json['nik'] as String,
    );

Map<String, dynamic> _$KehadiranAnakToJson(KehadiranAnak instance) =>
    <String, dynamic>{
      'id': instance.id,
      'anak_id': instance.anakId,
      'nama_anak': instance.namaAnak,
      'nik': instance.nik,
      'nama_ibu': instance.namaIbu,
    };

KehadiranIbuHamil _$KehadiranIbuHamilFromJson(Map<String, dynamic> json) =>
    KehadiranIbuHamil(
      id: json['id'] as String,
      ibuHamilId: json['ibu_hamil_id'] as String,
      namaIbuHamil: json['nama_ibu_hamil'] as String,
      nik: json['nik'] as String,
    );

Map<String, dynamic> _$KehadiranIbuHamilToJson(KehadiranIbuHamil instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ibu_hamil_id': instance.ibuHamilId,
      'nama_ibu_hamil': instance.namaIbuHamil,
      'nik': instance.nik,
    };

KehadiranTamu _$KehadiranTamuFromJson(Map<String, dynamic> json) =>
    KehadiranTamu(
      id: json['id'] as String,
      anakId: json['anak_id'] as String,
      namaAnak: json['nama_anak'] as String,
      posyanduAsal: json['posyandu_asal'] as String,
    );

Map<String, dynamic> _$KehadiranTamuToJson(KehadiranTamu instance) =>
    <String, dynamic>{
      'id': instance.id,
      'anak_id': instance.anakId,
      'nama_anak': instance.namaAnak,
      'posyandu_asal': instance.posyanduAsal,
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

TidakHadir _$TidakHadirFromJson(Map<String, dynamic> json) => TidakHadir(
      anak: (json['anak'] as List<dynamic>)
          .map((e) => AnakTidakHadir.fromJson(e as Map<String, dynamic>))
          .toList(),
      ibuHamil: (json['ibu_hamil'] as List<dynamic>)
          .map((e) => IbuHamilTidakHadir.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TidakHadirToJson(TidakHadir instance) =>
    <String, dynamic>{
      'anak': instance.anak,
      'ibu_hamil': instance.ibuHamil,
    };

AnakTidakHadir _$AnakTidakHadirFromJson(Map<String, dynamic> json) =>
    AnakTidakHadir(
      id: json['id'] as String,
      namaAnak: json['nama_anak'] as String,
      nik: json['nik'] as String,
      namaIbu: json['nama_ibu'] as String,
    );

Map<String, dynamic> _$AnakTidakHadirToJson(AnakTidakHadir instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama_anak': instance.namaAnak,
      'nik': instance.nik,
      'nama_ibu': instance.namaIbu,
    };

IbuHamilTidakHadir _$IbuHamilTidakHadirFromJson(Map<String, dynamic> json) =>
    IbuHamilTidakHadir(
      id: json['id'] as String,
      namaIbuHamil: json['nama_ibu_hamil'] as String,
      nik: json['nik'] as String,
    );

Map<String, dynamic> _$IbuHamilTidakHadirToJson(IbuHamilTidakHadir instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama_ibu_hamil': instance.namaIbuHamil,
      'nik': instance.nik,
    };
