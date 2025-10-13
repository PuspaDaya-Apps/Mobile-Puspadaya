import 'package:json_annotation/json_annotation.dart';

// part 'detail_pengukuran_tamu_response_model.g.dart';

//@JsonSerializable()
class DetailPengukuranTamuResponseModel {
  String messsage;
  Data? data;

  DetailPengukuranTamuResponseModel({
    required this.messsage,
    this.data
  });

  factory DetailPengukuranTamuResponseModel.fromJson(Map<String, dynamic> json) => _$DetailPengukuranTamuResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$DetailPengukuranTamuResponseModelToJson(this);
}

//@JsonSerializable()
class Data {
  String id;
  @JsonKey(name: "tempat_pengukuran")
  String tempatPengukuran;
  @JsonKey(name: "tanggal_pengukuran")
  DateTime tanggalPengukuran;
  @JsonKey(name: "posisi_badan")
  String posisiBadan;
  @JsonKey(name: "berat_badan")
  String beratBadan;
  @JsonKey(name: "tinggi_badan")
  String tinggiBadan;
  @JsonKey(name: "lingkar_lengan_atas")
  String lingkarLenganAtas;
  @JsonKey(name: "lingkar_kepala")
  String lingkarKepala;
  String mpasi;
  @JsonKey(name: "asi_eksklusif")
  String asiEksklusif;
  @JsonKey(name: "status_stunting")
  String statusStunting;
  @JsonKey(name: "status_gizi")
  String statusGizi;
  @JsonKey(name: "status_wasting")
  String statusWasting;
  Anak anak;
  @JsonKey(name: "alat_berat_badan")
  AlatUkur alatBeratBadan;
  @JsonKey(name: "alat_lingkar_kepala")
  AlatUkur alatLingkarKepala;
  @JsonKey(name: "alat_tinggi_badan")
  AlatUkur alatTinggiBadan;
  @JsonKey(name: "alat_lingkar_lengan")
  AlatUkur alatLingkarLengan;
  @JsonKey(name : 'vitamin_a')
  bool? vitaminA;
  @JsonKey(name : 'obat_cacing')
  bool? obatCacing;

  Posyandu posyandu;
  Kader kader;
  String catatan;
  String keluhan;

