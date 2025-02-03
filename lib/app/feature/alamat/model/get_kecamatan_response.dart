import 'package:json_annotation/json_annotation.dart';
part 'get_kecamatan_response.g.dart';
@JsonSerializable()
class GetKecamatanResponse {
  @JsonKey(name: "data")
  final List<Datum> data;
  @JsonKey(name: "meta")
  final Meta meta;
  @JsonKey(name: "links")
  final Links links;
  @JsonKey(name: "message")
  final String message;

  GetKecamatanResponse({
    required this.data,
    required this.meta,
    required this.links,
    required this.message,
  });

  GetKecamatanResponse copyWith({
    List<Datum>? data,
    Meta? meta,
    Links? links,
    String? message,
  }) =>
      GetKecamatanResponse(
        data: data ?? this.data,
        meta: meta ?? this.meta,
        links: links ?? this.links,
        message: message ?? this.message,
      );

  factory GetKecamatanResponse.fromJson(Map<String, dynamic> json) => _$GetKecamatanResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetKecamatanResponseToJson(this);
}

@JsonSerializable()
class Datum {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "nama_kecamatan")
  final String namaKecamatan;
  @JsonKey(name: "kabupaten_kota")
  final KabupatenKota kabupatenKota;

  Datum({
    required this.id,
    required this.namaKecamatan,
    required this.kabupatenKota,
  });

  Datum copyWith({
    String? id,
    String? namaKecamatan,
    KabupatenKota? kabupatenKota,

  }) =>
      Datum(
        id: id ?? this.id,
        namaKecamatan: namaKecamatan ?? this.namaKecamatan,
        kabupatenKota: kabupatenKota ?? this.kabupatenKota,
      );

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}

@JsonSerializable()
class KabupatenKota {
  @JsonKey(name: "id")
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

@JsonSerializable()
class Links {
  @JsonKey(name: "first")
  final String first;
  @JsonKey(name: "last")
  final String last;
  @JsonKey(name: "current")
  final String current;
  @JsonKey(name: "next")
  final String next;
  @JsonKey(name: "previous")
  final String previous;

  Links({
    required this.first,
    required this.last,
    required this.current,
    required this.next,
    required this.previous,
  });

  Links copyWith({
    String? first,
    String? last,
    String? current,
    String? next,
    String? previous,
  }) =>
      Links(
        first: first ?? this.first,
        last: last ?? this.last,
        current: current ?? this.current,
        next: next ?? this.next,
        previous: previous ?? this.previous,
      );

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);

  Map<String, dynamic> toJson() => _$LinksToJson(this);
}

@JsonSerializable()
class Meta {
  @JsonKey(name: "itemsPerPage")
  final int itemsPerPage;
  @JsonKey(name: "totalItems")
  final int totalItems;
  @JsonKey(name: "currentPage")
  final int currentPage;
  @JsonKey(name: "totalPages")
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
