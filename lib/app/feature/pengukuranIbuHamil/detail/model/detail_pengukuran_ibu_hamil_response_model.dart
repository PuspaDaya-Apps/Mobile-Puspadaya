import 'package:json_annotation/json_annotation.dart';

// part 'detail_pengukuran_ibu_hamil_response_model.g.dart';

//@JsonSerializable()
class DetailPengukuranIbuHamilResponseModel {
  String message;
  Data? data;

  DetailPengukuranIbuHamilResponseModel({
    required this.message,
    this.data
  });

  factory DetailPengukuranIbuHamilResponseModel.fromJson(Map<String, dynamic> json) => _$DetailPengukuranIbuHamilResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$DetailPengukuranIbuHamilResponseModelToJson(this);
}

//@JsonSerializable()
class Data {
  String id;
  @JsonKey(name: "tempat_pengukuran")
  String tempatPengukuran;
  @JsonKey(name: "tanggal_pengukuran")
  DateTime tanggalPengukuran;
  @JsonKey(name: "usia_ibu_hamil")
  String usiaIbuHamil;
  @JsonKey(name: "usia_kehamilan")
  String usiaKehamilan;

  @JsonKey(name: "berat_badan")
  String beratBadan;
  @JsonKey(name: "tinggi_badan")
  String tinggiBadan;
  @JsonKey(name: "tinggi_fundus_uteri")
  String? tinggiFundusUteri;
  @JsonKey(name: "lingkar_lengan_atas")
  String lingkarLenganAtas;
  String? hemoglobin;
  @JsonKey(name: "terpapar_asap_rokok")
  String terpaparAsapRokok;
  @JsonKey(name: "jumlah_tablet_fe")
  int jumlahTabletFe;
  String? catatan;
  @JsonKey(name: "ibu_hamil")
  IbuHamil ibuHamil;

  @JsonKey(name: "alat_berat_badan")
  AlatUkur alatBeratBadan;
  @JsonKey(name: "alat_tinggi_badan")
  AlatUkur alatTinggiBadan;
  @JsonKey(name: "alat_tinggi_fundus")
  AlatUkur alatTinggiFundus;
  @JsonKey(name: "alat_lingkar_lengan")
  AlatUkur alatLingkarLengan;

