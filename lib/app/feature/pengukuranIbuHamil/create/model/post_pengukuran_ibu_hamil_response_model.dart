import 'package:json_annotation/json_annotation.dart';

// part 'post_pengukuran_ibu_hamil_response_model.g.dart';

// @JsonSerializable()
class PostPengukuranIbuHamilResponseModel {
  String message;

  PostPengukuranIbuHamilResponseModel({
    required this.message,
  });

  factory PostPengukuranIbuHamilResponseModel.fromJson(Map<String, dynamic> json) => _$PostPengukuranIbuHamilResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$PostPengukuranIbuHamilResponseModelToJson(this);
}

PostPengukuranIbuHamilResponseModel
    _$PostPengukuranIbuHamilResponseModelFromJson(Map<String, dynamic> json) =>
        PostPengukuranIbuHamilResponseModel(
          message: json['message'] as String,
        );

Map<String, dynamic> _$PostPengukuranIbuHamilResponseModelToJson(
        PostPengukuranIbuHamilResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
    };
