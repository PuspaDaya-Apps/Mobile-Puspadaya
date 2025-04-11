import 'package:json_annotation/json_annotation.dart';
part 'grafik_kunjungan_response_model.g.dart';
@JsonSerializable()
class GrafikKunjunganResponseModel {
    @JsonKey(name: "bulan")
    final String bulan;
    @JsonKey(name: "total")
    final int total;

    GrafikKunjunganResponseModel({
        required this.bulan,
        required this.total,
    });

    factory GrafikKunjunganResponseModel.fromJson(Map<String, dynamic> json) => _$GrafikKunjunganResponseModelFromJson(json);

    Map<String, dynamic> toJson() => _$GrafikKunjunganResponseModelToJson(this);
}
