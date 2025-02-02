// import 'package:json_annotation/json_annotation.dart';

// part 'hapus_pengukuran_anak_response_model.g.dart';

// @JsonSerializable()
class HapusPengukuranAnakResponseModel {
  String message;
  String? error;

  HapusPengukuranAnakResponseModel({
    required this.message,
    this.error,
  });

  factory HapusPengukuranAnakResponseModel.fromJson(Map<String, dynamic> json) => _$HapusPengukuranAnakResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$HapusPengukuranAnakResponseModelToJson(this);
}

HapusPengukuranAnakResponseModel _$HapusPengukuranAnakResponseModelFromJson(
        Map<String, dynamic> json) =>
    HapusPengukuranAnakResponseModel(
      message: json['message'] as String,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$HapusPengukuranAnakResponseModelToJson(
        HapusPengukuranAnakResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'error': instance.error,
    };