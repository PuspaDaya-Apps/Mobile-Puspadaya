import 'package:json_annotation/json_annotation.dart';

// part 'update_kunjungan_ibu_hamil_response_model.g.dart';

// @JsonSerializable()
class UpdateKunjunganIbuHamilResponseModel {
  String message;

  UpdateKunjunganIbuHamilResponseModel({
    required this.message,
  });

  factory UpdateKunjunganIbuHamilResponseModel.fromJson(Map<String, dynamic> json) => _$UpdateKunjunganIbuHamilResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$UpdateKunjunganIbuHamilResponseModelToJson(this);
}

UpdateKunjunganIbuHamilResponseModel
    _$UpdateKunjunganIbuHamilResponseModelFromJson(
            Map<String, dynamic> json) =>
        UpdateKunjunganIbuHamilResponseModel(
          message: json['message'] as String,
        );

Map<String, dynamic> _$UpdateKunjunganIbuHamilResponseModelToJson(
        UpdateKunjunganIbuHamilResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
    };
