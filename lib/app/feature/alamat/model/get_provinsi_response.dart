
import 'package:json_annotation/json_annotation.dart';

// part 'get_provinsi_response.g.dart';

//@JsonSerializable()
class GetProvinsiResponse {
  final List<Data>? data;
  final Meta? meta;
  final String message;

  GetProvinsiResponse({
    this.data,
    this.meta,
    required this.message,
  });

  GetProvinsiResponse copyWith({
    List<Data>? data,
    Meta? meta,
    String? message,
  }) =>
      GetProvinsiResponse(
        data: data ?? this.data,
        meta: meta ?? this.meta,
        message: message ?? this.message,
      );

  factory GetProvinsiResponse.fromJson(Map<String, dynamic> json) => _$GetProvinsiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetProvinsiResponseToJson(this);
}

//@JsonSerializable()
class Data {
  final String id;
  @JsonKey(name: "nama_provinsi")
  final String namaProvinsi;
  @JsonKey(name: "kode_provinsi")
  final String kodeProvinsi;

  Data({
    required this.id,
    required this.namaProvinsi,
    required this.kodeProvinsi
  });

  Data copyWith({
    String? id,
    String? namaProvinsi,
    String? kodeProvinsi,
  }) =>
      Data(
        id: id ?? this.id,
        namaProvinsi: namaProvinsi ?? this.namaProvinsi,
        kodeProvinsi: kodeProvinsi ?? this.kodeProvinsi,
      );

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

//@JsonSerializable()
class Meta {
  final int itemsPerPage;
  final int totalItems;
  final int currentPage;
  final int totalPages;

  Meta({
    required this.itemsPerPage,
    required this.totalItems,
    required this.currentPage,
    required this.totalPages,
  });

  Meta copyWith({
    int? itemsPerPage,
    int? totalItems,
    int? currentPage,
    int? totalPages,
  }) =>
      Meta(
        itemsPerPage: itemsPerPage ?? this.itemsPerPage,
        totalItems: totalItems ?? this.totalItems,
        currentPage: currentPage ?? this.currentPage,
        totalPages: totalPages ?? this.totalPages,
      );

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);
}

GetProvinsiResponse _$GetProvinsiResponseFromJson(Map<String, dynamic> json) =>
    GetProvinsiResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      message: json['message'] as String,
    );

Map<String, dynamic> _$GetProvinsiResponseToJson(
        GetProvinsiResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'meta': instance.meta,
      'message': instance.message,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as String,
      namaProvinsi: json['nama_provinsi'] as String,
      kodeProvinsi: json['kode_provinsi'] as String,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'nama_provinsi': instance.namaProvinsi,
      'kode_provinsi': instance.kodeProvinsi,
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

