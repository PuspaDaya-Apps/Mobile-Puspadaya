import 'package:json_annotation/json_annotation.dart';

// part 'create_beban_kerja_model.g.dart';

// @JsonSerializable()
class CreateBebanKerjaModel {
  DateTime bulan;
  @JsonKey(name: 'tugas_dikerjakan')
  List<String> tugasDikerjakan;

  CreateBebanKerjaModel({
    required this.bulan,
    required this.tugasDikerjakan
  });

  factory CreateBebanKerjaModel.fromJson(Map<String, dynamic> json) => _$CreateBebanKerjaModelFromJson(json);

  Map<String, dynamic> toJson()=>_$CreateBebanKerjaModelToJson(this);
}

CreateBebanKerjaModel _$CreateBebanKerjaModelFromJson(
        Map<String, dynamic> json) =>
    CreateBebanKerjaModel(
      bulan: DateTime.parse(json['bulan'] as String),
      tugasDikerjakan: (json['tugas_dikerjakan'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$CreateBebanKerjaModelToJson(
        CreateBebanKerjaModel instance) =>
    <String, dynamic>{
      'bulan': instance.bulan.toIso8601String(),
      'tugas_dikerjakan': instance.tugasDikerjakan,
    };