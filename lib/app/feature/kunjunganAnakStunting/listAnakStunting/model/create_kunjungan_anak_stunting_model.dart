import 'package:json_annotation/json_annotation.dart';

// part 'create_kunjungan_anak_stunting_model.g.dart';

// @JsonSerializable()
class CreateKunjunganAnakStuntingModel {
  @JsonKey(name: 'jenis_kunjungan')
  String jenisKunjungan;
  @JsonKey(name: 'anak_id')
  String anakId;
  @JsonKey(name: 'mulai_pada')
  String mulaiPada;
  // @JsonKey(name: 'j
  @JsonKey(name: 'tanggal_kunjungan')
  DateTime tanggalKunjungan;

  CreateKunjunganAnakStuntingModel({
    this.jenisKunjungan = "Anak Stunting",
    required this.anakId,
    required this.mulaiPada,
    required this.tanggalKunjungan
  });

  factory CreateKunjunganAnakStuntingModel.fromJson(Map<String, dynamic> json) => _$CreateKunjunganAnakStuntingModelFromJson(json);

  Map<String, dynamic> toJson()=>_$CreateKunjunganAnakStuntingModelToJson(this);
}

CreateKunjunganAnakStuntingModel _$CreateKunjunganAnakStuntingModelFromJson(
        Map<String, dynamic> json) =>
    CreateKunjunganAnakStuntingModel(
      jenisKunjungan: json['jenis_kunjungan'] as String,
      anakId: json['anak_id'] as String,
      mulaiPada: json['mulai_pada'] as String,
      tanggalKunjungan: DateTime.parse(json['tanggal_kunjungan'] as String),
    );

Map<String, dynamic> _$CreateKunjunganAnakStuntingModelToJson(
        CreateKunjunganAnakStuntingModel instance) =>
    <String, dynamic>{
      'jenis_kunjungan': instance.jenisKunjungan,
      'anak_id': instance.anakId,
      'mulai_pada': instance.mulaiPada,
      'tanggal_kunjungan': instance.tanggalKunjungan.toIso8601String(),
    };
