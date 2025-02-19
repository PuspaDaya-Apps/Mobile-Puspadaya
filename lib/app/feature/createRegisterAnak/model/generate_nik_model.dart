import 'package:json_annotation/json_annotation.dart';
part 'generate_nik_model.g.dart';

@JsonSerializable()
class GenerateNIKModel {
  @JsonKey(name: "nomor_kartu_keluarga")
  final String nomorKartuKeluarga;
  @JsonKey(name: "tanggal_lahir")
  final String tanggalLahir;

  GenerateNIKModel({
    required this.nomorKartuKeluarga,
    required this.tanggalLahir,
  });

  factory GenerateNIKModel.fromJson(Map<String, dynamic> json) =>
      _$GenerateNIKModelFromJson(json);

  Map<String, dynamic> toJson() => _$GenerateNIKModelToJson(this);
}
