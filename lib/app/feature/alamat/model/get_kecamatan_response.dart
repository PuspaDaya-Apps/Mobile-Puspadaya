import 'package:json_annotation/json_annotation.dart';

// part 'get_kecamatan_response.g.dart';

//@JsonSerializable()
class GetKecamatanResponse {
  final List<Data>? data;
  final Meta? meta;
  final String message;

  GetKecamatanResponse({
    this.data,
    this.meta,
    required this.message,
  });

  GetKecamatanResponse copyWith({
    List<Data>? data,
    Meta? meta,
    String? message,
  }) =>
      GetKecamatanResponse(
        data: data ?? this.data,
        meta: meta ?? this.meta,
        message: message ?? this.message,
      );

  factory GetKecamatanResponse.fromJson(Map<String, dynamic> json) => _$GetKecamatanResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetKecamatanResponseToJson(this);
}

//@JsonSerializable()
class Data{
  final String id;
  @JsonKey(name: "nama_kecamatan")
  final String namaKecamatan;
  @JsonKey(name: "kode_kecamatan")
  final String kodeKecamatan;
  @JsonKey(name: "kabupaten_kota")
  final KabupatenKota kabupatenKota;

  Data({
    required this.id,
    required this.namaKecamatan,
    required this.kodeKecamatan,
    required this.kabupatenKota,
  });

  Data copyWith({
    String? id,
    String? namaKecamatan,
    String? kodeKecamatan,
    KabupatenKota? kabupatenKota,

  }) =>
      Data(
        id: id ?? this.id,
        namaKecamatan: namaKecamatan ?? this.namaKecamatan,
        kodeKecamatan: kodeKecamatan ?? this.kodeKecamatan,
        kabupatenKota: kabupatenKota ?? this.kabupatenKota,
      );

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

//@JsonSerializable()
class KabupatenKota {
  final String id;
  @JsonKey(name: "nama_kabupaten_kota")
  final String namaKabupatenKota;

  KabupatenKota({
    required this.id,
    required this.namaKabupatenKota,
  });

  KabupatenKota copyWith({
    String? id,
    String? namaKabupatenKota,
  }) =>
      KabupatenKota(
        id: id ?? this.id,
        namaKabupatenKota: namaKabupatenKota ?? this.namaKabupatenKota,
      );

  factory KabupatenKota.fromJson(Map<String, dynamic> json) => _$KabupatenKotaFromJson(json);

  Map<String, dynamic> toJson() => _$KabupatenKotaToJson(this);
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

GetKecamatanResponse _$GetKecamatanResponseFromJson(
        Map<String, dynamic> json) =>
    GetKecamatanResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      message: json['message'] as String,
    );

Map<String, dynamic> _$GetKecamatanResponseToJson(
        GetKecamatanResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'meta': instance.meta,
      'message': instance.message,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as String,
      namaKecamatan: json['nama_kecamatan'] as String,
      kodeKecamatan: json['kode_kecamatan'] as String,
      kabupatenKota: KabupatenKota.fromJson(
          json['kabupaten_kota'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'nama_kecamatan': instance.namaKecamatan,
      'kode_kecamatan': instance.kodeKecamatan,
      'kabupaten_kota': instance.kabupatenKota,
    };

KabupatenKota _$KabupatenKotaFromJson(Map<String, dynamic> json) =>
    KabupatenKota(
      id: json['id'] as String,
      namaKabupatenKota: json['nama_kabupaten_kota'] as String,
    );

Map<String, dynamic> _$KabupatenKotaToJson(KabupatenKota instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama_kabupaten_kota': instance.namaKabupatenKota,
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
