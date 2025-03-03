
import 'package:json_annotation/json_annotation.dart';
part 'pertanyaan_model.g.dart';

@JsonSerializable()
class PertanyaanModel {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "question")
  final String pertanyaan;
  @JsonKey(name: "option")
  final List<Opsi> opsi;

  PertanyaanModel({
    required this.id,
    required this.pertanyaan,
    required this.opsi,
  });

  factory PertanyaanModel.fromJson(Map<String, dynamic> json) =>
      _$PertanyaanModelFromJson(json);

  Map<String, dynamic> toJson() => _$PertanyaanModelToJson(this);
}

@JsonSerializable()
class Opsi {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "option")
  final String opsi;

  Opsi({
    required this.id,
    required this.opsi,
  });

  factory Opsi.fromJson(Map<String, dynamic> json) => _$OpsiFromJson(json);

  Map<String, dynamic> toJson() => _$OpsiToJson(this);
}
