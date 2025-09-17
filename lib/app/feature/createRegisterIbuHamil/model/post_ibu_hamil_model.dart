import 'package:json_annotation/json_annotation.dart';
// part 'post_ibu_hamil_model.g.dart';

// @JsonSerializable()
class PostIbuHamilModel {
  @JsonKey(name: "ibu_id")
  final String ibuId;
  @JsonKey(name: "berat_badan")
  double? beratBadan;
  @JsonKey(name: "alat_berat_badan_id")
  final String alatBeratBadanId;
  @JsonKey(name: "tinggi_badan")
  double? tinggiBadan;
  @JsonKey(name: "alat_tinggi_badan_id")
  final String alatTinggiBadanId;
  @JsonKey(name: "hemoglobin")
  double? hemoglobin;
  @JsonKey(name: "jumlah_tablet_fe")
  final int jumlahTabletFe;
  @JsonKey(name: "tanggal_pertama_haid")
  final String tanggalPertamaHaid;
  @JsonKey(name: "tanggal_terakhir_haid")
  String? tanggalTerakhirHaid;
  @JsonKey(name: "lingkar_lengan_atas")
  double? lingkarLenganAtas;
  @JsonKey(name: "alat_lingkar_lengan_id")
  final String alatLingkarLenganId;
  @JsonKey(name: "tinggi_fundus_uteri")
  double? tinggiFundusUteri;
  @JsonKey(name: "alat_tinggi_fundus_id")
  final String alatTinggiFundusId;
  @JsonKey(name: "terpapar_asap_rokok")
  final String terpaparAsapRokok;
  @JsonKey(name: "jarak")
  double? jarak;
  @JsonKey(name: "catatan")
  final String catatan;
  @JsonKey(name: "memiliki_bpjs")
  final String memilkiBPJS;
  @JsonKey(name: "nama_bpjs")
  final String? namaBPJS;
  @JsonKey(name: "bayi_lahir_hidup")
  bool bayiLahirHidup = false;
  @JsonKey(name: "bayi_lahir_meninggal")
  bool bayiLahirMeninggal= false;
  @JsonKey(name: "ibu_meninggal")
  bool ibuMeninggal = false;
  @JsonKey(name: "lahir_hidup")
  bool lahirPindah= false;

  @JsonKey(name: "tanggal_pengukuran")
  final String tanggalPengukuran;

  PostIbuHamilModel({
    required this.ibuId,
    this.beratBadan,
    required this.alatBeratBadanId,
    this.tinggiBadan,
    required this.alatTinggiBadanId,
    this.hemoglobin,
    required this.jumlahTabletFe,
    required this.tanggalPertamaHaid,
    this.tanggalTerakhirHaid,
    this.lingkarLenganAtas,
    required this.alatLingkarLenganId,
    this.tinggiFundusUteri,
    required this.alatTinggiFundusId,
    required this.jarak,
    required this.terpaparAsapRokok,
    required this.catatan,
    required this.memilkiBPJS,
    this.namaBPJS,
    required this.tanggalPengukuran,
    required this.bayiLahirHidup,
    required this.bayiLahirMeninggal,
    required this.ibuMeninggal,
    required this.lahirPindah
  });

  factory PostIbuHamilModel.fromJson(Map<String, dynamic> json) => _$PostIbuHamilModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostIbuHamilModelToJson(this);
}

PostIbuHamilModel _$PostIbuHamilModelFromJson(Map<String, dynamic> json) =>
    PostIbuHamilModel(
      jarak: (json['jarak'] as num?)?.toDouble(),
      ibuId: json['ibu_id'] as String,
      beratBadan: (json['berat_badan'] as num?)?.toDouble(),
      alatBeratBadanId: json['alat_berat_badan_id'] as String,
      tinggiBadan: (json['tinggi_badan'] as num?)?.toDouble(),
      alatTinggiBadanId: json['alat_tinggi_badan_id'] as String,
      hemoglobin: (json['hemoglobin'] as num?)?.toDouble(),
      jumlahTabletFe: (json['jumlah_tablet_fe'] as num).toInt(),
      tanggalPertamaHaid: json['tanggal_pertama_haid'] as String,
      tanggalTerakhirHaid: json['tanggal_terakhir_haid'] as String?,
      lingkarLenganAtas: (json['lingkar_lengan_atas'] as num?)?.toDouble(),
      alatLingkarLenganId: json['alat_lingkar_lengan_id'] as String,
      tinggiFundusUteri: (json['tinggi_fundus_uteri'] as num?)?.toDouble(),
      alatTinggiFundusId: json['alat_tinggi_fundus_id'] as String,
      terpaparAsapRokok: json['terpapar_asap_rokok'] as String,
      catatan: json['catatan'] as String,
      memilkiBPJS: json['memiliki_bpjs'] as String,
      namaBPJS: json['nama_bpjs'] as String?,
      tanggalPengukuran: json['tanggal_pengukuran'] as String,
      bayiLahirHidup: json['bayi_lahir_hidup'] as bool,
      bayiLahirMeninggal: json['bayi_lahir_meninggal'] as bool,
      ibuMeninggal: json['ibu_meninggal'] as bool,
      lahirPindah: json['lahir_pindah'] as bool,
    );

Map<String, dynamic> _$PostIbuHamilModelToJson(PostIbuHamilModel instance) =>
    <String, dynamic>{
      'ibu_id': instance.ibuId,
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
      'tanggal_pengukuran': instance.tanggalPengukuran,
      'jarak': instance.jarak,
      'bayi_lahir_hidup': instance.bayiLahirHidup,
      'bayi_lahir_meninggal': instance.bayiLahirMeninggal,
      'ibu_meninggal': instance.ibuMeninggal,
      'lahir_pindah': instance.lahirPindah,
    };
