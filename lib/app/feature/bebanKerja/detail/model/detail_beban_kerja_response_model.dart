import 'package:json_annotation/json_annotation.dart';

// part 'detail_beban_kerja_response_model.g.dart';

// @JsonSerializable()
class DetailBebanKerjaResponseModel {
  String message;
  String? error;
  Data? data;

  DetailBebanKerjaResponseModel({
    required this.message,
    this.error,
    this.data,
  });

  factory DetailBebanKerjaResponseModel.fromJson(Map<String, dynamic> json) => _$DetailBebanKerjaResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$DetailBebanKerjaResponseModelToJson(this);
}

// @JsonSerializable()
class Data {
  String id;
  DateTime bulan;
  @JsonKey(name: 'total_skor')
  num totalSkor;
  Kader kader;
  @JsonKey(name: 'penugasan_kader')
  List<PenugasanKader>? penugasanKader;

  Data({
    required this.id,
    required this.bulan,
    required this.totalSkor,
    required this.kader,
    this.penugasanKader
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson()=>_$DataToJson(this);
}

// @JsonSerializable()
class Kader {
  String id;
  @JsonKey(name: 'nama_lengkap')
  String namaLengkap;

  Kader({
    required this.id,
    required this.namaLengkap,
  });

  factory Kader.fromJson(Map<String, dynamic> json) => _$KaderFromJson(json);

  Map<String, dynamic> toJson()=>_$KaderToJson(this);
}

// @JsonSerializable()
class PenugasanKader {
  String id;
  DateTime bulan;
  @JsonKey(name: 'tugas_kader')
  TugasKader tugasKader;

  PenugasanKader({
    required this.id,
    required this.bulan,
    required this.tugasKader
  });

  factory PenugasanKader.fromJson(Map<String, dynamic> json) => _$PenugasanKaderFromJson(json);

  Map<String, dynamic> toJson()=>_$PenugasanKaderToJson(this);
}

// @JsonSerializable()
class TugasKader {
  String id;
  @JsonKey(name: 'nama_kompetensi')
  String namaKompetensi;
  @JsonKey(name: 'kategori_kompetensi')
  String kategoriKompetensi;
  @JsonKey(name: 'jenis_kompetensi')
  String jenisKompetensi;

  TugasKader({
    required this.id,
    required this.namaKompetensi,
    required this.kategoriKompetensi,
    required this.jenisKompetensi
  });

  factory TugasKader.fromJson(Map<String, dynamic> json) => _$TugasKaderFromJson(json);

  Map<String, dynamic> toJson()=>_$TugasKaderToJson(this);
}


DetailBebanKerjaResponseModel _$DetailBebanKerjaResponseModelFromJson(
        Map<String, dynamic> json) =>
    DetailBebanKerjaResponseModel(
      message: json['message'] as String,
      error: json['error'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DetailBebanKerjaResponseModelToJson(
        DetailBebanKerjaResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'error': instance.error,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as String,
      bulan: DateTime.parse(json['bulan'] as String),
      totalSkor: json['total_skor'] as num,
      kader: Kader.fromJson(json['kader'] as Map<String, dynamic>),
      penugasanKader: (json['penugasan_kader'] as List<dynamic>?)
          ?.map((e) => PenugasanKader.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'bulan': instance.bulan.toIso8601String(),
      'total_skor': instance.totalSkor,
      'kader': instance.kader,
      'penugasan_kader': instance.penugasanKader,
    };

Kader _$KaderFromJson(Map<String, dynamic> json) => Kader(
      id: json['id'] as String,
      namaLengkap: json['nama_lengkap'] as String,
    );

Map<String, dynamic> _$KaderToJson(Kader instance) => <String, dynamic>{
      'id': instance.id,
      'nama_lengkap': instance.namaLengkap,
    };

PenugasanKader _$PenugasanKaderFromJson(Map<String, dynamic> json) =>
    PenugasanKader(
      id: json['id'] as String,
      bulan: DateTime.parse(json['bulan'] as String),
      tugasKader:
          TugasKader.fromJson(json['tugas_kader'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PenugasanKaderToJson(PenugasanKader instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bulan': instance.bulan.toIso8601String(),
      'tugas_kader': instance.tugasKader,
    };

TugasKader _$TugasKaderFromJson(Map<String, dynamic> json) => TugasKader(
      id: json['id'] as String,
      namaKompetensi: json['nama_kompetensi'] as String,
      kategoriKompetensi: json['kategori_kompetensi'] as String,
      jenisKompetensi: json['jenis_kompetensi'] as String,
    );

Map<String, dynamic> _$TugasKaderToJson(TugasKader instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama_kompetensi': instance.namaKompetensi,
      'kategori_kompetensi': instance.kategoriKompetensi,
      'jenis_kompetensi': instance.jenisKompetensi,
    };
