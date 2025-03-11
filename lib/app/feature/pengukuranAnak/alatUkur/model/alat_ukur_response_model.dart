import 'package:json_annotation/json_annotation.dart';

// part 'alat_ukur_response_model.g.dart';

// @JsonSerializable()
class AlatUkurResponseModel {
  String message;
  List<Data>? data = [];

  AlatUkurResponseModel({
    required this.message,
    this.data,
  });

  factory AlatUkurResponseModel.fromJson(Map<String, dynamic> json) => _$AlatUkurResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$AlatUkurResponseModelToJson(this);
}

// @JsonSerializable()
class Data {
  String id;
  @JsonKey(name: 'merek_alat')
  String merkAlat;
  @JsonKey(name: 'kondisi_alat')
  String kondisiAlat;

  Data({
    required this.id,
    required this.merkAlat,
    required this.kondisiAlat
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson()=>_$DataToJson(this);
}

AlatUkurResponseModel _$AlatUkurResponseModelFromJson(
        Map<String, dynamic> json) =>
    AlatUkurResponseModel(
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AlatUkurResponseModelToJson(
        AlatUkurResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as String,
      merkAlat: json['merek_alat'] as String,
      kondisiAlat: json['kondisi_alat'] as String,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'merk_alat': instance.merkAlat,
      'kondisi_alat': instance.kondisiAlat,
    };
