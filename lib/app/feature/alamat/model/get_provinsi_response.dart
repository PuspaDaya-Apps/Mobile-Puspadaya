
import 'package:json_annotation/json_annotation.dart';
part 'get_provinsi_response.g.dart';


@JsonSerializable()
class GetProvinsiResponse {
  @JsonKey(name: "data")
  final List<Datum> data;
  @JsonKey(name: "meta")
  final Meta meta;
  @JsonKey(name: "links")
  final Links links;
  @JsonKey(name: "message")
  final String message;

  GetProvinsiResponse({
    required this.data,
    required this.meta,
    required this.links,
    required this.message,
  });

  GetProvinsiResponse copyWith({
    List<Datum>? data,
    Meta? meta,
    Links? links,
    String? message,
  }) =>
      GetProvinsiResponse(
        data: data ?? this.data,
        meta: meta ?? this.meta,
        links: links ?? this.links,
        message: message ?? this.message,
      );

  factory GetProvinsiResponse.fromJson(Map<String, dynamic> json) => _$GetProvinsiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetProvinsiResponseToJson(this);
}

@JsonSerializable()
class Datum {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "nama_provinsi")
  final String namaProvinsi;

  Datum({
    required this.id,
    required this.namaProvinsi,
  });

  Datum copyWith({
    String? id,
    String? namaProvinsi,
  }) =>
      Datum(
        id: id ?? this.id,
        namaProvinsi: namaProvinsi ?? this.namaProvinsi,
      );

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
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

