// import 'package:json_annotation/json_annotation.dart';

// part 'delete_kunjungan_anak_stunting_response_model.g.dart';

// @JsonSerializable()
class DeleteKunjunganAnakStuntingResponseModel {
  String message;

  DeleteKunjunganAnakStuntingResponseModel({
    required this.message,
  });

  factory DeleteKunjunganAnakStuntingResponseModel.fromJson(Map<String, dynamic> json) => _$DeleteKunjunganAnakStuntingResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$DeleteKunjunganAnakStuntingResponseModelToJson(this);
}

DeleteKunjunganAnakStuntingResponseModel
    _$DeleteKunjunganAnakStuntingResponseModelFromJson(
            Map<String, dynamic> json) =>
        DeleteKunjunganAnakStuntingResponseModel(
          message: json['message'] as String,
        );

Map<String, dynamic> _$DeleteKunjunganAnakStuntingResponseModelToJson(
        DeleteKunjunganAnakStuntingResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
    };