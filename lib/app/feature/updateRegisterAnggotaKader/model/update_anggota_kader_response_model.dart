// import 'package:json_annotation/json_annotation.dart';

// part 'update_anggota_kader_response_model.g.dart';

// @JsonSerializable()
class UpdateAnggotaKaderResponseModel {
  String message;
  String? error;

  UpdateAnggotaKaderResponseModel({
    required this.message,
    required this.error,
  });

  factory UpdateAnggotaKaderResponseModel.fromJson(Map<String, dynamic> json) => _$UpdateAnggotaKaderResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$UpdateAnggotaKaderResponseModelToJson(this);
}

UpdateAnggotaKaderResponseModel _$UpdateAnggotaKaderResponseModelFromJson(
        Map<String, dynamic> json) =>
    UpdateAnggotaKaderResponseModel(
      message: json['message'] as String,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$UpdateAnggotaKaderResponseModelToJson(
        UpdateAnggotaKaderResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'error': instance.error,
    };
