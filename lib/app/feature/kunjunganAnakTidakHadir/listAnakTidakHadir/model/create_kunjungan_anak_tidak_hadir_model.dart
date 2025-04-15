import 'package:json_annotation/json_annotation.dart';

// part 'create_kunjungan_anak_tidak_hadir_model.g.dart';

// @JsonSerializable()
class CreateKunjunganAnakTidakHadirModel {
  @JsonKey(name: 'jenis_kunjungan')
  String jenisKunjungan;
  @JsonKey(name: 'anak_id')
  String anakId;
  @JsonKey(name: 'mulai_pada')
  String mulaiPada;
  @JsonKey(name: 'tanggal_kunjungan')
  DateTime tanggalKunjungan;

  CreateKunjunganAnakTidakHadirModel({
    this.jenisKunjungan = "Anak Tidak Hadir",
    required this.anakId,
    required this.mulaiPada,
    required this.tanggalKunjungan
  });

  factory CreateKunjunganAnakTidakHadirModel.fromJson(Map<String, dynamic> json) => _$CreateKunjunganAnakTidakHadirModelFromJson(json);

  Map<String, dynamic> toJson()=>_$CreateKunjunganAnakTidakHadirModelToJson(this);
}

CreateKunjunganAnakTidakHadirModel _$CreateKunjunganAnakTidakHadirModelFromJson(
        Map<String, dynamic> json) =>
    CreateKunjunganAnakTidakHadirModel(
      jenisKunjungan: json['jenis_kunjungan'] as String,
      anakId: json['anak_id'] as String,
      mulaiPada: json['mulai_pada'] as String,
      tanggalKunjungan: DateTime.parse(json['tanggal_kunjungan'] as String),
    );

Map<String, dynamic> _$CreateKunjunganAnakTidakHadirModelToJson(
        CreateKunjunganAnakTidakHadirModel instance) =>
    <String, dynamic>{
      'jenis_kunjungan': instance.jenisKunjungan,
      'anak_id': instance.anakId,
      'mulai_pada': instance.mulaiPada,
      'tanggal_kunjungan': instance.tanggalKunjungan.toIso8601String(),
    };
