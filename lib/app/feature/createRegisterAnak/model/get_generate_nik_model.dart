import 'package:json_annotation/json_annotation.dart';
part 'get_generate_nik_model.g.dart';

@JsonSerializable()
class GetGenerateNikModel {
  @JsonKey(name: "data")
  final Data data;

  GetGenerateNikModel({
    required this.data,
  });

  factory GetGenerateNikModel.fromJson(Map<String, dynamic> json) =>
      _$GetGenerateNikModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetGenerateNikModelToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "nomor_induk_keluarga")
  final String nomorIndukKeluarga;

  Data({
    required this.nomorIndukKeluarga,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
