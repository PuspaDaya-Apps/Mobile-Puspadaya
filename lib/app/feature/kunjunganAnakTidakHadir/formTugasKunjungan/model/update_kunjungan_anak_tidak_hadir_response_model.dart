import 'package:json_annotation/json_annotation.dart';

// part 'update_kunjungan_anak_tidak_hadir_response_model.g.dart';

// @JsonSerializable()
class UpdateKunjunganAnakTidakHadirResponseModel {
  String message;

  UpdateKunjunganAnakTidakHadirResponseModel({
    required this.message,
  });

  factory UpdateKunjunganAnakTidakHadirResponseModel.fromJson(Map<String, dynamic> json) => _$UpdateKunjunganAnakTidakHadirResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$UpdateKunjunganAnakTidakHadirResponseModelToJson(this);
}

UpdateKunjunganAnakTidakHadirResponseModel
    _$UpdateKunjunganAnakTidakHadirResponseModelFromJson(
            Map<String, dynamic> json) =>
        UpdateKunjunganAnakTidakHadirResponseModel(
          message: json['message'] as String,
        );

Map<String, dynamic> _$UpdateKunjunganAnakTidakHadirResponseModelToJson(
        UpdateKunjunganAnakTidakHadirResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
    };
