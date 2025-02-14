import 'package:json_annotation/json_annotation.dart';

// part 'reset_kata_sandi_response_model.g.dart';

// @JsonSerializable()
class ResetKataSandiResponseModel {
  String message;
  @JsonKey(name: 'error')
  String? error;

  ResetKataSandiResponseModel({
    required this.message,
    this.error,
  });

  factory ResetKataSandiResponseModel.fromJson(Map<String, dynamic> json) => _$ResetKataSandiResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$ResetKataSandiResponseModelToJson(this);
}

ResetKataSandiResponseModel _$ResetKataSandiResponseModelFromJson(
        Map<String, dynamic> json) =>
    ResetKataSandiResponseModel(
      message: json['message'] as String,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$ResetKataSandiResponseModelToJson(
        ResetKataSandiResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'error': instance.error,
    };
