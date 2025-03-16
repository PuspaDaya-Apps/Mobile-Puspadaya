import 'package:json_annotation/json_annotation.dart';

// part 'alat_ukur_response_model.g.dart';

//@JsonSerializable()
class AlatUkurResponseModel {
  String message;
  List<Data>? data = [];

  AlatUkurResponseModel({
    required this.message,
    this.data,
  });

  factory AlatUkurResponseModel.fromJson(Map<String, dynamic> json) => _$AlatUkurResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$AlatUkurResponseModelToJson(this);
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

AlatUkurResponseModel _$AlatUkurResponseModelFromJson(
        Map<String, dynamic> json) =>
    AlatUkurResponseModel(
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AlatUkurResponseModelToJson(
        AlatUkurResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
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
