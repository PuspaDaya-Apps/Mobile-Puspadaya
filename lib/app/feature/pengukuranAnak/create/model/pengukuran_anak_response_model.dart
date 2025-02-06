import 'package:json_annotation/json_annotation.dart';

// part 'pengukuran_anak_response_model.g.dart';

// @JsonSerializable()
class PengukuranAnakResponseModel {
  String message;
  String? error;
  Data? data;

  PengukuranAnakResponseModel({
    required this.message,
    this.error,
    this.data
  });

  factory PengukuranAnakResponseModel.fromJson(Map<String, dynamic> json) => _$PengukuranAnakResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$PengukuranAnakResponseModelToJson(this);
}

// @JsonSerializable()
class Data {
  Anak anak;
  @JsonKey(name: 'status_stunting')
  String statusStunting;
  @JsonKey(name: 'status_gizi')
  StatusGizi statusGizi;

  Data({
    required this.anak,
    required this.statusStunting,
    required this.statusGizi
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson()=>_$DataToJson(this);
}

// @JsonSerializable()
class Anak {
  String nama;
  String nik;

  Anak({
    required this.nama,
    required this.nik
  });

  factory Anak.fromJson(Map<String, dynamic> json) => _$AnakFromJson(json);

  Map<String, dynamic> toJson()=>_$AnakToJson(this);
}

// @JsonSerializable()
class StatusGizi {
  @JsonKey(name: 'status_gizi')
  String statusGizi;
  @JsonKey(name: 'status_wasting')
  String statusWasting;

  StatusGizi({
    required this.statusGizi,
    required this.statusWasting
  });

  factory StatusGizi.fromJson(Map<String, dynamic> json) => _$StatusGiziFromJson(json);

  Map<String, dynamic> toJson()=>_$StatusGiziToJson(this);
}

PengukuranAnakResponseModel _$PengukuranAnakResponseModelFromJson(
        Map<String, dynamic> json) =>
    PengukuranAnakResponseModel(
      message: json['message'] as String,
      error: json['error'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PengukuranAnakResponseModelToJson(
        PengukuranAnakResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'error': instance.error,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      anak: Anak.fromJson(json['anak'] as Map<String, dynamic>),
      statusStunting: json['status_stunting'] as String,
      statusGizi:
          StatusGizi.fromJson(json['status_gizi'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'anak': instance.anak,
      'status_stunting': instance.statusStunting,
      'status_gizi': instance.statusGizi,
    };

Anak _$AnakFromJson(Map<String, dynamic> json) => Anak(
      nama: json['nama'] as String,
      nik: json['nik'] as String,
    );

Map<String, dynamic> _$AnakToJson(Anak instance) => <String, dynamic>{
      'nama': instance.nama,
      'nik': instance.nik,
    };

StatusGizi _$StatusGiziFromJson(Map<String, dynamic> json) => StatusGizi(
      statusGizi: json['status_gizi'] as String,
      statusWasting: json['status_wasting'] as String,
    );

Map<String, dynamic> _$StatusGiziToJson(StatusGizi instance) =>
    <String, dynamic>{
      'status_gizi': instance.statusGizi,
      'status_wasting': instance.statusWasting,
    };