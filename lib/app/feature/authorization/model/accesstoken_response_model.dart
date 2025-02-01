import 'package:json_annotation/json_annotation.dart';

// part 'accestoken_response_model.g.dart';

// @JsonSerializable()
class AccessTokenResponseModel {
  String message;
  String? error;
  Data? data;

  AccessTokenResponseModel({
    required this.message,
    this.error,
    this.data
  });

   factory AccessTokenResponseModel.fromJson(Map<String, dynamic> json) => _$AccessTokenResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$AccessTokenResponseModelToJson(this);
}

// @JsonSerializable()
class Data {
  @JsonKey(name: 'access-token')
  String accessToken;

  Data({
    required this.accessToken
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson()=>_$DataToJson(this); 
}

AccessTokenResponseModel _$AccessTokenResponseModelFromJson(
        Map<String, dynamic> json) =>
    AccessTokenResponseModel(
      message: json['message'] as String,
      error: json['error'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AccessTokenResponseModelToJson(
        AccessTokenResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'error': instance.error,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      accessToken: json['access-token'] as String,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'access-token': instance.accessToken,
    };