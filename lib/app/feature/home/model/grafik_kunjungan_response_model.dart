import 'package:json_annotation/json_annotation.dart';
part 'grafik_kunjungan_response_model.g.dart';
@JsonSerializable()
class GrafikKunjunganResponseModel {
    @JsonKey(name: "message")
    final String message;
    @JsonKey(name: "data")
    final List<int> data;

    GrafikKunjunganResponseModel({
        required this.message,
        required this.data,
    });

    factory GrafikKunjunganResponseModel.fromJson(Map<String, dynamic> json) => _$GrafikKunjunganResponseModelFromJson(json);

    Map<String, dynamic> toJson() => _$GrafikKunjunganResponseModelToJson(this);
}
