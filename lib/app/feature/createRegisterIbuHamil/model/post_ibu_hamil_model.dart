import 'package:json_annotation/json_annotation.dart';
part 'post_ibu_hamil_model.g.dart';

@JsonSerializable()
class PostIbuHamilModel {
  @JsonKey(name: "ibu_id")
  final String ibuId;
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

  PostIbuHamilModel({
    required this.ibuId,
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
  });

  factory PostIbuHamilModel.fromJson(Map<String, dynamic> json) =>
      _$PostIbuHamilModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostIbuHamilModelToJson(this);
}
