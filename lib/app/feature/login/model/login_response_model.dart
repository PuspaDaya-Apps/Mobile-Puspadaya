import 'package:json_annotation/json_annotation.dart';

// part 'login_response_model.g.dart';

// @JsonSerializable()
class LoginResponseModel {
  String message;
  String? error;
  Data? data;

  LoginResponseModel({
    required this.message,
    this.error,
    this.data
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => _$LoginResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$LoginResponseModelToJson(this);
}

// @JsonSerializable()
class Data {
  @JsonKey(name: 'nama_lengkap')
  String namaLengkap;
  @JsonKey(name: 'login_time')
  String loginTime;
  @JsonKey(name: 'refresh_expired_at')
  DateTime refreshExpiredAt;
  @JsonKey(name: 'access_token')
  String accessToken;
  @JsonKey(name: 'refresh_token')
  String refreshToken;

  Data({
    required this.namaLengkap,
    required this.loginTime,
    required this.refreshExpiredAt,
    required this.accessToken,
    required this.refreshToken
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson()=>_$DataToJson(this);
}

LoginResponseModel _$LoginResponseModelFromJson(Map<String, dynamic> json) =>
    LoginResponseModel(
      message: json['message'] as String,
      error: json['error'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseModelToJson(LoginResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'error': instance.error,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      namaLengkap: json['nama_lengkap'] as String,
      loginTime: json['login_time'] as String,
      refreshExpiredAt: DateTime.parse(json['refresh_expired_at'] as String),
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'nama_lengkap': instance.namaLengkap,
      'login_time': instance.loginTime,
      'refresh_expired_at': instance.refreshExpiredAt.toIso8601String(),
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
    };