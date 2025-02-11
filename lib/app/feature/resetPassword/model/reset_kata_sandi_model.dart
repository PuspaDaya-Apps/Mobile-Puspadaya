import 'package:json_annotation/json_annotation.dart';

// part 'reset_kata_sandi_model.g.dart';

// @JsonSerializable()
class ResetKataSandiModel {
  @JsonKey(name: 'otp_code')
  String kodeOtp;
  String password;
  @JsonKey(name: 'confirm_password')
  String confirmPassword;

  ResetKataSandiModel({
    required this.kodeOtp,
    required this.password,
    required this.confirmPassword,
  });

  factory ResetKataSandiModel.fromJson(Map<String, dynamic> json) => _$ResetKataSandiModelFromJson(json);

  Map<String, dynamic> toJson()=>_$ResetKataSandiModelToJson(this);
}

ResetKataSandiModel _$ResetKataSandiModelFromJson(Map<String, dynamic> json) =>
    ResetKataSandiModel(
      kodeOtp: json['otp_code'] as String,
      password: json['password'] as String,
      confirmPassword: json['confirm_password'] as String,
    );

Map<String, dynamic> _$ResetKataSandiModelToJson(
        ResetKataSandiModel instance) =>
    <String, dynamic>{
      'otp_code': instance.kodeOtp,
      'password': instance.password,
      'confirm_password': instance.confirmPassword,
    };
