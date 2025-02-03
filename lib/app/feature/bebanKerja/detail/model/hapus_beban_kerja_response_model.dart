// import 'package:json_annotation/json_annotation.dart';

// part 'hapus_beban_kerja_response_model.g.dart';

// @JsonSerializable()
class HapusBebanKerjaResponseModel {
  String message;
  String? error;

  HapusBebanKerjaResponseModel({
    required this.message,
    this.error,
  });

  factory HapusBebanKerjaResponseModel.fromJson(Map<String, dynamic> json) => _$HapusBebanKerjaResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$HapusBebanKerjaResponseModelToJson(this);
}

HapusBebanKerjaResponseModel _$HapusBebanKerjaResponseModelFromJson(
        Map<String, dynamic> json) =>
    HapusBebanKerjaResponseModel(
      message: json['message'] as String,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$HapusBebanKerjaResponseModelToJson(
        HapusBebanKerjaResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'error': instance.error,
    };
