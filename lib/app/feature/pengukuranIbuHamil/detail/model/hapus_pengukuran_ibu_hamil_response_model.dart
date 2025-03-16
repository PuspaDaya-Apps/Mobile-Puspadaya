// import 'package:json_annotation/json_annotation.dart';

// part 'hapus_pengukuran_ibu_hamil_response_model.g.dart';

// @JsonSerializable()
class HapusPengukuranIbuHamilResponseModel {
  String message;

  HapusPengukuranIbuHamilResponseModel({
    required this.message,
  });

  factory HapusPengukuranIbuHamilResponseModel.fromJson(Map<String, dynamic> json) => _$HapusPengukuranIbuHamilResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$HapusPengukuranIbuHamilResponseModelToJson(this);
}

HapusPengukuranIbuHamilResponseModel _$HapusPengukuranIbuHamilResponseModelFromJson(
        Map<String, dynamic> json) =>
    HapusPengukuranIbuHamilResponseModel(
      message: json['message'] as String,
    );

Map<String, dynamic> _$HapusPengukuranIbuHamilResponseModelToJson(
        HapusPengukuranIbuHamilResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
    };