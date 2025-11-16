import 'package:json_annotation/json_annotation.dart';
part 'total_point_response_model.g.dart';
@JsonSerializable()
class TotalPointResponseModel {
    @JsonKey(name: "total_skor_keseluruhan")
    final num totalSkorKeseluruhan;
    @JsonKey(name: "jumlah_bulan")
    final int jumlahBulan;

    TotalPointResponseModel({
        required this.totalSkorKeseluruhan,
        required this.jumlahBulan,
    });

    factory TotalPointResponseModel.fromJson(Map<String, dynamic> json) => _$TotalPointResponseModelFromJson(json);

    Map<String, dynamic> toJson() => _$TotalPointResponseModelToJson(this);
}
