import 'package:json_annotation/json_annotation.dart';
part 'get_anak_by_posyandu_response.g.dart';

@JsonSerializable()
class GetAnakByPosyanduResponse {
  @JsonKey(name: "message")
  final String message;
  @JsonKey(name: "data")
  final List<Datum> data;
  @JsonKey(name: "meta")
  final Meta meta;
  @JsonKey(name: "links")
  final Links links;

  GetAnakByPosyanduResponse({
    required this.message,
    required this.data,
    required this.meta,
    required this.links,
  });

  GetAnakByPosyanduResponse copyWith({
    String? message,
    List<Datum>? data,
    Meta? meta,
    Links? links,
  }) =>
      GetAnakByPosyanduResponse(
        message: message ?? this.message,
        data: data ?? this.data,
        meta: meta ?? this.meta,
        links: links ?? this.links,
      );

  factory GetAnakByPosyanduResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAnakByPosyanduResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetAnakByPosyanduResponseToJson(this);
}

@JsonSerializable()
class Datum {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "nik")
  final String nik;
  @JsonKey(name: "nama_anak")
  final String namaAnak;
  @JsonKey(name: "tanggal_lahir")
  final DateTime tanggalLahir;
  @JsonKey(name: "jenis_kelamin")
  final String jenisKelamin;
  @JsonKey(name: "usia")
  final String usia;

  Datum({
    required this.id,
    required this.nik,
    required this.namaAnak,
    required this.tanggalLahir,
    required this.jenisKelamin,
    required this.usia,
  });

  Datum copyWith({
    String? id,
    String? nik,
    String? namaAnak,
    DateTime? tanggalLahir,
    String? jenisKelamin,
    String? usia,
  }) =>
      Datum(
        id: id ?? this.id,
        nik: nik ?? this.nik,
        namaAnak: namaAnak ?? this.namaAnak,
        tanggalLahir: tanggalLahir ?? this.tanggalLahir,
        jenisKelamin: jenisKelamin ?? this.jenisKelamin,
        usia: usia ?? this.usia,
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
