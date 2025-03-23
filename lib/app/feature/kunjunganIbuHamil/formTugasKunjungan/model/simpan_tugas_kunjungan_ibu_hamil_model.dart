import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:json_annotation/json_annotation.dart';

// part 'simpan_tugas_kunjungan_ibu_hamil_model.g.dart';

// @JsonSerializable()
class SimpanTugasKunjunganIbuHamilModel {
  @JsonKey(name: 'kunjungan_id')
  String kunjunganId;
  @JsonKey(name: 'tugas_kunjungan_ids')
  List<String> tugasKunjunganids = [];
  @JsonKey(name: 'files')
  List<XFile> files = [];

  SimpanTugasKunjunganIbuHamilModel({
    required this.kunjunganId,
    required this.tugasKunjunganids,
    required this.files
  });

  // factory SimpanTugasKunjunganIbuHamilModel.fromJson(Map<String, dynamic> json) => _$SimpanTugasKunjunganIbuHamilModelFromJson(json);

  // Map<String, dynamic> toJson()=>_$SimpanTugasKunjunganIbuHamilModelToJson(this);

  FormData toFormData() => _$SimpanTugasKunjunganIbuHamilModelToFormData(this);
}

// SimpanTugasKunjunganIbuHamilModel
//     _$SimpanTugasKunjunganIbuHamilModelFromJson(
//             Map<String, dynamic> json) =>
//         SimpanTugasKunjunganIbuHamilModel(
//           kunjunganId: json['kunjungan_id'] as String,
//           tugasKunjunganids: (json['tugas_kunjungan_ids'] as List<dynamic>)
//               .map((e) => e as String)
//               .toList(),
//           files:
//               (json['files'] as List<dynamic>).map((e) => e as String).toList(),
//         );

// Map<String, dynamic> _$SimpanTugasKunjunganIbuHamilModelToJson(
//         SimpanTugasKunjunganIbuHamilModel instance) =>
//     <String, dynamic>{
//       'kunjungan_id': instance.kunjunganId,
//       'tugas_kunjungan_ids': instance.tugasKunjunganids,
//       'files': instance.files,
//     };

FormData _$SimpanTugasKunjunganIbuHamilModelToFormData(SimpanTugasKunjunganIbuHamilModel instance) =>
    FormData.fromMap({
      'kunjungan_id': instance.kunjunganId,
      'tugas_kunjungan_ids': instance.tugasKunjunganids,
      // 'files': (instance.files).map((e) async => await MultipartFile.fromFile(e.path)).toList(),
      // 'files': await MultipartFile.fromFile(image.path, filename: "image.png"),
    });
