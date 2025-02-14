// import 'package:json_annotation/json_annotation.dart';

// part 'update_pengasuh_response_model.g.dart';

// @JsonSerializable()
class UpdatePengasuhResponseModel {
  String message;
  String? error;

  UpdatePengasuhResponseModel({
    required this.message,
    this.error,
  });

  factory UpdatePengasuhResponseModel.fromJson(Map<String, dynamic> json) => _$UpdatePengasuhResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$UpdatePengasuhResponseModelToJson(this);
}

UpdatePengasuhResponseModel _$UpdatePengasuhResponseModelFromJson(
        Map<String, dynamic> json) =>
    UpdatePengasuhResponseModel(
      message: json['message'] as String,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$UpdatePengasuhResponseModelToJson(
        UpdatePengasuhResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'error': instance.error,
    };
