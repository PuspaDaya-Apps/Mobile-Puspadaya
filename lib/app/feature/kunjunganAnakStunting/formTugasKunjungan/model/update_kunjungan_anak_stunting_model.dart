import 'package:json_annotation/json_annotation.dart';

// part 'update_kunjungan_anak_stunting_model.g.dart';

// @JsonSerializable()
class UpdateKunjunganAnakStuntingModel {
  @JsonKey(name: 'status_kunjungan')
  String statusKunjungan;
  @JsonKey(name: 'selesai_pada')
  String selesaiPada;

  UpdateKunjunganAnakStuntingModel({
    required this.selesaiPada,
    required this.statusKunjungan
  });

  factory UpdateKunjunganAnakStuntingModel.fromJson(Map<String, dynamic> json) => _$UpdateKunjunganAnakStuntingModelFromJson(json);

  Map<String, dynamic> toJson()=>_$UpdateKunjunganAnakStuntingModelToJson(this);
}

UpdateKunjunganAnakStuntingModel _$UpdateKunjunganAnakStuntingModelFromJson(
        Map<String, dynamic> json) =>
    UpdateKunjunganAnakStuntingModel(
      selesaiPada: json['selesai_pada'] as String,
      statusKunjungan: json['status_kunjungan'] as String,
    );

Map<String, dynamic> _$UpdateKunjunganAnakStuntingModelToJson(
        UpdateKunjunganAnakStuntingModel instance) =>
    <String, dynamic>{
      'status_kunjungan': instance.statusKunjungan,
      'selesai_pada':instance.selesaiPada,
    };
