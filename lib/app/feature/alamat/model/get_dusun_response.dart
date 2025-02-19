import 'package:json_annotation/json_annotation.dart';

// part 'get_dusun_response.g.dart';

//@JsonSerializable()
class GetDusunResponse {
  final List<Data>? data;
  final Meta? meta;
  final String message;

  GetDusunResponse({
    this.data,
    this.meta,
    required this.message,
  });

  GetDusunResponse copyWith({
    List<Data>? data,
    Meta? meta,
    String? message,
  }) =>
      GetDusunResponse(
        data: data ?? this.data,
        meta: meta ?? this.meta,
        message: message ?? this.message,
      );

  factory GetDusunResponse.fromJson(Map<String, dynamic> json) => _$GetDusunResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetDusunResponseToJson(this);
}

//@JsonSerializable()
class Data {
  final String id;
  @JsonKey(name: "nama_dusun")
  final String namaDusun;
  @JsonKey(name: "desa_kelurahan")
  final DesaKelurahan desaKelurahan;

  Data({
    required this.id,
    required this.namaDusun,
    required this.desaKelurahan,
  });

  Data copyWith({
    String? id,
    String? namaDusun,
    DesaKelurahan? desaKelurahan,
  }) =>
      Data(
        id: id ?? this.id,
        namaDusun: namaDusun ?? this.namaDusun,
        desaKelurahan: desaKelurahan ?? this.desaKelurahan,
      );

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

//@JsonSerializable()
class DesaKelurahan {
  final String id;
  @JsonKey(name: "nama_desa_kelurahan")
  final String namaDesaKelurahan;

  DesaKelurahan({
    required this.id,
    required this.namaDesaKelurahan,
  });

  DesaKelurahan copyWith({
    String? id,
    String? namaDesaKelurahan,
  }) =>
      DesaKelurahan(
        id: id ?? this.id,
        namaDesaKelurahan: namaDesaKelurahan ?? this.namaDesaKelurahan,
      );

  factory DesaKelurahan.fromJson(Map<String, dynamic> json) => _$DesaKelurahanFromJson(json);

  Map<String, dynamic> toJson() => _$DesaKelurahanToJson(this);
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

GetDusunResponse _$GetDusunResponseFromJson(Map<String, dynamic> json) =>
    GetDusunResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      message: json['message'] as String,
    );

Map<String, dynamic> _$GetDusunResponseToJson(GetDusunResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'meta': instance.meta,
      'message': instance.message,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as String,
      namaDusun: json['nama_dusun'] as String,
      desaKelurahan: DesaKelurahan.fromJson(
          json['desa_kelurahan'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'nama_dusun': instance.namaDusun,
      'desa_kelurahan': instance.desaKelurahan,
    };

DesaKelurahan _$DesaKelurahanFromJson(Map<String, dynamic> json) =>
    DesaKelurahan(
      id: json['id'] as String,
      namaDesaKelurahan: json['nama_desa_kelurahan'] as String,
    );

Map<String, dynamic> _$DesaKelurahanToJson(DesaKelurahan instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama_desa_kelurahan': instance.namaDesaKelurahan,
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
