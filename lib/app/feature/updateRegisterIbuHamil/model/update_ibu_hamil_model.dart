import 'package:json_annotation/json_annotation.dart';
// part 'update_ibu_hamil_model.g.dart';

// @JsonSerializable()
class UpdateIbuHamilModel {
  @JsonKey(name: "usia_kehamilan")
  final int usiaKehamilan;
  @JsonKey(name: "berat_badan")
  final double beratBadan;
  @JsonKey(name: "alat_berat_badan_id")
  final String alatBeratBadanId;
  @JsonKey(name: "tinggi_badan")
  final double tinggiBadan;
  @JsonKey(name: "alat_tinggi_badan_id")
  final String alatTinggiBadanId;
  @JsonKey(name: "hemoglobin")
  final double hemoglobin;
  @JsonKey(name: "jumlah_tablet_fe")
  final int jumlahTabletFe;
  @JsonKey(name: "tanggal_pertama_haid")
  final String tanggalPertamaHaid;
  @JsonKey(name: "tanggal_terakhir_haid")
  final String tanggalTerakhirHaid;
  @JsonKey(name: "lingkar_lengan_atas")
  final double lingkarLenganAtas;
  @JsonKey(name: "alat_lingkar_lengan_id")
  final String alatLingkarLenganId;
  @JsonKey(name: "tinggi_fundus_uteri")
  final double tinggiFundusUteri;
  @JsonKey(name: "alat_tinggi_fundus_id")
  final String alatTinggiFundusId;
  @JsonKey(name: "terpapar_asap_rokok")
  final String terpaparAsapRokok;
  @JsonKey(name: "catatan")
  final String catatan;
  @JsonKey(name: "memiliki_bpjs")
  final String memilkiBPJS;
  @JsonKey(name: "nama_bpjs")
  final String? namaBPJS;

  UpdateIbuHamilModel({
    required this.usiaKehamilan,
    required this.beratBadan,
    required this.alatBeratBadanId,
    required this.tinggiBadan,
    required this.alatTinggiBadanId,
    required this.hemoglobin,
    required this.jumlahTabletFe,
    required this.tanggalPertamaHaid,
    required this.tanggalTerakhirHaid,
    required this.lingkarLenganAtas,
    required this.alatLingkarLenganId,
    required this.tinggiFundusUteri,
    required this.alatTinggiFundusId,
    required this.terpaparAsapRokok,
    required this.catatan,
    required this.memilkiBPJS,
    this.namaBPJS
  });

  factory UpdateIbuHamilModel.fromJson(Map<String, dynamic> json) => _$UpdateIbuHamilModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateIbuHamilModelToJson(this);
}

UpdateIbuHamilModel _$UpdateIbuHamilModelFromJson(Map<String, dynamic> json) =>
    UpdateIbuHamilModel(
      usiaKehamilan: (json['usia_kehamilan'] as num).toInt(),
      beratBadan: (json['berat_badan'] as num).toDouble(),
      alatBeratBadanId: json['alat_berat_badan_id'] as String,
      tinggiBadan: (json['tinggi_badan'] as num).toDouble(),
      alatTinggiBadanId: json['alat_tinggi_badan_id'] as String,
      hemoglobin: (json['hemoglobin'] as num).toDouble(),
      jumlahTabletFe: (json['jumlah_tablet_fe'] as num).toInt(),
      tanggalPertamaHaid: json['tanggal_pertama_haid'] as String,
      tanggalTerakhirHaid: json['tanggal_terakhir_haid'] as String,
      lingkarLenganAtas: (json['lingkar_lengan_atas'] as num).toDouble(),
      alatLingkarLenganId: json['alat_lingkar_lengan_id'] as String,
      tinggiFundusUteri: (json['tinggi_fundus_uteri'] as num).toDouble(),
      alatTinggiFundusId: json['alat_tinggi_fundus_id'] as String,
      terpaparAsapRokok: json['terpapar_asap_rokok'] as String,
      catatan: json['catatan'] as String,
      memilkiBPJS: json['memiliki_bpjs'] as String,
      namaBPJS: json['nama_bpjs'] as String?,
    );

Map<String, dynamic> _$UpdateIbuHamilModelToJson(UpdateIbuHamilModel instance) =>
    <String, dynamic>{
      'usia_kehamilan': instance.usiaKehamilan,
      'berat_badan': instance.beratBadan,
      'alat_berat_badan_id': instance.alatBeratBadanId,
      'tinggi_badan': instance.tinggiBadan,
      'alat_tinggi_badan_id': instance.alatTinggiBadanId,
      'hemoglobin': instance.hemoglobin,
      'jumlah_tablet_fe': instance.jumlahTabletFe,
      'tanggal_pertama_haid': instance.tanggalPertamaHaid,
      'tanggal_terakhir_haid': instance.tanggalTerakhirHaid,
      'lingkar_lengan_atas': instance.lingkarLenganAtas,
      'alat_lingkar_lengan_id': instance.alatLingkarLenganId,
      'tinggi_fundus_uteri': instance.tinggiFundusUteri,
      'alat_tinggi_fundus_id': instance.alatTinggiFundusId,
      'terpapar_asap_rokok': instance.terpaparAsapRokok,
      'catatan': instance.catatan,
      'memiliki_bpjs': instance.memilkiBPJS,
      'nama_bpjs': instance.namaBPJS,
    };
