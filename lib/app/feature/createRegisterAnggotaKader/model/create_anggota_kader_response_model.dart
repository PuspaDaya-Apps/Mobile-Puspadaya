// import 'package:json_annotation/json_annotation.dart';

// part 'create_anggota_kader_response_model.g.dart';

// @JsonSerializable()
class CreateAnggotaKaderResponseModel {
  String message;
  String? error;

  CreateAnggotaKaderResponseModel({
    required this.message,
    this.error
  });

  factory CreateAnggotaKaderResponseModel.fromJson(Map<String, dynamic> json) => _$CreateAnggotaKaderResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$CreateAnggotaKaderResponseModelToJson(this);
}

CreateAnggotaKaderResponseModel _$CreateAnggotaKaderResponseModelFromJson(
        Map<String, dynamic> json) =>
    CreateAnggotaKaderResponseModel(
      message: json['message'] as String,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$CreateAnggotaKaderResponseModelToJson(
        CreateAnggotaKaderResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'error': instance.error,
    };
