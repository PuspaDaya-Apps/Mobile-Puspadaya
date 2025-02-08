import 'package:json_annotation/json_annotation.dart';
part 'parameter_gizi_model.g.dart'; // Corrected the filename here

@JsonSerializable()
class ParameterGiziModel {
  @JsonKey(name: "jenis_kelamin")
  final String jenisKelamin;
  @JsonKey(name: "satuan")
  final String satuan;
  @JsonKey(name: "data")
  final List<Datum> data;

  ParameterGiziModel({
    required this.jenisKelamin,
    required this.satuan,
    required this.data,
  });

  factory ParameterGiziModel.fromJson(Map<String, dynamic> json) =>
      _$ParameterGiziModelFromJson(json);

  Map<String, dynamic> toJson() => _$ParameterGiziModelToJson(this);
}

@JsonSerializable()
class Datum {
  @JsonKey(name: "Day")
  final double day;
  @JsonKey(name: "L")
  final double l;
  @JsonKey(name: "M")
  final double m;
  @JsonKey(name: "S")
  final double s;
  @JsonKey(name: "SD4neg")
  final double sd4Neg;
  @JsonKey(name: "SD3neg")
  final double sd3Neg;
  @JsonKey(name: "SD2neg")
  final double sd2Neg;
  @JsonKey(name: "SD1neg")
  final double sd1Neg;
  @JsonKey(name: "SD0")
  final double sd0;
  @JsonKey(name: "SD1")
  final double sd1;
  @JsonKey(name: "SD2")
  final double sd2;
  @JsonKey(name: "SD3")
  final double sd3;
  @JsonKey(name: "SD4")
  final double sd4;

  Datum({
    required this.day,
    required this.l,
    required this.m,
    required this.s,
    required this.sd4Neg,
    required this.sd3Neg,
    required this.sd2Neg,
    required this.sd1Neg,
    required this.sd0,
    required this.sd1,
    required this.sd2,
    required this.sd3,
    required this.sd4,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
