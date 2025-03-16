import 'alat_ukur_response_model.dart';
import 'package:json_annotation/json_annotation.dart';

// part 'alat_ukur_save_model.g.dart';

//@JsonSerializable()
class AlatUkurSaveModel {
  @JsonKey(name: "alat_ukur_berat")
  Data? alatUkurBerat;
  @JsonKey(name: "alat_ukur_tinggi")
  Data? alatUkurTinggi;
  @JsonKey(name: "alat_ukur_lingkar_kepala")
  Data? alatUkurLingkarKepala;
  @JsonKey(name: "alat_ukur_lingkar_lengan")
  Data? alatUkurLingkarLengan;
  @JsonKey(name: "alat_ukur_tinggi_fundus")
  Data? alatUkurTinggiFundus;

  AlatUkurSaveModel({
    this.alatUkurBerat,
    this.alatUkurTinggi,
    this.alatUkurLingkarKepala,
    this.alatUkurLingkarLengan,
    this.alatUkurTinggiFundus
  });

  factory AlatUkurSaveModel.fromJson(Map<String, dynamic> json) => _$AlatUkurSaveModelFromJson(json);

  Map<String, dynamic> toJson()=>_$AlatUkurSaveModelToJson(this);
}

AlatUkurSaveModel _$AlatUkurSaveModelFromJson(Map<String, dynamic> json) =>
    AlatUkurSaveModel(
      alatUkurBerat: json['alat_ukur_berat'] == null
          ? null
          : Data.fromJson(json['alat_ukur_berat'] as Map<String, dynamic>),
      alatUkurTinggi: json['alat_ukur_tinggi'] == null
          ? null
          : Data.fromJson(json['alat_ukur_tinggi'] as Map<String, dynamic>),
      alatUkurLingkarKepala: json['alat_ukur_lingkar_kepala'] == null
          ? null
          : Data.fromJson(
              json['alat_ukur_lingkar_kepala'] as Map<String, dynamic>),
      alatUkurLingkarLengan: json['alat_ukur_lingkar_lengan'] == null
          ? null
          : Data.fromJson(
              json['alat_ukur_lingkar_lengan'] as Map<String, dynamic>),
      alatUkurTinggiFundus: json['alat_ukur_tinggi_fundus'] == null
          ? null
          : Data.fromJson(
              json['alat_ukur_tinggi_fundus'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AlatUkurSaveModelToJson(AlatUkurSaveModel instance) =>
    <String, dynamic>{
      'alat_ukur_berat': instance.alatUkurBerat,
      'alat_ukur_tinggi': instance.alatUkurTinggi,
      'alat_ukur_lingkar_kepala': instance.alatUkurLingkarKepala,
      'alat_ukur_lingkar_lengan': instance.alatUkurLingkarLengan,
      'alat_ukur_tinggi_fundus': instance.alatUkurTinggiFundus,
    };
