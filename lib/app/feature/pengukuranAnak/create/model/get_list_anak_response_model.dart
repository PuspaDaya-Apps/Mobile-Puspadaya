import 'package:json_annotation/json_annotation.dart';

// part 'get_list_anak_response_model.g.dart';

// @JsonSerializable()
class GetListAnakResponseModel {
  String message;
  String? error;
  List<Data>? data = [];
  Meta? meta;

  GetListAnakResponseModel({
    required this.message,
    this.error,
    this.data,
    this.meta
  });

  factory GetListAnakResponseModel.fromJson(Map<String, dynamic> json) => _$GetListAnakResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$GetListAnakResponseModelToJson(this);
}

// @JsonSerializable()
class Data {
  String id;
  @JsonKey(name: 'nama_anak')
  String namaAnak;
  String nik;
  @JsonKey(name: 'jenis_kelamin')
  String jenisKelamin;
  @JsonKey(name: 'nama_ibu')
  String namaIbu;
  String usia;

  Data({
    required this.id,
    required this.namaAnak,
    required this.nik,
    required this.jenisKelamin,
    required this.namaIbu,
    required this.usia
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

GetListAnakResponseModel _$GetListAnakResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetListAnakResponseModel(
      message: json['message'] as String,
      error: json['error'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetListAnakResponseModelToJson(
        GetListAnakResponseModel instance) =>
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
      jenisKelamin: json['jenis_kelamin'] as String,
      namaIbu: json['nama_ibu'] as String,
      usia: json['usia'] as String,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'nama_anak': instance.namaAnak,
      'nik': instance.nik,
      'jenis_kelamin': instance.jenisKelamin,
      'nama_ibu': instance.namaIbu,
      'usia': instance.usia,
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
