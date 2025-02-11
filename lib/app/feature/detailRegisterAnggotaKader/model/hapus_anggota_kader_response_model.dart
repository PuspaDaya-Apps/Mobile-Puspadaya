import 'package:json_annotation/json_annotation.dart';

// part 'hapus_anggota_kader_response_model.g.dart';

// @JsonSerializable()
class HapusAnggotaKaderResponseModel {
  String message;
  String? error;

  HapusAnggotaKaderResponseModel({
    required this.message,
    required this.error,
  });

  factory HapusAnggotaKaderResponseModel.fromJson(Map<String, dynamic> json) => _$HapusAnggotaKaderResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$HapusAnggotaKaderResponseModelToJson(this);
}

HapusAnggotaKaderResponseModel _$HapusAnggotaKaderResponseModelFromJson(
        Map<String, dynamic> json) =>
    HapusAnggotaKaderResponseModel(
      message: json['message'] as String,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$HapusAnggotaKaderResponseModelToJson(
        HapusAnggotaKaderResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'error': instance.error,
    };
