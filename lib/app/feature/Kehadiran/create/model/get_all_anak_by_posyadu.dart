import 'package:json_annotation/json_annotation.dart';
part 'get_all_anak_by_posyadu.g.dart';

@JsonSerializable()
class GetAllAnakByPosyandu {
  @JsonKey(name: "message")
  final String message;
  @JsonKey(name: "data")
  final List<Datum> data;
  @JsonKey(name: "meta")
  final Meta meta;
  @JsonKey(name: "links")
  final Links links;

  GetAllAnakByPosyandu({
    required this.message,
    required this.data,
    required this.meta,
    required this.links,
  });

  factory GetAllAnakByPosyandu.fromJson(Map<String, dynamic> json) =>
      _$GetAllAnakByPosyanduFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllAnakByPosyanduToJson(this);
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
  @JsonKey(name: "tanggal_lahir")
  final DateTime tanggalLahir;
  @JsonKey(name: "usia")
  final String usia;
  @JsonKey(name: "nama_ibu")
  final String namaIbu;
  // ... property lainnya
  @JsonKey(
      includeFromJson: true) // Tambahkan ini agar tidak error saat parsing JSON
  bool isChecked;

  Datum({
    this.isChecked = false,
    required this.id,
    required this.nik,
    required this.namaAnak,
    required this.jenisKelamin,
    required this.tanggalLahir,
    required this.usia,
    required this.namaIbu,
  });

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

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);

  Map<String, dynamic> toJson() => _$LinksToJson(this);
}

@JsonSerializable()
class Meta {
  @JsonKey(name: "itemsPerPage")
  final int? itemsPerPage;
  @JsonKey(name: "totalItems")
  final int? totalItems;
  @JsonKey(name: "currentPage")
  final int? currentPage;
  @JsonKey(name: "totalPages")
  final int? totalPages;

  Meta({
    required this.itemsPerPage,
    required this.totalItems,
    required this.currentPage,
    required this.totalPages,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);
}
