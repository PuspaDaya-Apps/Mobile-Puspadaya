import 'package:json_annotation/json_annotation.dart';

// part 'update_kunjungan_anak_tidak_hadir_model.g.dart';

// @JsonSerializable()
class UpdateKunjunganAnakTidakHadirModel {
  @JsonKey(name: 'status_kunjungan')
  String statusKunjungan;
  @JsonKey(name: 'selesai_pada')
  String selesaiPada;

  UpdateKunjunganAnakTidakHadirModel({
    required this.selesaiPada,
    required this.statusKunjungan
  });

  factory UpdateKunjunganAnakTidakHadirModel.fromJson(Map<String, dynamic> json) => _$UpdateKunjunganAnakTidakHadirModelFromJson(json);

  Map<String, dynamic> toJson()=>_$UpdateKunjunganAnakTidakHadirModelToJson(this);
}

UpdateKunjunganAnakTidakHadirModel _$UpdateKunjunganAnakTidakHadirModelFromJson(
        Map<String, dynamic> json) =>
    UpdateKunjunganAnakTidakHadirModel(
      selesaiPada: json['selesai_pada'] as String,
      statusKunjungan: json['status_kunjungan'] as String,
    );

Map<String, dynamic> _$UpdateKunjunganAnakTidakHadirModelToJson(
        UpdateKunjunganAnakTidakHadirModel instance) =>
    <String, dynamic>{
      'status_kunjungan': instance.statusKunjungan,
      'selesai_pada':instance.selesaiPada,
    };
