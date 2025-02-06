import 'package:json_annotation/json_annotation.dart';
part 'parameter_gizi_model.g.dart'; // Corrected the filename here

@JsonSerializable()
class GetParamaterGizi {
  @JsonKey(name: "jenis_kelamin")
  final String jenisKelamin;
  @JsonKey(name: "satuan")
  final String satuan;
  @JsonKey(name: "data")
  final List<Map<String, double>> data;

  GetParamaterGizi({
    required this.jenisKelamin,
    required this.satuan,
    required this.data,
  });

  GetParamaterGizi copyWith({
    String? jenisKelamin,
    String? satuan,
    List<Map<String, double>>? data,
  }) =>
      GetParamaterGizi(
        jenisKelamin: jenisKelamin ?? this.jenisKelamin,
        satuan: satuan ?? this.satuan,
        data: data ?? this.data,
      );

  factory GetParamaterGizi.fromJson(Map<String, dynamic> json) =>
      _$GetParamaterGiziFromJson(json);

  Map<String, dynamic> toJson() => _$GetParamaterGiziToJson(this);
}
