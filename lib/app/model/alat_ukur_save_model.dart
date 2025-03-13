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

//@JsonSerializable()
class Data {
  String id;
  @JsonKey(name: "merek_alat")
  String merekAlat;
  @JsonKey(name: "kondisi_alat")
  String kondisiAlat;
  @JsonKey(name: "alat_pengukuran_admin")
  AlatPengukuranAdmin alatPengukuranAdmin;
  
  Data({
    required this.id,
    required this.merekAlat,
    required this.kondisiAlat, 
    required this.alatPengukuranAdmin
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson()=>_$DataToJson(this);
}

//@JsonSerializable()
class AlatPengukuranAdmin {
  String id;
  @JsonKey(name: "merek_alat")
  String merekAlat;
  @JsonKey(name: "jenis_alat")
  String jenisAlat;
  @JsonKey(name: "status_alat")
  String statusAlat;
  @JsonKey(name: "kondisi_alat")
  String kondisiAlat;

  AlatPengukuranAdmin({
    required this.id,
    required this.merekAlat,
    required this.jenisAlat,
    required this.statusAlat,
    required this.kondisiAlat,
  });

  factory AlatPengukuranAdmin.fromJson(Map<String, dynamic> json) => _$AlatPengukuranAdminFromJson(json);

  Map<String, dynamic> toJson()=>_$AlatPengukuranAdminToJson(this);
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

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as String,
      merekAlat: json['merek_alat'] as String,
      kondisiAlat: json['kondisi_alat'] as String,
      alatPengukuranAdmin: AlatPengukuranAdmin.fromJson(
          json['alat_pengukuran_admin'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'merek_alat': instance.merekAlat,
      'kondisi_alat': instance.kondisiAlat,
      'alat_pengukuran_admin': instance.alatPengukuranAdmin,
    };

AlatPengukuranAdmin _$AlatPengukuranAdminFromJson(Map<String, dynamic> json) =>
    AlatPengukuranAdmin(
      id: json['id'] as String,
      merekAlat: json['merek_alat'] as String,
      jenisAlat: json['jenis_alat'] as String,
      statusAlat: json['status_alat'] as String,
      kondisiAlat: json['kondisi_alat'] as String,
    );

Map<String, dynamic> _$AlatPengukuranAdminToJson(
        AlatPengukuranAdmin instance) =>
    <String, dynamic>{
      'id': instance.id,
      'merek_alat': instance.merekAlat,
      'jenis_alat': instance.jenisAlat,
      'status_alat': instance.statusAlat,
      'kondisi_alat': instance.kondisiAlat,
    };
