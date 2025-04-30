import 'package:json_annotation/json_annotation.dart';
part 'total_kunjungan_response_model.g.dart';
@JsonSerializable()
class TotalKunjunganResponseModel {
    @JsonKey(name: "message")
    final String message;
    @JsonKey(name: "data")
    final int data;

    TotalKunjunganResponseModel({
        required this.message,
        required this.data,
    });

    factory TotalKunjunganResponseModel.fromJson(Map<String, dynamic> json) => _$TotalKunjunganResponseModelFromJson(json);

    Map<String, dynamic> toJson() => _$TotalKunjunganResponseModelToJson(this);
}
