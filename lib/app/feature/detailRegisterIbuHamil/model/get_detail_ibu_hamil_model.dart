import 'package:json_annotation/json_annotation.dart';
part 'get_detail_ibu_hamil_model.g.dart';

@JsonSerializable()
class GetDetailIbuHamilModel {
  @JsonKey(name: "data")
  final Data data;
  @JsonKey(name: "message")
  final String message;

  GetDetailIbuHamilModel({
    required this.data,
    required this.message,
  });

  factory GetDetailIbuHamilModel.fromJson(Map<String, dynamic> json) =>
      _$GetDetailIbuHamilModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetDetailIbuHamilModelToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "created_at")
  final DateTime createdAt;
  @JsonKey(name: "updated_at")
  final DateTime updatedAt;
  @JsonKey(name: "deleted_at")
  final dynamic deletedAt;
  @JsonKey(name: "usia_kehamilan")
  final int usiaKehamilan;
  @JsonKey(name: "berat_badan")
  final String beratBadan;
  @JsonKey(name: "tinggi_badan")
  final String tinggiBadan;
  @JsonKey(name: "hemoglobin")
  final String hemoglobin;
  @JsonKey(name: "jumlah_tablet_fe")
  final int jumlahTabletFe;
  @JsonKey(name: "tanggal_pertama_haid")
  final DateTime tanggalPertamaHaid;
  @JsonKey(name: "tanggal_terakhir_haid")
  final DateTime tanggalTerakhirHaid;
  @JsonKey(name: "lingkar_lengan_atas")
  final String lingkarLenganAtas;
  @JsonKey(name: "tinggi_fundus_uteri")
  final String tinggiFundusUteri;
  @JsonKey(name: "terpapar_asap_rokok")
  final String terpaparAsapRokok;
  @JsonKey(name: "catatan")
  final String catatan;

  Data({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.usiaKehamilan,
    required this.beratBadan,
    required this.tinggiBadan,
    required this.hemoglobin,
    required this.jumlahTabletFe,
    required this.tanggalPertamaHaid,
    required this.tanggalTerakhirHaid,
    required this.lingkarLenganAtas,
    required this.tinggiFundusUteri,
    required this.terpaparAsapRokok,
    required this.catatan,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
