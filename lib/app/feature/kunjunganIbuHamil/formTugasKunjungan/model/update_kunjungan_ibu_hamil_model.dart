import 'package:json_annotation/json_annotation.dart';

// part 'update_kunjungan_ibu_hamil_model.g.dart';

// @JsonSerializable()
class UpdateKunjunganIbuHamilModel {
  @JsonKey(name: 'status_kunjungan')
  String statusKunjungan;
  @JsonKey(name: 'selesai_pada')
  String selesaiPada;

  UpdateKunjunganIbuHamilModel({
    required this.selesaiPada,
    required this.statusKunjungan
  });

  factory UpdateKunjunganIbuHamilModel.fromJson(Map<String, dynamic> json) => _$UpdateKunjunganIbuHamilModelFromJson(json);

  Map<String, dynamic> toJson()=>_$UpdateKunjunganIbuHamilModelToJson(this);
}

UpdateKunjunganIbuHamilModel _$UpdateKunjunganIbuHamilModelFromJson(
        Map<String, dynamic> json) =>
    UpdateKunjunganIbuHamilModel(
      selesaiPada: json['selesai_pada'] as String,
      statusKunjungan: json['status_kunjungan'] as String,
    );

Map<String, dynamic> _$UpdateKunjunganIbuHamilModelToJson(
        UpdateKunjunganIbuHamilModel instance) =>
    <String, dynamic>{
      'status_kunjungan': instance.statusKunjungan,
      'selesai_pada':instance.selesaiPada,
    };
