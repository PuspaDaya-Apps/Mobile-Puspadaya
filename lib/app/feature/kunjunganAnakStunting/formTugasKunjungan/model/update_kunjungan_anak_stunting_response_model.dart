import 'package:json_annotation/json_annotation.dart';

// part 'update_kunjungan_anak_stunting_response_model.g.dart';

// @JsonSerializable()
class UpdateKunjunganAnakStuntingResponseModel {
  String message;

  UpdateKunjunganAnakStuntingResponseModel({
    required this.message,
  });

  factory UpdateKunjunganAnakStuntingResponseModel.fromJson(Map<String, dynamic> json) => _$UpdateKunjunganAnakStuntingResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$UpdateKunjunganAnakStuntingResponseModelToJson(this);
}

UpdateKunjunganAnakStuntingResponseModel
    _$UpdateKunjunganAnakStuntingResponseModelFromJson(
            Map<String, dynamic> json) =>
        UpdateKunjunganAnakStuntingResponseModel(
          message: json['message'] as String,
        );

Map<String, dynamic> _$UpdateKunjunganAnakStuntingResponseModelToJson(
        UpdateKunjunganAnakStuntingResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
    };
