// import 'package:json_annotation/json_annotation.dart';

// part 'delete_kunjungan_ibu_hamil_response_model.g.dart';

// @JsonSerializable()
class DeleteKunjunganIbuHamilResponseModel {
  String message;

  DeleteKunjunganIbuHamilResponseModel({
    required this.message,
  });

  factory DeleteKunjunganIbuHamilResponseModel.fromJson(Map<String, dynamic> json) => _$DeleteKunjunganIbuHamilResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$DeleteKunjunganIbuHamilResponseModelToJson(this);
}

DeleteKunjunganIbuHamilResponseModel
    _$DeleteKunjunganIbuHamilResponseModelFromJson(
            Map<String, dynamic> json) =>
        DeleteKunjunganIbuHamilResponseModel(
          message: json['message'] as String,
        );

Map<String, dynamic> _$DeleteKunjunganIbuHamilResponseModelToJson(
        DeleteKunjunganIbuHamilResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
    };