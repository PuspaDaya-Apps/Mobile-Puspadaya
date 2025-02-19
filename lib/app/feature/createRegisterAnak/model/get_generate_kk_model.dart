import 'package:json_annotation/json_annotation.dart';
part 'get_generate_kk_model.g.dart';

@JsonSerializable()
class GetGenerateKKModel {
  @JsonKey(name: "data")
  final Data data;

  GetGenerateKKModel({
    required this.data,
  });

  factory GetGenerateKKModel.fromJson(Map<String, dynamic> json) =>
      _$GetGenerateKKModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetGenerateKKModelToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "nomor_kartu_keluarga")
  final String nomorKartuKeluarga;

  Data({
    required this.nomorKartuKeluarga,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
