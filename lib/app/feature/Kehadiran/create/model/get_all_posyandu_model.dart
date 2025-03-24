import 'package:json_annotation/json_annotation.dart';
part 'get_all_posyandu_model.g.dart';
@JsonSerializable()
class GetAllPosyandu {
    @JsonKey(name: "data")
    final List<Datum> data;
    @JsonKey(name: "meta")
    final Meta meta;
    @JsonKey(name: "links")
    final Links links;
    @JsonKey(name: "message")
    final String message;

    GetAllPosyandu({
        required this.data,
        required this.meta,
        required this.links,
        required this.message,
    });

    factory GetAllPosyandu.fromJson(Map<String, dynamic> json) => _$GetAllPosyanduFromJson(json);

    Map<String, dynamic> toJson() => _$GetAllPosyanduToJson(this);
}

@JsonSerializable()
class Datum {
    @JsonKey(name: "id")
    final String id;
    @JsonKey(name: "nama_posyandu")
    final String namaPosyandu;
    @JsonKey(name: "alamat")
    final String? alamat;
    @JsonKey(name: "dusun")
    final Dusun dusun;
    @JsonKey(name: "puskesmas")
    final String? puskesmas;

    Datum({
        required this.id,
        required this.namaPosyandu,
        required this.alamat,
        required this.dusun,
        required this.puskesmas,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

    Map<String, dynamic> toJson() => _$DatumToJson(this);
}

@JsonSerializable()
class Dusun {
    @JsonKey(name: "id")
    final String id;
    @JsonKey(name: "nama_dusun")
    final String namaDusun;
    @JsonKey(name: "desa_kelurahan")
    final DesaKelurahan desaKelurahan;

    Dusun({
        required this.id,
        required this.namaDusun,
        required this.desaKelurahan,
    });

    factory Dusun.fromJson(Map<String, dynamic> json) => _$DusunFromJson(json);

    Map<String, dynamic> toJson() => _$DusunToJson(this);
}

@JsonSerializable()
class DesaKelurahan {
    @JsonKey(name: "id")
    final String id;
    @JsonKey(name: "nama_desa_kelurahan")
    final String namaDesaKelurahan;
    @JsonKey(name: "kecamatan")
    final Kecamatan kecamatan;

    DesaKelurahan({
        required this.id,
        required this.namaDesaKelurahan,
        required this.kecamatan,
    });

    factory DesaKelurahan.fromJson(Map<String, dynamic> json) => _$DesaKelurahanFromJson(json);

    Map<String, dynamic> toJson() => _$DesaKelurahanToJson(this);
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

    factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

    Map<String, dynamic> toJson() => _$MetaToJson(this);
}
