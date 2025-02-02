import 'package:json_annotation/json_annotation.dart';
part 'get_orangtua_id_response.g.dart';

@JsonSerializable()
class GetOrangtuaIdResponse {
  @JsonKey(name: "message")
  final String message;
  @JsonKey(name: "data")
  final List<Datum> data;
  @JsonKey(name: "meta")
  final Meta meta;
  @JsonKey(name: "links")
  final Links links;

  GetOrangtuaIdResponse({
    required this.message,
    required this.data,
    required this.meta,
    required this.links,
  });

  GetOrangtuaIdResponse copyWith({
    String? message,
    List<Datum>? data,
    Meta? meta,
    Links? links,
  }) =>
      GetOrangtuaIdResponse(
        message: message ?? this.message,
        data: data ?? this.data,
        meta: meta ?? this.meta,
        links: links ?? this.links,
      );

  factory GetOrangtuaIdResponse.fromJson(Map<String, dynamic> json) =>
      _$GetOrangtuaIdResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetOrangtuaIdResponseToJson(this);
}

@JsonSerializable()
class Datum {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "nomor_kartu_keluarga")
  final String nomorKartuKeluarga;
  @JsonKey(name: "ayah")
  final Ayah ayah;
  @JsonKey(name: "ibu")
  final Ibu ibu;

  Datum({
    required this.id,
    required this.nomorKartuKeluarga,
    required this.ayah,
    required this.ibu,
  });

  Datum copyWith({
    String? id,
    String? nomorKartuKeluarga,
    Ayah? ayah,
    Ibu? ibu,
  }) =>
      Datum(
        id: id ?? this.id,
        nomorKartuKeluarga: nomorKartuKeluarga ?? this.nomorKartuKeluarga,
        ayah: ayah ?? this.ayah,
        ibu: ibu ?? this.ibu,
      );

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}

@JsonSerializable()
class Ayah {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "nama_ayah")
  final String namaAyah;

  Ayah({
    required this.id,
    required this.namaAyah,
  });

  Ayah copyWith({
    String? id,
    String? namaAyah,
  }) =>
      Ayah(
        id: id ?? this.id,
        namaAyah: namaAyah ?? this.namaAyah,
      );

  factory Ayah.fromJson(Map<String, dynamic> json) => _$AyahFromJson(json);

  Map<String, dynamic> toJson() => _$AyahToJson(this);
}

@JsonSerializable()
class Ibu {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "nama_ibu")
  final String namaIbu;

  Ibu({
    required this.id,
    required this.namaIbu,
  });

  Ibu copyWith({
    String? id,
    String? namaIbu,
  }) =>
      Ibu(
        id: id ?? this.id,
        namaIbu: namaIbu ?? this.namaIbu,
      );

  factory Ibu.fromJson(Map<String, dynamic> json) => _$IbuFromJson(json);

  Map<String, dynamic> toJson() => _$IbuToJson(this);
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
