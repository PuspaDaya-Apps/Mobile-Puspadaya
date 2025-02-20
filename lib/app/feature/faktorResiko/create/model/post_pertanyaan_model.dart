import 'package:json_annotation/json_annotation.dart';
part 'post_pertanyaan_model.g.dart';

@JsonSerializable()
class PostPertanyaanModel {
  @JsonKey(name: "tanggal_periode")
  final DateTime tanggalPeriode;
  @JsonKey(name: "anak_id")
  final String anakId;
  @JsonKey(name: "faktor_resiko")
  final List<FaktorResiko> faktorResiko;

  PostPertanyaanModel({
    required this.tanggalPeriode,
    required this.anakId,
    required this.faktorResiko,
  });

  factory PostPertanyaanModel.fromJson(Map<String, dynamic> json) =>
      _$PostPertanyaanModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostPertanyaanModelToJson(this);
}

@JsonSerializable()
class FaktorResiko {
  @JsonKey(name: "pertanyaan_id")
  final String pertanyaanId;
  @JsonKey(name: "jawaban_id")
  final List<String> jawabanId;

  FaktorResiko({
    required this.pertanyaanId,
    required this.jawabanId,
  });

  factory FaktorResiko.fromJson(Map<String, dynamic> json) =>
      _$FaktorResikoFromJson(json);

  Map<String, dynamic> toJson() => _$FaktorResikoToJson(this);
}
