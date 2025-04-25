import 'package:json_annotation/json_annotation.dart';
// part 'post_pengukuran_ibu_hamil_model.g.dart';

// @JsonSerializable()
class PostPengukuranIbuHamilModel {
  @JsonKey(name: "ibu_hamil_id")
  String ibuHamilId;
  @JsonKey(name: "tempat_pengukuran")
  String tempatPengukuran;
  @JsonKey(name: "tanggal_pengukuran")
  String tanggalPengukuran;

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

  PostPengukuranIbuHamilModel({
    required this.ibuHamilId,
    required this.tempatPengukuran,
    required this.tanggalPengukuran,
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

  factory PostPengukuranIbuHamilModel.fromJson(Map<String, dynamic> json) => _$PostPengukuranIbuHamilModelFromJson(json);

  Map<String, dynamic> toJson()=>_$PostPengukuranIbuHamilModelToJson(this);
}

PostPengukuranIbuHamilModel _$PostPengukuranIbuHamilModelFromJson(
        Map<String, dynamic> json) =>
    PostPengukuranIbuHamilModel(
      ibuHamilId: json['ibu_hamil_id'] as String,
      tempatPengukuran: json['tempat_pengukuran'] as String,
      tanggalPengukuran: json['tanggal_pengukuran'] as String,
      beratBadan: (json['berat_badan'] as num?)?.toDouble(),
      tinggiBadan: (json['tinggi_badan'] as num?)?.toDouble(),
      tinggiFundusUteri: (json['tinggi_fundus_uteri'] as num?)?.toDouble(),
      lingkarLenganAtas: (json['lingkar_lengan_atas'] as num?)?.toDouble(),
      hemoglobin: (json['hemoglobin'] as num?)?.toDouble(),
      terpaparAsapRokok: json['terpapar_asap_rokok'] as String,
      jumlahTabletFe: (json['jumlah_tablet_fe'] as num).toInt(),
      catatan: json['catatan'] as String?,
      alatBeratBadanId: json['alat_berat_badan_id'] as String,
      alatTinggiBadanId: json['alat_tinggi_badan_id'] as String,
      alatTinggiFundusUteriId: json['alat_tinggi_fundus_uteri_id'] as String,
      alatLingkarLenganAtasId: json['alat_lingkar_lengan_atas_id'] as String,
    );

Map<String, dynamic> _$PostPengukuranIbuHamilModelToJson(
        PostPengukuranIbuHamilModel instance) =>
    <String, dynamic>{
      'ibu_hamil_id': instance.ibuHamilId,
      'tempat_pengukuran': instance.tempatPengukuran,
      'tanggal_pengukuran': instance.tanggalPengukuran,
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
