import 'package:json_annotation/json_annotation.dart';

// part 'jadwal_home_response_model.g.dart';

// @JsonSerializable()
class JadwalHomeResponseModel {
  String message;
  String? error;
  List<Data>? data;

  JadwalHomeResponseModel({
    required this.message,
    this.error,
    this.data   
  });

   factory JadwalHomeResponseModel.fromJson(Map<String, dynamic> json) => _$JadwalHomeResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$JadwalHomeResponseModelToJson(this);
}

// @JsonSerializable()
class Data {
  String id;
  @JsonKey(name: 'nama_kegiatan')
  String namaKegiatan;
  @JsonKey(name: 'tanggal_pelaksanaan')
  DateTime tanggalPelaksanaan;
  @JsonKey(name: 'waktu_mulai')
  DateTime waktuMulai;
  @JsonKey(name: 'waktu_selesai')
  DateTime waktuSelesai;
  String lokasi;

  Data({
    required this.id,
    required this.namaKegiatan,
    required this.tanggalPelaksanaan,
    required this.waktuMulai,
    required this.waktuSelesai,
    required this.lokasi,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson()=>_$DataToJson(this);
}

JadwalHomeResponseModel _$JadwalHomeResponseModelFromJson(
        Map<String, dynamic> json) =>
    JadwalHomeResponseModel(
      message: json['message'] as String,
      error: json['error'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$JadwalHomeResponseModelToJson(
        JadwalHomeResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'error': instance.error,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as String,
      namaKegiatan: json['nama_kegiatan'] as String,
      tanggalPelaksanaan: DateTime.parse(json['tanggal_pelaksanaan'] as String),
      waktuMulai: DateTime.parse("${json['tanggal_pelaksanaan']} ${json['waktu_mulai']}"),
      waktuSelesai: DateTime.parse("${json['tanggal_pelaksanaan']} ${json['waktu_selesai']}"),
      lokasi: json['lokasi'] as String,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'nama_kegiatan': instance.namaKegiatan,
      'tanggal_pelaksanaan': instance.tanggalPelaksanaan.toIso8601String(),
      'waktu_mulai': instance.waktuMulai.toIso8601String(),
      'waktu_selesai': instance.waktuSelesai.toIso8601String(),
      'lokasi': instance.lokasi,
    };
