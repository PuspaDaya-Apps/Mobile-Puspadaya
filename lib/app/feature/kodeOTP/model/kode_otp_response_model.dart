import 'package:json_annotation/json_annotation.dart';

// part 'kode_otp_response_model.g.dart';

// @JsonSerializable()
class KodeOtpResponseModel {
  String message;
  @JsonKey(name: 'error')
  String? error;

  KodeOtpResponseModel({
    required this.message,
    this.error,
  });

  factory KodeOtpResponseModel.fromJson(Map<String, dynamic> json) => _$KodeOtpResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$KodeOtpResponseModelToJson(this);
}

KodeOtpResponseModel _$KodeOtpResponseModelFromJson(
        Map<String, dynamic> json) =>
    KodeOtpResponseModel(
      message: json['message'] as String,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$KodeOtpResponseModelToJson(
        KodeOtpResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'error': instance.error,
    };
