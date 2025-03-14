import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:json_annotation/json_annotation.dart';

// part 'simpan_tugas_kunjungan_anak_stunting_model.g.dart';

// @JsonSerializable()
class SimpanTugasKunjunganAnakStuntingModel {
  @JsonKey(name: 'kunjungan_id')
  String kunjunganId;
  @JsonKey(name: 'tugas_kunjungan_ids')
  List<String> tugasKunjunganids = [];
  @JsonKey(name: 'files')
  List<XFile> files = [];

  SimpanTugasKunjunganAnakStuntingModel({
    required this.kunjunganId,
    required this.tugasKunjunganids,
    required this.files
  });

  // factory SimpanTugasKunjunganAnakStuntingModel.fromJson(Map<String, dynamic> json) => _$SimpanTugasKunjunganAnakStuntingModelFromJson(json);

  // Map<String, dynamic> toJson()=>_$SimpanTugasKunjunganAnakStuntingModelToJson(this);

  FormData toFormData() => _$SimpanTugasKunjunganAnakStuntingModelToFormData(this);
}

// SimpanTugasKunjunganAnakStuntingModel
//     _$SimpanTugasKunjunganAnakStuntingModelFromJson(
//             Map<String, dynamic> json) =>
//         SimpanTugasKunjunganAnakStuntingModel(
//           kunjunganId: json['kunjungan_id'] as String,
//           tugasKunjunganids: (json['tugas_kunjungan_ids'] as List<dynamic>)
//               .map((e) => e as String)
//               .toList(),
//           files:
//               (json['files'] as List<dynamic>).map((e) => e as String).toList(),
//         );

// Map<String, dynamic> _$SimpanTugasKunjunganAnakStuntingModelToJson(
//         SimpanTugasKunjunganAnakStuntingModel instance) =>
//     <String, dynamic>{
//       'kunjungan_id': instance.kunjunganId,
//       'tugas_kunjungan_ids': instance.tugasKunjunganids,
//       'files': instance.files,
//     };

FormData _$SimpanTugasKunjunganAnakStuntingModelToFormData(SimpanTugasKunjunganAnakStuntingModel instance) =>
    FormData.fromMap({
      'kunjungan_id': instance.kunjunganId,
      'tugas_kunjungan_ids': instance.tugasKunjunganids,
      // 'files': (instance.files).map((e) async => await MultipartFile.fromFile(e.path)).toList(),
      // 'files': await MultipartFile.fromFile(image.path, filename: "image.png"),
    });
