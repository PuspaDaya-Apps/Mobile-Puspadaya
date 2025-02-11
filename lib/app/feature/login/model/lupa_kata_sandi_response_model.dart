import 'package:json_annotation/json_annotation.dart';

// part 'lupa_kata_sandi_response_model.g.dart';

// @JsonSerializable()
class LupaKataSandiResponseModel {
  String message;
  @JsonKey(name: 'error')
  String? error;

  LupaKataSandiResponseModel({
    required this.message,
    this.error,
  });

  factory LupaKataSandiResponseModel.fromJson(Map<String, dynamic> json) => _$LupaKataSandiResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$LupaKataSandiResponseModelToJson(this);
}

LupaKataSandiResponseModel _$LupaKataSandiResponseModelFromJson(
        Map<String, dynamic> json) =>
    LupaKataSandiResponseModel(
      message: json['message'] as String,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$LupaKataSandiResponseModelToJson(
        LupaKataSandiResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'error': instance.error,
    };
