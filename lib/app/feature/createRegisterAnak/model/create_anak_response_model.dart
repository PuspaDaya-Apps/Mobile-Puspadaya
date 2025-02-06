// import 'package:json_annotation/json_annotation.dart';

// part 'create_anak_response_model.g.dart';

// @JsonSerializable()
class CreateAnakResponseModel {
  String message;
  String? error;

  CreateAnakResponseModel({
    required this.message,
    this.error,
  });

  factory CreateAnakResponseModel.fromJson(Map<String, dynamic> json) => _$CreateAnakResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$CreateAnakResponseModelToJson(this);
}

CreateAnakResponseModel _$CreateAnakResponseModelFromJson(
        Map<String, dynamic> json) =>
    CreateAnakResponseModel(
      message: json['message'] as String,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$CreateAnakResponseModelToJson(
        CreateAnakResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'error': instance.error,
    };
