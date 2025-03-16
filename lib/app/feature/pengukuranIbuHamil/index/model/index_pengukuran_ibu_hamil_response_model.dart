import 'package:json_annotation/json_annotation.dart';

// part 'index_pengukuran_ibu_hamil_response_model.g.dart';

//@JsonSerializable()
class IndexPengukuranIbuHamilResponseModel {
  String message;
  List<Data>? data = [];
  Meta? meta;

  IndexPengukuranIbuHamilResponseModel({
    required this.message,
    this.data,
    this.meta
  });

  factory IndexPengukuranIbuHamilResponseModel.fromJson(Map<String, dynamic> json) => _$IndexPengukuranIbuHamilResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>_$IndexPengukuranIbuHamilResponseModelToJson(this);
}

//@JsonSerializable()
class Data {
  String id;
  @JsonKey(name: 'nama_ibu')
  String namaIbu;
  String nik;
  @JsonKey(name: 'tanggal_pengukuran')
  DateTime tanggalPengukuran;

  Data({
    required this.id,
    required this.namaIbu,
    required this.nik,
    required this.tanggalPengukuran,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() =>_$DataToJson(this);
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

IndexPengukuranIbuHamilResponseModel
    _$IndexPengukuranIbuHamilResponseModelFromJson(Map<String, dynamic> json) =>
        IndexPengukuranIbuHamilResponseModel(
          message: json['message'] as String,
          data: (json['data'] as List<dynamic>?)
              ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
              .toList(),
          meta: json['meta'] == null
              ? null
              : Meta.fromJson(json['meta'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$IndexPengukuranIbuHamilResponseModelToJson(
        IndexPengukuranIbuHamilResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
      'meta': instance.meta,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as String,
      namaIbu: json['nama_ibu'] as String,
      nik: json['nik'] as String,
      tanggalPengukuran: DateTime.parse(json['tanggal_pengukuran'] as String),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'nama_ibu': instance.namaIbu,
      'nik': instance.nik,
      'tanggal_pengukuran': instance.tanggalPengukuran.toIso8601String(),
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
