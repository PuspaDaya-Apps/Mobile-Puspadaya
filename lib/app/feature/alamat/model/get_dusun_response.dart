import 'package:json_annotation/json_annotation.dart';
part 'get_dusun_response.g.dart';
@JsonSerializable()
class GetDusunResponse {
  @JsonKey(name: "data")
  final List<Datum> data;
  @JsonKey(name: "meta")
  final Meta meta;
  @JsonKey(name: "links")
  final Links links;
  @JsonKey(name: "message")
  final String message;

  GetDusunResponse({
    required this.data,
    required this.meta,
    required this.links,
    required this.message,
  });

  GetDusunResponse copyWith({
    List<Datum>? data,
    Meta? meta,
    Links? links,
    String? message,
  }) =>
      GetDusunResponse(
        data: data ?? this.data,
        meta: meta ?? this.meta,
        links: links ?? this.links,
        message: message ?? this.message,
      );

  factory GetDusunResponse.fromJson(Map<String, dynamic> json) => _$GetDusunResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetDusunResponseToJson(this);
}

@JsonSerializable()
class Datum {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "nama_dusun")
  final String namaDusun;
  @JsonKey(name: "desa_kelurahan")
  final DesaKelurahan desaKelurahan;

  Datum({
    required this.id,
    required this.namaDusun,
    required this.desaKelurahan,
  });

  Datum copyWith({
    String? id,
    String? namaDusun,
    DesaKelurahan? desaKelurahan,
  }) =>
      Datum(
        id: id ?? this.id,
        namaDusun: namaDusun ?? this.namaDusun,
        desaKelurahan: desaKelurahan ?? this.desaKelurahan,
      );

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}

@JsonSerializable()
class DesaKelurahan {
  @JsonKey(name: "id")
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
