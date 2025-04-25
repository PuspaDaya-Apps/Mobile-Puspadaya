import 'package:json_annotation/json_annotation.dart';

// part 'pengukuran_anak_model.g.dart';

// @JsonSerializable()
class PengukuranAnakModel {
  @JsonKey(name : 'tempat_pengukuran')
  String tempatPengukuran;
  @JsonKey(name : 'tanggal_pengukuran')
  DateTime tanggalPengukuran;
  @JsonKey(name : 'posisi_badan')
  String posisiBadan;
  
  @JsonKey(name : 'berat_badan')
  double? beratBadan;
  @JsonKey(name : 'alat_berat_badan_id')
  String alatBeratBadanId;
  
  @JsonKey(name : 'tinggi_badan')
  double? tinggiBadan;
  @JsonKey(name : 'alat_tinggi_badan_id')
  String alatTinggiBadanId;

  @JsonKey(name : 'lingkar_lengan_atas')
  double? lingkarLenganAtas;
  @JsonKey(name : 'alat_lingkar_lengan_id')
  String? alatLingkarLenganId;
  
  @JsonKey(name : 'lingkar_kepala')
  double? lingkarKepala;
  @JsonKey(name : 'alat_lingkar_kepala_id')
  String? alatLingkarKepalaId;
  
  @JsonKey(name : 'asi_eksklusif')
  String? asiEksklusif;
  String? mpasi;
  String? catatan;
  String? keluhan;

  @JsonKey(name : 'anak_id')
  String anakId;

  PengukuranAnakModel({
    required this.tempatPengukuran,
    required this.tanggalPengukuran,
    required this.posisiBadan,

    this.beratBadan,
    required this.alatBeratBadanId,
    this.tinggiBadan,
    required this.alatTinggiBadanId,

    this.lingkarLenganAtas,
    this.alatLingkarLenganId,
    this.lingkarKepala,
    this.alatLingkarKepalaId,
    this.asiEksklusif,
    this.mpasi,
    this.keluhan,
    this.catatan,

    required this.anakId,
  });

  factory PengukuranAnakModel.fromJson(Map<String, dynamic> json) => _$PengukuranAnakModelFromJson(json);

  Map<String, dynamic> toJson()=>_$PengukuranAnakModelToJson(this);
}


PengukuranAnakModel _$PengukuranAnakModelFromJson(Map<String, dynamic> json) =>
    PengukuranAnakModel(
      tempatPengukuran: json['tempat_pengukuran'] as String,
      tanggalPengukuran: DateTime.parse(json['tanggal_pengukuran'] as String),
      posisiBadan: json['posisi_badan'] as String,
      beratBadan: (json['berat_badan'] as num?)?.toDouble(),
      alatBeratBadanId: json['alat_berat_badan_id'] as String,
      tinggiBadan: (json['tinggi_badan'] as num?)?.toDouble(),
      alatTinggiBadanId: json['alat_tinggi_badan_id'] as String,
      lingkarLenganAtas: (json['lingkar_lengan_atas'] as num?)?.toDouble(),
      alatLingkarLenganId: json['alat_lingkar_lengan_id'] as String?,
      lingkarKepala: (json['lingkar_kepala'] as num?)?.toDouble(),
      alatLingkarKepalaId: json['alat_lingkar_kepala_id'] as String?,
      asiEksklusif: json['asi_eksklusif'] as String?,
      mpasi: json['mpasi'] as String?,
      keluhan: json['keluhan'] as String?,
      catatan: json['catatan'] as String?,
      anakId: json['anak_id'] as String,
    );

Map<String, dynamic> _$PengukuranAnakModelToJson(
        PengukuranAnakModel instance) =>
    <String, dynamic>{
      'tempat_pengukuran': instance.tempatPengukuran,
      'tanggal_pengukuran': instance.tanggalPengukuran.toIso8601String(),
      'posisi_badan': instance.posisiBadan,
      'berat_badan': instance.beratBadan,
      'alat_berat_badan_id': instance.alatBeratBadanId,
      'tinggi_badan': instance.tinggiBadan,
      'alat_tinggi_badan_id': instance.alatTinggiBadanId,
      'lingkar_lengan_atas': instance.lingkarLenganAtas,
      'alat_lingkar_lengan_id': instance.alatLingkarLenganId,
      'lingkar_kepala': instance.lingkarKepala,
      'alat_lingkar_kepala_id': instance.alatLingkarKepalaId,
      'asi_eksklusif': instance.asiEksklusif,
      'mpasi': instance.mpasi,
      'catatan': instance.catatan,
      'keluhan': instance.keluhan,
      'anak_id': instance.anakId,
    };
