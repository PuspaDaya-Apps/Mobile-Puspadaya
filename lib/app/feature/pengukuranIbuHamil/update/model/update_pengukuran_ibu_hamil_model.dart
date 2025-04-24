import 'package:json_annotation/json_annotation.dart';

// part 'update_pengukuran_ibu_hamil_model.g.dart';

// @JsonSerializable()
class UpdatePengukuranIbuHamilModel {
  @JsonKey(name: "tempat_pengukuran")
  String tempatPengukuran;

  @JsonKey(name: "berat_badan")
  double? beratBadan;
  @JsonKey(name: "tinggi_badan")
  double? tinggiBadan;
  @JsonKey(name: "tinggi_fundus_uteri")
  double? tinggiFundusUteri;
  @JsonKey(name: "lingkar_lengan_atas")
  double? lingkarLenganAtas;

  double? hemoglobin;
  @JsonKey(name: "terpapar_asap_rokok")
  String terpaparAsapRokok;
  @JsonKey(name: "jumlah_tablet_fe")
  int jumlahTabletFe;
  String? catatan;

  @JsonKey(name: "alat_berat_badan_id")
  String alatBeratBadanId;
  @JsonKey(name: "alat_tinggi_badan_id")
  String alatTinggiBadanId;
  @JsonKey(name: "alat_tinggi_fundus_uteri_id")
  String alatTinggiFundusUteriId;
  @JsonKey(name: "alat_lingkar_lengan_atas_id")
  String alatLingkarLenganAtasId;

  UpdatePengukuranIbuHamilModel({
    required this.tempatPengukuran,
    this.beratBadan,
    this.tinggiBadan,
    this.tinggiFundusUteri,
    this.lingkarLenganAtas,
    this.hemoglobin,
    required this.terpaparAsapRokok,
    required this.jumlahTabletFe,
    this.catatan,

    required this.alatBeratBadanId,
    required this.alatTinggiBadanId,
    required this.alatTinggiFundusUteriId,
    required this.alatLingkarLenganAtasId,
  });

  factory UpdatePengukuranIbuHamilModel.fromJson(Map<String, dynamic> json) => _$UpdatePengukuranIbuHamilModelFromJson(json);

  Map<String, dynamic> toJson()=>_$UpdatePengukuranIbuHamilModelToJson(this);
}

UpdatePengukuranIbuHamilModel _$UpdatePengukuranIbuHamilModelFromJson(
        Map<String, dynamic> json) =>
    UpdatePengukuranIbuHamilModel(
      tempatPengukuran: json['tempat_pengukuran'] as String,
      beratBadan: (json['berat_badan'] as num?)?.toDouble(),
      tinggiBadan: (json['tinggi_badan'] as num?)?.toDouble(),
      tinggiFundusUteri: (json['tinggi_fundus_uteri'] as num?)?.toDouble(),
      lingkarLenganAtas: (json['lingkar_lengan_atas'] as num?)?.toDouble(),
      hemoglobin: (json['hemoglobin'] as num).toDouble(),
      terpaparAsapRokok: json['terpapar_asap_rokok'] as String,
      jumlahTabletFe: (json['jumlah_tablet_fe'] as num).toInt(),
      catatan: json['catatan'] as String?,
      alatBeratBadanId: json['alat_berat_badan_id'] as String,
      alatTinggiBadanId: json['alat_tinggi_badan_id'] as String,
      alatTinggiFundusUteriId: json['alat_tinggi_fundus_uteri_id'] as String,
      alatLingkarLenganAtasId: json['alat_lingkar_lengan_atas_id'] as String,
    );

Map<String, dynamic> _$UpdatePengukuranIbuHamilModelToJson(
        UpdatePengukuranIbuHamilModel instance) =>
    <String, dynamic>{
      'tempat_pengukuran': instance.tempatPengukuran,
      'berat_badan': instance.beratBadan,
      'tinggi_badan': instance.tinggiBadan,
      'tinggi_fundus_uteri': instance.tinggiFundusUteri,
      'lingkar_lengan_atas': instance.lingkarLenganAtas,
      'hemoglobin': instance.hemoglobin,
      'terpapar_asap_rokok': instance.terpaparAsapRokok,
      'jumlah_tablet_fe': instance.jumlahTabletFe,
      'catatan': instance.catatan,
      'alat_berat_badan_id': instance.alatBeratBadanId,
      'alat_tinggi_badan_id': instance.alatTinggiBadanId,
      'alat_tinggi_fundus_uteri_id': instance.alatTinggiFundusUteriId,
      'alat_lingkar_lengan_atas_id': instance.alatLingkarLenganAtasId,
    };
