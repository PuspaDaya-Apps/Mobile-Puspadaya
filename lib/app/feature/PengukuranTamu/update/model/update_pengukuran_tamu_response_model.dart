import 'package:json_annotation/json_annotation.dart';

// part 'update_pengukuran_tamu_response_model.g.dart';

// @JsonSerializable()
class UpdatePengukuranTamuResponseModel {
  String message;

  UpdatePengukuranTamuResponseModel({
    required this.message,
  });

  factory UpdatePengukuranTamuResponseModel.fromJson(Map<String, dynamic> json) => _$UpdatePengukuranTamuResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$UpdatePengukuranTamuResponseModelToJson(this);
}

UpdatePengukuranTamuResponseModel _$UpdatePengukuranTamuResponseModelFromJson(
        Map<String, dynamic> json) =>
    UpdatePengukuranTamuResponseModel(
      message: json['message'] as String,
    );

Map<String, dynamic> _$UpdatePengukuranTamuResponseModelToJson(
        UpdatePengukuranTamuResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
    };
