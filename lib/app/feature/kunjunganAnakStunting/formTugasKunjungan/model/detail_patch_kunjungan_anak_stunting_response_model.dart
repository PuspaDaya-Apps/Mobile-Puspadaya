import 'package:json_annotation/json_annotation.dart';

// part 'detail_kunjungan_anak_stunting_response_model.g.dart';

//@JsonSerializable()
class ErrorMessage {
  String message;

  ErrorMessage({
    required this.message,
  });

  factory ErrorMessage.fromJson(Map<String, dynamic> json) => _$ErrorMessageFromJson(json);

  Map<String, dynamic> toJson()=>_$ErrorMessageToJson(this);
}

//@JsonSerializable()
class DetailPatchKunjunganAnakStuntingResponseModel {
  String id;
  @JsonKey(name: 'tanggal_kunjungan')
  DateTime tanggalKunjungan;
  @JsonKey(name: 'mulai_pada')
  DateTime mulaiPada;
  @JsonKey(name: 'selesai_pada')
  DateTime selesaiPada;
  @JsonKey(name: 'jarak_total')
  String jarakTotal;
  Anak anak;

  DetailPatchKunjunganAnakStuntingResponseModel({
    required this.id,
    required this.tanggalKunjungan,
    required this.mulaiPada,
    required this.selesaiPada,
    required this.jarakTotal,
    required this.anak
  });

  factory DetailPatchKunjunganAnakStuntingResponseModel.fromJson(Map<String, dynamic> json) => _$DetailPatchKunjunganAnakStuntingResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$DetailPatchKunjunganAnakStuntingResponseModelToJson(this);
}

//@JsonSerializable()
class Anak {
  String id;
  @JsonKey(name: 'nama_anak')
  String namaAnak;
  String nik;
  @JsonKey(name: 'jarak_posyandu')
  String jarakPosyandu;

  Anak({
    required this.id,
    required this.namaAnak,
    required this.nik,
    required this.jarakPosyandu,
  });

  factory Anak.fromJson(Map<String, dynamic> json) => _$AnakFromJson(json);

  Map<String, dynamic> toJson()=>_$AnakToJson(this);
}


ErrorMessage _$ErrorMessageFromJson(Map<String, dynamic> json) => ErrorMessage(
      message: json['message'] as String,
    );

Map<String, dynamic> _$ErrorMessageToJson(ErrorMessage instance) =>
    <String, dynamic>{
      'message': instance.message,
    };

DetailPatchKunjunganAnakStuntingResponseModel
    _$DetailPatchKunjunganAnakStuntingResponseModelFromJson(
            Map<String, dynamic> json) =>
        DetailPatchKunjunganAnakStuntingResponseModel(
          id: json['id'] as String,
          tanggalKunjungan: DateTime.parse(json['tanggal_kunjungan'] as String),
          mulaiPada: DateTime.parse("${json['tanggal_kunjungan']} ${json['mulai_pada']}"),
          selesaiPada: DateTime.parse("${json['tanggal_kunjungan']} ${json['selesai_pada']}"),
          anak: Anak.fromJson(json['anak'] as Map<String, dynamic>),
          jarakTotal: json['jarak_total'] as String
        );

Map<String, dynamic> _$DetailPatchKunjunganAnakStuntingResponseModelToJson(
        DetailPatchKunjunganAnakStuntingResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tanggal_kunjungan': instance.tanggalKunjungan.toIso8601String(),
      'mulai_pada': instance.mulaiPada.toIso8601String(),
      'selesai_pada': instance.selesaiPada.toIso8601String(),
      'anak': instance.anak,
      'jarak_total': instance.jarakTotal,
    };

Anak _$AnakFromJson(Map<String, dynamic> json) => Anak(
      id: json['id'] as String,
      namaAnak: json['nama_anak'] as String,
      nik: json['nik'] as String,
      jarakPosyandu: json['jarak_posyandu'] as String,
    );

Map<String, dynamic> _$AnakToJson(Anak instance) => <String, dynamic>{
      'id': instance.id,
      'nama_anak': instance.namaAnak,
      'nik': instance.nik,
      'jarak_posyandu': instance.jarakPosyandu,
    };
