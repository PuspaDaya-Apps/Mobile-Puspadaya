// import 'package:json_annotation/json_annotation.dart';

// part 'simpan_tugas_kunjungan_anak_stunting_response_model.g.dart';

// @JsonSerializable()
class SimpanTugasKunjunganAnakStuntingResponseModel {
  String message;

  SimpanTugasKunjunganAnakStuntingResponseModel({
    required this.message,
  });

  factory SimpanTugasKunjunganAnakStuntingResponseModel.fromJson(Map<String, dynamic> json) => _$SimpanTugasKunjunganAnakStuntingResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$SimpanTugasKunjunganAnakStuntingResponseModelToJson(this);
}

SimpanTugasKunjunganAnakStuntingResponseModel
    _$SimpanTugasKunjunganAnakStuntingResponseModelFromJson(
            Map<String, dynamic> json) =>
        SimpanTugasKunjunganAnakStuntingResponseModel(
          message: json['message'] as String,
        );

Map<String, dynamic> _$SimpanTugasKunjunganAnakStuntingResponseModelToJson(
        SimpanTugasKunjunganAnakStuntingResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
    };
