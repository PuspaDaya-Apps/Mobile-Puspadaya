import 'package:json_annotation/json_annotation.dart';

// part 'get_list_tamu_response_model.g.dart';

//@JsonSerializable()
class GetListTamuResponseModel {
  String message;
  List<Data>? data = [];
  Meta? meta;

  GetListTamuResponseModel({
    required this.message,
    this.data,
    this.meta
  });

  factory GetListTamuResponseModel.fromJson(Map<String, dynamic> json) => _$GetListTamuResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$GetListTamuResponseModelToJson(this);
}

//@JsonSerializable()
class Data {
  String id;
  @JsonKey(name: 'nama_anak')
  String namaAnak;
  String nik;
  @JsonKey(name: 'tanggal_lahir')
  DateTime tanggalLahir;
  String usia;
  @JsonKey(name: 'kartu_keluarga')
  KartuKeluarga kartuKeluarga;
  Pengukuran? pengukuran;

  Data({
    required this.id,
    required this.namaAnak,
    required this.nik,
    required this.tanggalLahir,
    required this.usia,
    required this.kartuKeluarga,
    this.pengukuran
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson()=>_$DataToJson(this);
}

//@JsonSerializable()
class KartuKeluarga {
  String id;
  @JsonKey(name: 'nomor_kartu_keluarga')
  String nomorKartuKeluarga;
  Ibu? ibu;

  KartuKeluarga({
    required this.id,
    required this.nomorKartuKeluarga,
    this.ibu,
  });

  factory KartuKeluarga.fromJson(Map<String, dynamic> json) => _$KartuKeluargaFromJson(json);

  Map<String, dynamic> toJson()=>_$KartuKeluargaToJson(this);
}

//@JsonSerializable()
class Ibu {
  @JsonKey(name: 'nama_ibu')
  String? namaIbu;

  Ibu({
    this.namaIbu,
  });

  factory Ibu.fromJson(Map<String, dynamic> json) => _$IbuFromJson(json);

  Map<String, dynamic> toJson()=>_$IbuToJson(this);
}

//@JsonSerializable()
class Pengukuran {
  @JsonKey(name: 'tanggal_pengukuran')
  DateTime tanggalPengukuran;
  Posyandu? posyandu;

  Pengukuran({
    required this.tanggalPengukuran,
    this.posyandu
  });

  factory Pengukuran.fromJson(Map<String, dynamic> json) => _$PengukuranFromJson(json);

  Map<String, dynamic> toJson()=>_$PengukuranToJson(this);
}

//@JsonSerializable()
class Posyandu {
  @JsonKey(name: 'nama_posyandu')
  String? namaPosyandu;

  Posyandu({
    this.namaPosyandu,
  });

  factory Posyandu.fromJson(Map<String, dynamic> json) => _$PosyanduFromJson(json);

  Map<String, dynamic> toJson()=>_$PosyanduToJson(this);
}

//@JsonSerializable()
class Meta {
  int itemsPerPage;
  int totalItems;
  int currentPage;
  int totalPages;

  Meta({
    required this.itemsPerPage,
    required this.totalItems,
    required this.currentPage,
    required this.totalPages
  });

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson()=>_$MetaToJson(this);
}

GetListTamuResponseModel _$GetListTamuResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetListTamuResponseModel(
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetListTamuResponseModelToJson(
        GetListTamuResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
      'meta': instance.meta,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as String,
      namaAnak: json['nama_anak'] as String,
      nik: json['nik'] as String,
      tanggalLahir: DateTime.parse(json['tanggal_lahir'] as String),
      usia: json['usia'] as String,
      kartuKeluarga: KartuKeluarga.fromJson(
          json['kartu_keluarga'] as Map<String, dynamic>),
      pengukuran: json['pengukuran'] == null
          ? null
          : Pengukuran.fromJson(json['pengukuran'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'nama_anak': instance.namaAnak,
      'nik': instance.nik,
      'tanggal_lahir': instance.tanggalLahir.toIso8601String(),
      'usia': instance.usia,
      'kartu_keluarga': instance.kartuKeluarga,
      'pengukuran': instance.pengukuran,
    };

KartuKeluarga _$KartuKeluargaFromJson(Map<String, dynamic> json) =>
    KartuKeluarga(
      id: json['id'] as String,
      nomorKartuKeluarga: json['nomor_kartu_keluarga'] as String,
      ibu: json['ibu'] == null
      ? null 
      : Ibu.fromJson(json['ibu'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$KartuKeluargaToJson(KartuKeluarga instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nomor_kartu_keluarga': instance.nomorKartuKeluarga,
      'ibu': instance.ibu,
    };

Ibu _$IbuFromJson(Map<String, dynamic> json) => Ibu(
      namaIbu: json['nama_ibu'] as String?,
    );

Map<String, dynamic> _$IbuToJson(Ibu instance) => <String, dynamic>{
      'nama_ibu': instance.namaIbu,
    };

Pengukuran _$PengukuranFromJson(Map<String, dynamic> json) => Pengukuran(
      tanggalPengukuran: DateTime.parse(json['tanggal_pengukuran'] as String),
      posyandu: json['posyandu'] == null
      ? null
      : Posyandu.fromJson(json['posyandu'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PengukuranToJson(Pengukuran instance) =>
    <String, dynamic>{
      'tanggal_pengukuran': instance.tanggalPengukuran.toIso8601String(),
      'posyandu': instance.posyandu,
    };

Posyandu _$PosyanduFromJson(Map<String, dynamic> json) => Posyandu(
      namaPosyandu: json['nama_posyandu'] as String?,
    );

Map<String, dynamic> _$PosyanduToJson(Posyandu instance) => <String, dynamic>{
      'nama_posyandu': instance.namaPosyandu,
    };

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
      itemsPerPage: (json['itemsPerPage'] as num).toInt(),
      totalItems: (json['totalItems'] as num).toInt(),
      currentPage: (json['currentPage'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
    );

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'itemsPerPage': instance.itemsPerPage,
      'totalItems': instance.totalItems,
      'currentPage': instance.currentPage,
      'totalPages': instance.totalPages,
    };
