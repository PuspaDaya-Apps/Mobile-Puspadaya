import 'package:json_annotation/json_annotation.dart';

// part 'index_pengukuran_anak_response_model.g.dart';

// @JsonSerializable()
class IndexPengukuranAnakResponseModel {
  String message;
  String? error;
  List<Data>? data = [];
  Meta? meta;

  IndexPengukuranAnakResponseModel({
    required this.message,
    this.error,
    this.data,
    this.meta
  });

  factory IndexPengukuranAnakResponseModel.fromJson(Map<String, dynamic> json) => _$IndexPengukuranAnakResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$IndexPengukuranAnakResponseModelToJson(this);
}

// @JsonSerializable()
class Data {
  String id;
  @JsonKey(name: 'nama_anak')
  String namaAnak;
  String nik;
  @JsonKey(name: 'tanggal_pengukuran')
  String tanggalPengukuran;
  @JsonKey(name: 'tempat_pengukuran')
  String tempatPengukuran;

  Data({
    required this.id,
    required this.namaAnak,
    required this.nik,
    required this.tanggalPengukuran,
    required this.tempatPengukuran
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson()=>_$DataToJson(this);
}

// @JsonSerializable()
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

IndexPengukuranAnakResponseModel _$IndexPengukuranAnakResponseModelFromJson(
        Map<String, dynamic> json) =>
    IndexPengukuranAnakResponseModel(
      message: json['message'] as String,
      error: json['error'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IndexPengukuranAnakResponseModelToJson(
        IndexPengukuranAnakResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'error': instance.error,
      'data': instance.data,
      'meta': instance.meta,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as String,
      namaAnak: json['nama_anak'] as String,
      nik: json['nik'] as String,
      tanggalPengukuran: json['tanggal_pengukuran'] as String,
      tempatPengukuran: json['tempat_pengukuran'] as String,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'nama_anak': instance.namaAnak,
      'nik': instance.nik,
      'tanggal_pengukuran': instance.tanggalPengukuran,
      'tempat_pengukuran': instance.tempatPengukuran,
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
