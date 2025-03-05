// import 'package:json_annotation/json_annotation.dart';

// part 'simpan_tugas_kunjungan_anak_tidak_hadir_response_model.g.dart';

// @JsonSerializable()
class SimpanTugasKunjunganAnakTidakHadirResponseModel {
  String message;

  SimpanTugasKunjunganAnakTidakHadirResponseModel({
    required this.message,
  });

  factory SimpanTugasKunjunganAnakTidakHadirResponseModel.fromJson(Map<String, dynamic> json) => _$SimpanTugasKunjunganAnakTidakHadirResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$SimpanTugasKunjunganAnakTidakHadirResponseModelToJson(this);
}

SimpanTugasKunjunganAnakTidakHadirResponseModel
    _$SimpanTugasKunjunganAnakTidakHadirResponseModelFromJson(
            Map<String, dynamic> json) =>
        SimpanTugasKunjunganAnakTidakHadirResponseModel(
          message: json['message'] as String,
        );

Map<String, dynamic> _$SimpanTugasKunjunganAnakTidakHadirResponseModelToJson(
        SimpanTugasKunjunganAnakTidakHadirResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
    };
