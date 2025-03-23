import 'package:json_annotation/json_annotation.dart';
part 'get_grafik_kms_model.g.dart';
@JsonSerializable()
class GetGrafikKmsModel {
    @JsonKey(name: "usia_anak")
    final int usiaAnak;
    @JsonKey(name: "berat_badan")
    final String? beratBadan;
    @JsonKey(name: "tinggi_badan")
    final String? tinggiBadan;
    @JsonKey(name: "tanggal_pengukuran")
    final String? tanggalPengukuran;

    GetGrafikKmsModel({
        required this.usiaAnak,
        required this.beratBadan,
        required this.tinggiBadan,
        required this.tanggalPengukuran,
    });

    factory GetGrafikKmsModel.fromJson(Map<String, dynamic> json) => _$GetGrafikKmsModelFromJson(json);

    Map<String, dynamic> toJson() => _$GetGrafikKmsModelToJson(this);
}
