// import 'package:json_annotation/json_annotation.dart';

// part 'simpan_tugas_kunjungan_ibu_hamil_response_model.g.dart';

// @JsonSerializable()
class SimpanTugasKunjunganIbuHamilResponseModel {
  String message;

  SimpanTugasKunjunganIbuHamilResponseModel({
    required this.message,
  });

  factory SimpanTugasKunjunganIbuHamilResponseModel.fromJson(Map<String, dynamic> json) => _$SimpanTugasKunjunganIbuHamilResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$SimpanTugasKunjunganIbuHamilResponseModelToJson(this);
}

SimpanTugasKunjunganIbuHamilResponseModel
    _$SimpanTugasKunjunganIbuHamilResponseModelFromJson(
            Map<String, dynamic> json) =>
        SimpanTugasKunjunganIbuHamilResponseModel(
          message: json['message'] as String,
        );

Map<String, dynamic> _$SimpanTugasKunjunganIbuHamilResponseModelToJson(
        SimpanTugasKunjunganIbuHamilResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
    };