  Data({
    required this.id,
    required this.tempatPengukuran,
    required this.tanggalPengukuran,
    required this.usiaIbuHamil,
    required this.usiaKehamilan,

    required this.beratBadan,
    required this.tinggiBadan,
    this.tinggiFundusUteri,
    required this.lingkarLenganAtas,
    this.hemoglobin,
    required this.terpaparAsapRokok,
    required this.jumlahTabletFe,
    this.catatan,
    required this.ibuHamil,

    required this.alatBeratBadan,
    required this.alatTinggiBadan,
    required this.alatTinggiFundus,
    required this.alatLingkarLengan,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson()=>_$DataToJson(this);
}

//@JsonSerializable()
class IbuHamil {
  String id;
  String nama;
  String nik;
  @JsonKey(name: "tanggal_pertama_haid")
  DateTime tanggalPertamaHaid;
  @JsonKey(name: "tanggal_terakhir_haid")
  dynamic tanggalTerakhirHaid;

  IbuHamil({
    required this.id,
    required this.nama,
    required this.nik,
    required this.tanggalPertamaHaid,
    required this.tanggalTerakhirHaid
  });

  factory IbuHamil.fromJson(Map<String, dynamic> json) => _$IbuHamilFromJson(json);

  Map<String, dynamic> toJson()=>_$IbuHamilToJson(this);
}

//@JsonSerializable()
class AlatUkur {
  String id;
  @JsonKey(name: 'jenis_alat')
  String jenisAlat;

  AlatUkur({
    required this.id,
    required this.jenisAlat
  });

  factory AlatUkur.fromJson(Map<String, dynamic> json) => _$AlatUkurFromJson(json);

  Map<String, dynamic> toJson()=>_$AlatUkurToJson(this);
}

DetailPengukuranIbuHamilResponseModel
    _$DetailPengukuranIbuHamilResponseModelFromJson(
            Map<String, dynamic> json) =>
        DetailPengukuranIbuHamilResponseModel(
          message: json['message'] as String,
          data: json['data'] == null
              ? null
              : Data.fromJson(json['data'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$DetailPengukuranIbuHamilResponseModelToJson(
        DetailPengukuranIbuHamilResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as String,
      tempatPengukuran: json['tempat_pengukuran'] as String,
      tanggalPengukuran: DateTime.parse(json['tanggal_pengukuran'] as String),
      usiaIbuHamil: json['usia_ibu_hamil'] as String,
      usiaKehamilan: json['usia_kehamilan'] as String,
      beratBadan: json['berat_badan'] as String,
      tinggiBadan: json['tinggi_badan'] as String,
      tinggiFundusUteri: json['tinggi_fundus_uteri'] as String?,
      lingkarLenganAtas: json['lingkar_lengan_atas'] as String,
      hemoglobin: json['hemoglobin'] as String?,
      terpaparAsapRokok: json['terpapar_asap_rokok'] as String,
      jumlahTabletFe: (json['jumlah_tablet_fe'] as num).toInt(),
      catatan: json['catatan'] as String?,
      ibuHamil: IbuHamil.fromJson(json['ibu_hamil'] as Map<String, dynamic>),
      alatBeratBadan:
          AlatUkur.fromJson(json['alat_berat_badan'] as Map<String, dynamic>),
      alatTinggiBadan:
          AlatUkur.fromJson(json['alat_tinggi_badan'] as Map<String, dynamic>),
      alatTinggiFundus:
          AlatUkur.fromJson(json['alat_tinggi_fundus'] as Map<String, dynamic>),
      alatLingkarLengan: AlatUkur.fromJson(
          json['alat_lingkar_lengan'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'tempat_pengukuran': instance.tempatPengukuran,
      'tanggal_pengukuran': instance.tanggalPengukuran.toIso8601String(),
      'usia_ibu_hamil': instance.usiaIbuHamil,
      'usia_kehamilan': instance.usiaKehamilan,
      'berat_badan': instance.beratBadan,
      'tinggi_badan': instance.tinggiBadan,
      'tinggi_fundus_uteri': instance.tinggiFundusUteri,
      'lingkar_lengan_atas': instance.lingkarLenganAtas,
      'hemoglobin': instance.hemoglobin,
      'terpapar_asap_rokok': instance.terpaparAsapRokok,
      'jumlah_tablet_fe': instance.jumlahTabletFe,
      'catatan': instance.catatan,
      'ibu_hamil': instance.ibuHamil,
      'alat_berat_badan': instance.alatBeratBadan,
      'alat_tinggi_badan': instance.alatTinggiBadan,
      'alat_tinggi_fundus': instance.alatTinggiFundus,
      'alat_lingkar_lengan': instance.alatLingkarLengan,
    };

IbuHamil _$IbuHamilFromJson(Map<String, dynamic> json) => IbuHamil(
      id: json['id'] as String,
      nama: json['nama'] as String,
      nik: json['nik'] as String,
      tanggalPertamaHaid:
          DateTime.parse(json['tanggal_pertama_haid'] as String),
      tanggalTerakhirHaid: json['tanggal_terakhir_haid'] != "-"
      ? DateTime.parse(json['tanggal_terakhir_haid'] as String)
      : json['tanggal_terakhir_haid'] as String,
    );

Map<String, dynamic> _$IbuHamilToJson(IbuHamil instance) => <String, dynamic>{
      'id': instance.id,
      'nama': instance.nama,
      'nik': instance.nik,
      'tanggal_pertama_haid': instance.tanggalPertamaHaid.toIso8601String(),
      'tanggal_terakhir_haid': instance.tanggalTerakhirHaid.toIso8601String(),
    };

AlatUkur _$AlatUkurFromJson(Map<String, dynamic> json) => AlatUkur(
      id: json['id'] as String,
      jenisAlat: json['jenis_alat'] as String,
    );

Map<String, dynamic> _$AlatUkurToJson(AlatUkur instance) => <String, dynamic>{
      'id': instance.id,
      'jenis_alat': instance.jenisAlat,
    };
