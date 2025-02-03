import 'package:json_annotation/json_annotation.dart';
part 'get_desa_kelurahan_response.g.dart';

@JsonSerializable()
class GetDesaKelurahanResponse {
  @JsonKey(name: "data")
  final List<Datum> data;
  @JsonKey(name: "meta")
  final Meta meta;
  @JsonKey(name: "links")
  final Links links;
  @JsonKey(name: "message")
  final String message;

  GetDesaKelurahanResponse({
    required this.data,
    required this.meta,
    required this.links,
    required this.message,
  });

  GetDesaKelurahanResponse copyWith({
    List<Datum>? data,
    Meta? meta,
    Links? links,
    String? message,
  }) =>
      GetDesaKelurahanResponse(
        data: data ?? this.data,
        meta: meta ?? this.meta,
        links: links ?? this.links,
        message: message ?? this.message,
      );

  factory GetDesaKelurahanResponse.fromJson(Map<String, dynamic> json) => _$GetDesaKelurahanResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetDesaKelurahanResponseToJson(this);
}

@JsonSerializable()
class Datum {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "nama_desa_kelurahan")
  final String namaDesaKelurahan;
  @JsonKey(name: "kecamatan")
  final Kecamatan kecamatan;

  Datum({
    required this.id,
    required this.namaDesaKelurahan,
    required this.kecamatan,
  });

  Datum copyWith({
    String? id,
    String? namaDesaKelurahan,
    Kecamatan? kecamatan,
  }) =>
      Datum(
        id: id ?? this.id,
        namaDesaKelurahan: namaDesaKelurahan ?? this.namaDesaKelurahan,
        kecamatan: kecamatan ?? this.kecamatan,
      );

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}

@JsonSerializable()
class Kecamatan {
  @JsonKey(name: "id")
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