  Data({
    required this.id,
    required this.tempatPengukuran,
    required this.tanggalPengukuran,
    required this.posisiBadan,
    required this.beratBadan,
    required this.tinggiBadan,
    required this.lingkarLenganAtas,
    required this.lingkarKepala,
    required this.mpasi,
    required this.asiEksklusif,
    required this.statusStunting,
    required this.statusGizi,
    required this.statusWasting,
    required this.anak,
    required this.alatBeratBadan,
    required this.alatLingkarKepala,
    required this.alatLingkarLengan,
    required this.alatTinggiBadan,
    required this.kader,
    required this.posyandu,
    required this.catatan,
    required this.keluhan,
    this.vitaminA,
    this.obatCacing
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson()=>_$DataToJson(this);
}

//@JsonSerializable()
class Anak {
  String id;
  @JsonKey(name: 'nama_anak')
  String namaAnak;
  String nik;
  @JsonKey(name: 'posyandu_asal')
  String posyanduAsal;

  Anak({
    required this.id,
    required this.namaAnak,
    required this.nik,
    required this.posyanduAsal
  });

  factory Anak.fromJson(Map<String, dynamic> json) => _$AnakFromJson(json);

  Map<String, dynamic> toJson()=>_$AnakToJson(this);
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

//@JsonSerializable()
class Posyandu {
  String id;
  @JsonKey(name: 'nama_posyandu')
  String namaPosyandu;

  Posyandu({
    required this.id,
    required this.namaPosyandu
  });

  factory Posyandu.fromJson(Map<String, dynamic> json) => _$PosyanduFromJson(json);

  Map<String, dynamic> toJson()=>_$PosyanduToJson(this);
}

//@JsonSerializable()
class Kader {
  String id;
  @JsonKey(name: 'nama_lengkap')
  String namaLengkap;

  Kader({
    required this.id,
    required this.namaLengkap
  });

  factory Kader.fromJson(Map<String, dynamic> json) => _$KaderFromJson(json);

  Map<String, dynamic> toJson()=>_$KaderToJson(this);
}

DetailPengukuranTamuResponseModel _$DetailPengukuranTamuResponseModelFromJson(
        Map<String, dynamic> json) =>
    DetailPengukuranTamuResponseModel(
      messsage: json['messsage'] as String,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DetailPengukuranTamuResponseModelToJson(
        DetailPengukuranTamuResponseModel instance) =>
    <String, dynamic>{
      'messsage': instance.messsage,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as String,
      tempatPengukuran: json['tempat_pengukuran'] as String,
      tanggalPengukuran: DateTime.parse(json['tanggal_pengukuran'] as String),
      posisiBadan: json['posisi_badan'] as String,
      beratBadan: json['berat_badan'] as String,
      tinggiBadan: json['tinggi_badan'] as String,
      lingkarLenganAtas: json['lingkar_lengan_atas'] as String,
      lingkarKepala: json['lingkar_kepala'] as String,
      mpasi: json['mpasi'] as String,
      asiEksklusif: json['asi_eksklusif'] as String,
      statusStunting: json['status_stunting'] as String,
      statusGizi: json['status_gizi'] as String,
      statusWasting: json['status_wasting'] as String,
      anak: Anak.fromJson(json['anak'] as Map<String, dynamic>),
      alatBeratBadan:
          AlatUkur.fromJson(json['alat_berat_badan'] as Map<String, dynamic>),
      alatLingkarKepala: AlatUkur.fromJson(
          json['alat_lingkar_kepala'] as Map<String, dynamic>),
      alatLingkarLengan: AlatUkur.fromJson(
          json['alat_lingkar_lengan'] as Map<String, dynamic>),
      alatTinggiBadan:
          AlatUkur.fromJson(json['alat_tinggi_badan'] as Map<String, dynamic>),
      vitaminA: json['vitamin_a'] as bool?,
      obatCacing: json['obat_cacing'] as bool?,
      kader: Kader.fromJson(json['kader'] as Map<String, dynamic>),
      posyandu: Posyandu.fromJson(json['posyandu'] as Map<String, dynamic>),
      catatan: json['catatan'] as String,
      keluhan: json['keluhan'] as String,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'tempat_pengukuran': instance.tempatPengukuran,
      'tanggal_pengukuran': instance.tanggalPengukuran.toIso8601String(),
      'posisi_badan': instance.posisiBadan,
      'berat_badan': instance.beratBadan,
      'tinggi_badan': instance.tinggiBadan,
      'lingkar_lengan_atas': instance.lingkarLenganAtas,
      'lingkar_kepala': instance.lingkarKepala,
      'mpasi': instance.mpasi,
      'asi_eksklusif': instance.asiEksklusif,
      'status_stunting': instance.statusStunting,
      'status_gizi': instance.statusGizi,
      'status_wasting': instance.statusWasting,
      'anak': instance.anak,
      'alat_berat_badan': instance.alatBeratBadan,
      'alat_lingkar_kepala': instance.alatLingkarKepala,
      'alat_tinggi_badan': instance.alatTinggiBadan,
      'alat_lingkar_lengan': instance.alatLingkarLengan,
      'vitamin_a': instance.vitaminA,
      'obat_cacing': instance.obatCacing,
      'posyandu': instance.posyandu,
      'kader': instance.kader,
      'catatan': instance.catatan,
      'keluhan': instance.keluhan,
    };

Anak _$AnakFromJson(Map<String, dynamic> json) => Anak(
      id: json['id'] as String,
      namaAnak: json['nama_anak'] as String,
      nik: json['nik'] as String,
      posyanduAsal: json['posyandu_asal'] as String,
    );

Map<String, dynamic> _$AnakToJson(Anak instance) => <String, dynamic>{
      'id': instance.id,
      'nama_anak': instance.namaAnak,
      'nik': instance.nik,
      'posyandu_asal': instance.posyanduAsal,
    };

AlatUkur _$AlatUkurFromJson(Map<String, dynamic> json) => AlatUkur(
      id: json['id'] as String,
      jenisAlat: json['jenis_alat'] as String,
    );

Map<String, dynamic> _$AlatUkurToJson(AlatUkur instance) => <String, dynamic>{
      'id': instance.id,
      'jenis_alat': instance.jenisAlat,
    };

Posyandu _$PosyanduFromJson(Map<String, dynamic> json) => Posyandu(
      id: json['id'] as String,
      namaPosyandu: json['nama_posyandu'] as String,
    );

Map<String, dynamic> _$PosyanduToJson(Posyandu instance) => <String, dynamic>{
      'id': instance.id,
      'nama_posyandu': instance.namaPosyandu,
    };

Kader _$KaderFromJson(Map<String, dynamic> json) => Kader(
      id: json['id'] as String,
      namaLengkap: json['nama_lengkap'] as String,
    );

Map<String, dynamic> _$KaderToJson(Kader instance) => <String, dynamic>{
      'id': instance.id,
      'nama_lengkap': instance.namaLengkap,
    };
