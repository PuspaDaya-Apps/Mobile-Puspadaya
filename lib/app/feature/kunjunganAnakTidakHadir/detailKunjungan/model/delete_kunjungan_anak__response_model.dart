// import 'package:json_annotation/json_annotation.dart';

// part 'delete_kunjungan_anak_tidak_hadir_response_model.g.dart';

// @JsonSerializable()
class DeleteKunjunganAnakTidakHadirResponseModel {
  String message;

  DeleteKunjunganAnakTidakHadirResponseModel({
    required this.message,
  });

  factory DeleteKunjunganAnakTidakHadirResponseModel.fromJson(Map<String, dynamic> json) => _$DeleteKunjunganAnakTidakHadirResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$DeleteKunjunganAnakTidakHadirResponseModelToJson(this);
}

DeleteKunjunganAnakTidakHadirResponseModel
    _$DeleteKunjunganAnakTidakHadirResponseModelFromJson(
            Map<String, dynamic> json) =>
        DeleteKunjunganAnakTidakHadirResponseModel(
          message: json['message'] as String,
        );

Map<String, dynamic> _$DeleteKunjunganAnakTidakHadirResponseModelToJson(
        DeleteKunjunganAnakTidakHadirResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
    };