// import 'package:json_annotation/json_annotation.dart';

// part 'logout_response_model.g.dart';

// @JsonSerializable()
class LogoutResponseModel {
  String message;
  String? error;

  LogoutResponseModel({
    required this.message,
    this.error
  });

   factory LogoutResponseModel.fromJson(Map<String, dynamic> json) => _$LogoutResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$LogoutResponseModelToJson(this);
}

LogoutResponseModel _$LogoutResponseModelFromJson(Map<String, dynamic> json) =>
    LogoutResponseModel(
      message: json['message'] as String,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$LogoutResponseModelToJson(
        LogoutResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'error': instance.error,
    };
