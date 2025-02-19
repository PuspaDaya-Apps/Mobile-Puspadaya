import 'package:json_annotation/json_annotation.dart';

// part 'get_desa_kelurahan_response.g.dart';

//@JsonSerializable()
class GetDesaKelurahanResponse {
  final List<Data>? data;
  final Meta? meta;
  final String message;

  GetDesaKelurahanResponse({
    this.data,
    this.meta,
    required this.message,
  });

  GetDesaKelurahanResponse copyWith({
    List<Data>? data,
    Meta? meta,
    String? message,
  }) =>
      GetDesaKelurahanResponse(
        data: data ?? this.data,
        meta: meta ?? this.meta,
        message: message ?? this.message,
      );

  factory GetDesaKelurahanResponse.fromJson(Map<String, dynamic> json) => _$GetDesaKelurahanResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetDesaKelurahanResponseToJson(this);
}

//@JsonSerializable()
class Data {
  final String id;
  @JsonKey(name: "nama_desa_kelurahan")
  final String namaDesaKelurahan;
  final Kecamatan kecamatan;

  Data({
    required this.id,
    required this.namaDesaKelurahan,
    required this.kecamatan,
  });

  Data copyWith({
    String? id,
    String? namaDesaKelurahan,
    Kecamatan? kecamatan,
  }) =>
      Data(
        id: id ?? this.id,
        namaDesaKelurahan: namaDesaKelurahan ?? this.namaDesaKelurahan,
        kecamatan: kecamatan ?? this.kecamatan,
      );

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

//@JsonSerializable()
class Kecamatan {
  final String id;
  @JsonKey(name: "nama_kecamatan")
  final String namaKecamatan;

  Kecamatan({
    required this.id,
    required this.namaKecamatan,
  });

  Kecamatan copyWith({
    String? id,
    String? namaKecamatan,
  }) =>
      Kecamatan(
        id: id ?? this.id,
        namaKecamatan: namaKecamatan ?? this.namaKecamatan,
      );

  factory Kecamatan.fromJson(Map<String, dynamic> json) => _$KecamatanFromJson(json);

  Map<String, dynamic> toJson() => _$KecamatanToJson(this);
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

GetDesaKelurahanResponse _$GetDesaKelurahanResponseFromJson(
        Map<String, dynamic> json) =>
    GetDesaKelurahanResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      message: json['message'] as String,
    );

Map<String, dynamic> _$GetDesaKelurahanResponseToJson(
        GetDesaKelurahanResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'meta': instance.meta,
      'message': instance.message,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as String,
      namaDesaKelurahan: json['nama_desa_kelurahan'] as String,
      kecamatan: Kecamatan.fromJson(json['kecamatan'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'nama_desa_kelurahan': instance.namaDesaKelurahan,
      'kecamatan': instance.kecamatan,
    };

Kecamatan _$KecamatanFromJson(Map<String, dynamic> json) => Kecamatan(
      id: json['id'] as String,
      namaKecamatan: json['nama_kecamatan'] as String,
    );

Map<String, dynamic> _$KecamatanToJson(Kecamatan instance) => <String, dynamic>{
      'id': instance.id,
      'nama_kecamatan': instance.namaKecamatan,
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
