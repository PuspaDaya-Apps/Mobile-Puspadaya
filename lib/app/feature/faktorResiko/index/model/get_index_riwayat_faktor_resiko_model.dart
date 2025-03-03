import 'package:json_annotation/json_annotation.dart';
part 'get_index_riwayat_faktor_resiko_model.g.dart';

@JsonSerializable()
class GetIndexRiwayatFaktorResikoModel {
  @JsonKey(name: "message")
  final String message;
  @JsonKey(name: "data")
  final List<Datum> data;

  GetIndexRiwayatFaktorResikoModel({
    required this.message,
    required this.data,
  });

  factory GetIndexRiwayatFaktorResikoModel.fromJson(
          Map<String, dynamic> json) =>
      _$GetIndexRiwayatFaktorResikoModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetIndexRiwayatFaktorResikoModelToJson(this);
}

@JsonSerializable()
class Datum {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "tanggal_periode")
  final DateTime tanggalPeriode;

  Datum({
    required this.id,
    required this.tanggalPeriode,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
