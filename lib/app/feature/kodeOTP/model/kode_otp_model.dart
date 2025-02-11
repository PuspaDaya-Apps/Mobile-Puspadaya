import 'package:json_annotation/json_annotation.dart';

// part 'kode_otp_model.g.dart';

// @JsonSerializable()
class KodeOtpModel {
  @JsonKey(name: 'otp_code')
  String kodeOtp;

  KodeOtpModel({
    required this.kodeOtp
  });

  factory KodeOtpModel.fromJson(Map<String, dynamic> json) => _$KodeOtpModelFromJson(json);

  Map<String, dynamic> toJson()=>_$KodeOtpModelToJson(this);
}

KodeOtpModel _$KodeOtpModelFromJson(Map<String, dynamic> json) =>
    KodeOtpModel(
      kodeOtp: json['otp_code'] as String,
    );

Map<String, dynamic> _$KodeOtpModelToJson(KodeOtpModel instance) =>
    <String, dynamic>{
      'otp_code': instance.kodeOtp,
    };
