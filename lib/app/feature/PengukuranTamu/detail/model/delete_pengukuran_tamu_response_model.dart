// import 'package:json_annotation/json_annotation.dart';

// part 'delete_pengukuran_tamu_response_model.g.dart';

// @JsonSerializable()
class DeletePengukuranTamuResponseModel {
  String message;

  DeletePengukuranTamuResponseModel({
    required this.message,
  });

  factory DeletePengukuranTamuResponseModel.fromJson(Map<String, dynamic> json) => _$DeletePengukuranTamuResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$DeletePengukuranTamuResponseModelToJson(this);
}

DeletePengukuranTamuResponseModel _$DeletePengukuranTamuResponseModelFromJson(
        Map<String, dynamic> json) =>
    DeletePengukuranTamuResponseModel(
      message: json['message'] as String,
    );

Map<String, dynamic> _$DeletePengukuranTamuResponseModelToJson(
        DeletePengukuranTamuResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
    };