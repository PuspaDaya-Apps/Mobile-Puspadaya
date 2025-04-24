import 'package:json_annotation/json_annotation.dart';

// part 'index_pengukuran_tamu_response_model.g.dart';

//@JsonSerializable()
class IndexPengukuranTamuResponseModel {
  String message;
  List<Data>? data = [];
  Meta? meta;

  IndexPengukuranTamuResponseModel({
    required this.message,
    this.data,
    this.meta
  });

  factory IndexPengukuranTamuResponseModel.fromJson(Map<String, dynamic> json) => _$IndexPengukuranTamuResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$IndexPengukuranTamuResponseModelToJson(this);
}

//@JsonSerializable()
class Data {
  String id;
  @JsonKey(name: 'nama_anak')
  String namaAnak;
  String nik;
  @JsonKey(name: 'tanggal_pengukuran')
  DateTime tanggalPengukuran;
  @JsonKey(name: 'posyandu_asal')
  String posyanduAsal;
  @JsonKey(name: 'berat_badan')
  String? beratBadan;
  @JsonKey(name: 'tinggi_badan')
  String? tinggiBadan;

  Data({
    required this.id,
    required this.namaAnak,
    required this.nik,
    required this.tanggalPengukuran,
    required this.posyanduAsal,
    this.beratBadan,
    this.tinggiBadan
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
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

  Map<String, dynamic> toJson() => _$MetaToJson(this);
}


IndexPengukuranTamuResponseModel _$IndexPengukuranTamuResponseModelFromJson(
        Map<String, dynamic> json) =>
    IndexPengukuranTamuResponseModel(
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IndexPengukuranTamuResponseModelToJson(
        IndexPengukuranTamuResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
      'meta': instance.meta,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as String,
      namaAnak: json['nama_anak'] as String,
      nik: json['nik'] as String,
      tanggalPengukuran: DateTime.parse(json['tanggal_pengukuran'] as String),
      posyanduAsal: json['posyandu_asal'] as String,
      beratBadan: json['berat_badan'] as String?,
      tinggiBadan: json['tinggi_badan'] as String?
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'nama_anak': instance.namaAnak,
      'nik': instance.nik,
      'tanggal_pengukuran': instance.tanggalPengukuran.toIso8601String(),
      'posyandu_asal': instance.posyanduAsal,
      'berat_badan': instance.beratBadan,
      'tinggi_badan': instance.tinggiBadan,
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
