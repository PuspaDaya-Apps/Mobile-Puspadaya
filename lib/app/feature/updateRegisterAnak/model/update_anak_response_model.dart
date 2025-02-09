// import 'package:json_annotation/json_annotation.dart';

// part 'update_anak_response_model.g.dart';

// @JsonSerializable()
class UpdateAnakResponseModel {
  String message;
  String? error;

  UpdateAnakResponseModel({
    required this.message,
    this.error,
  });

  factory UpdateAnakResponseModel.fromJson(Map<String, dynamic> json) => _$UpdateAnakResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$UpdateAnakResponseModelToJson(this);
}

UpdateAnakResponseModel _$UpdateAnakResponseModelFromJson(
        Map<String, dynamic> json) =>
    UpdateAnakResponseModel(
      message: json['message'] as String,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$UpdateAnakResponseModelToJson(
        UpdateAnakResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'error': instance.error,
    };
