import 'package:json_annotation/json_annotation.dart';
part 'generate_kk_model.g.dart';

@JsonSerializable()
class GenerateKKModel {
  @JsonKey(name: "provinsi_id")
  final String provinsiId;
  @JsonKey(name: "kabupaten_kota_id")
  final String kabupatenKotaId;
  @JsonKey(name: "kecamatan_id")
  final String kecamatanId;
  @JsonKey(name: "tanggal_lahir")
  final String tanggalLahir;

  GenerateKKModel({
    required this.provinsiId,
    required this.kabupatenKotaId,
    required this.kecamatanId,
    required this.tanggalLahir,
  });

  factory GenerateKKModel.fromJson(Map<String, dynamic> json) =>
      _$GenerateKKModelFromJson(json);

  Map<String, dynamic> toJson() => _$GenerateKKModelToJson(this);
}
