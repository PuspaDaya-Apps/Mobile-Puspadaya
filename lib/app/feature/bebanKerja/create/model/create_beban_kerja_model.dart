import 'package:json_annotation/json_annotation.dart';

// part 'create_beban_kerja_model.g.dart';

// @JsonSerializable()
class CreateBebanKerjaModel {
  String bulan;
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
      bulan: json['bulan'] as String,
      tugasDikerjakan: (json['tugas_dikerjakan'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$CreateBebanKerjaModelToJson(
        CreateBebanKerjaModel instance) =>
    <String, dynamic>{
      'bulan': instance.bulan,
      'tugas_dikerjakan': instance.tugasDikerjakan,
    };