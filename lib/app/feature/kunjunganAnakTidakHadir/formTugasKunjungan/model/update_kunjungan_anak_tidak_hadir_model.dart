import 'package:json_annotation/json_annotation.dart';

import '../../../maps/model/lokasi.dart';

// part 'update_kunjungan_anak_tidak_hadir_model.g.dart';

// @JsonSerializable()
class UpdateKunjunganAnakTidakHadirModel {
  @JsonKey(name: 'status_kunjungan')
  String statusKunjungan;
  @JsonKey(name: 'selesai_pada')
  String selesaiPada;
  @JsonKey(name: 'lokasi_selesai')
  Lokasi lokasiSelesai;

  UpdateKunjunganAnakTidakHadirModel({
    required this.selesaiPada,
    required this.statusKunjungan,
    required this.lokasiSelesai
  });

  factory UpdateKunjunganAnakTidakHadirModel.fromJson(Map<String, dynamic> json) => _$UpdateKunjunganAnakTidakHadirModelFromJson(json);

  Map<String, dynamic> toJson()=>_$UpdateKunjunganAnakTidakHadirModelToJson(this);
}

UpdateKunjunganAnakTidakHadirModel _$UpdateKunjunganAnakTidakHadirModelFromJson(
        Map<String, dynamic> json) =>
    UpdateKunjunganAnakTidakHadirModel(
      selesaiPada: json['selesai_pada'] as String,
      statusKunjungan: json['status_kunjungan'] as String,
      lokasiSelesai: Lokasi.fromJson(json['lokasi_selesai'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateKunjunganAnakTidakHadirModelToJson(
        UpdateKunjunganAnakTidakHadirModel instance) =>
    <String, dynamic>{
      'status_kunjungan': instance.statusKunjungan,
      'selesai_pada':instance.selesaiPada,
      'lokasi_selesai': instance.lokasiSelesai,
    };
