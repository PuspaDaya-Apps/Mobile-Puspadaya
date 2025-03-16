import 'package:json_annotation/json_annotation.dart';

// part 'Updatee_pengukuran_ibu_hamil_response_model.g.dart';

// @JsonSerializable()
class UpdatePengukuranIbuHamilResponseModel {
  String message;

  UpdatePengukuranIbuHamilResponseModel({
    required this.message,
  });

  factory UpdatePengukuranIbuHamilResponseModel.fromJson(Map<String, dynamic> json) => _$UpdatePengukuranIbuHamilResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$UpdatePengukuranIbuHamilResponseModelToJson(this);
}

UpdatePengukuranIbuHamilResponseModel
    _$UpdatePengukuranIbuHamilResponseModelFromJson(Map<String, dynamic> json) =>
        UpdatePengukuranIbuHamilResponseModel(
          message: json['message'] as String,
        );

Map<String, dynamic> _$UpdatePengukuranIbuHamilResponseModelToJson(
        UpdatePengukuranIbuHamilResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
    };
