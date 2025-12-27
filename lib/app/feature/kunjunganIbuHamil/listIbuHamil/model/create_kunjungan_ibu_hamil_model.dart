import 'package:json_annotation/json_annotation.dart';

import '../../../maps/model/lokasi.dart';

// part 'create_kunjungan_ibu_hamil_model.g.dart';

// @JsonSerializable()
class CreateKunjunganIbuHamilModel {
  @JsonKey(name: 'jenis_kunjungan')
  String jenisKunjungan;
  @JsonKey(name: 'ibu_hamil_id')
  String ibuHamilId;
  @JsonKey(name: 'mulai_pada')
  String mulaiPada;
  @JsonKey(name: 'tanggal_kunjungan')
  DateTime tanggalKunjungan;
  @JsonKey(name: 'lokasi_start')
  Lokasi lokasiStart;

  CreateKunjunganIbuHamilModel({
    this.jenisKunjungan = "Ibu Hamil",
    required this.ibuHamilId,
    required this.mulaiPada,
    required this.tanggalKunjungan,
    required this.lokasiStart
  });

  factory CreateKunjunganIbuHamilModel.fromJson(Map<String, dynamic> json) => _$CreateKunjunganIbuHamilModelFromJson(json);

  Map<String, dynamic> toJson()=>_$CreateKunjunganIbuHamilModelToJson(this);
}

CreateKunjunganIbuHamilModel _$CreateKunjunganIbuHamilModelFromJson(
        Map<String, dynamic> json) =>
    CreateKunjunganIbuHamilModel(
      jenisKunjungan: json['jenis_kunjungan'] as String,
      ibuHamilId: json['ibu_hamil_id'] as String,
      mulaiPada: json['mulai_pada'] as String,
      tanggalKunjungan: DateTime.parse(json['tanggal_kunjungan'] as String),
      lokasiStart: Lokasi.fromJson(json['lokasi_start'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateKunjunganIbuHamilModelToJson(
        CreateKunjunganIbuHamilModel instance) =>
    <String, dynamic>{
      'jenis_kunjungan': instance.jenisKunjungan,
      'ibu_hamil_id': instance.ibuHamilId,
      'mulai_pada': instance.mulaiPada,
      'tanggal_kunjungan': instance.tanggalKunjungan.toIso8601String(),
      'lokasi_start': instance.lokasiStart,
    };
