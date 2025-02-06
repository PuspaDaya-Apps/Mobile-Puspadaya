// import 'package:json_annotation/json_annotation.dart';

// part 'update_orang_tua_response_model.g.dart';

// @JsonSerializable()
class UpdateOrangTuaResponseModel {
  String message;
  String? error;

  UpdateOrangTuaResponseModel({
    required this.message,
    this.error,
  });

  factory UpdateOrangTuaResponseModel.fromJson(Map<String, dynamic> json) => _$UpdateOrangTuaResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$UpdateOrangTuaResponseModelToJson(this);
}

UpdateOrangTuaResponseModel _$UpdateOrangTuaResponseModelFromJson(
        Map<String, dynamic> json) =>
    UpdateOrangTuaResponseModel(
      message: json['message'] as String,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$UpdateOrangTuaResponseModelToJson(
        UpdateOrangTuaResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'error': instance.error,
    };
