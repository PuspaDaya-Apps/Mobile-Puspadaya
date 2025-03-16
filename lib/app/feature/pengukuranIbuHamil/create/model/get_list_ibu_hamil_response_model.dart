import 'package:json_annotation/json_annotation.dart';

// part 'get_list_ibu_hamil_response_model.g.dart';

//@JsonSerializable()
class GetListIbuHamilResponseModel {
  String message;
  List<Data>? data = [];
  Meta? meta;

  GetListIbuHamilResponseModel({
    required this.message,
    this.data,
    this.meta
  });

  factory GetListIbuHamilResponseModel.fromJson(Map<String, dynamic> json) => _$GetListIbuHamilResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$GetListIbuHamilResponseModelToJson(this);
}

//@JsonSerializable()
class Data {
  String id;
  @JsonKey(name: 'nama_ibu')
  String namaIbu;
  String nik;
  @JsonKey(name: 'usia_ibu')
  String usiaIbu;
  @JsonKey(name: 'nama_suami')
  String namaSuami;
  @JsonKey(name: 'usia_kehamilan')
  String usiaKehamilan;

  Data({
    required this.id,
    required this.nik,
    required this.namaIbu,
    required this.usiaIbu,
    required this.namaSuami,
    required this.usiaKehamilan,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson()=>_$DataToJson(this);
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

GetListIbuHamilResponseModel _$GetListIbuHamilResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetListIbuHamilResponseModel(
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetListIbuHamilResponseModelToJson(
        GetListIbuHamilResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
      'meta': instance.meta,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as String,
      nik: json['nik'] as String,
      namaIbu: json['nama_ibu'] as String,
      usiaIbu: json['usia_ibu'] as String,
      namaSuami: json['nama_suami'] as String,
      usiaKehamilan: json['usia_kehamilan'] as String,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'nama_ibu': instance.namaIbu,
      'nik': instance.nik,
      'usia_ibu': instance.usiaIbu,
      'nama_suami': instance.namaSuami,
      'usia_kehamilan': instance.usiaKehamilan,
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
