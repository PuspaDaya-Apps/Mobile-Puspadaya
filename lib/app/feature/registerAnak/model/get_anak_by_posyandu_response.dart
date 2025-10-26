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
  // @JsonKey(name:

  GetAnakByPosyanduResponse({
    required this.message,
    required this.data,
    required this.meta,
  });

  GetAnakByPosyanduResponse copyWith({
    String? message,
    List<Datum>? data,
    Meta? meta,
  }) =>
      GetAnakByPosyanduResponse(
        message: message ?? this.message,
        data: data ?? this.data,
        meta: meta ?? this.meta,
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
  @JsonKey(name: "jenis_kelamin")
  final String jenisKelamin;
  @JsonKey(name: "usia")
  final String usia;
  @JsonKey(name: "nama_ibu")
  final String namaIbu;
  @JsonKey(name: "updated_at")
  DateTime? updatedAt;
  @JsonKey(name: "status")
  String status;

  Datum({
    required this.id,
    required this.nik,
    required this.namaAnak,
    required this.jenisKelamin,
    required this.usia,
    required this.namaIbu,
    this.updatedAt,
    required this.status
  });

  Datum copyWith({
    String? id,
    String? nik,
    String? namaAnak,
    String? jenisKelamin,
    String? usia,
    String? namaIbu,
    String? status,
  }) =>
      Datum(
        id: id ?? this.id,
        nik: nik ?? this.nik,
        namaAnak: namaAnak ?? this.namaAnak,
        jenisKelamin: jenisKelamin ?? this.jenisKelamin,
        usia: usia ?? this.usia,
        namaIbu: namaIbu ?? this.namaIbu,
        status: status ?? this.status,
      );

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
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
