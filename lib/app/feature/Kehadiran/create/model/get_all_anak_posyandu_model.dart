import 'package:json_annotation/json_annotation.dart';
part 'get_all_anak_posyandu_model.g.dart';
@JsonSerializable()
class GetAllAnakPosyanduModel {
    @JsonKey(name: "data")
    final List<Datum> data;
    @JsonKey(name: "meta")
    final Meta meta;
    @JsonKey(name: "links")
    final Links links;
    @JsonKey(name: "message")
    final String message;

    GetAllAnakPosyanduModel({
        required this.data,
        required this.meta,
        required this.links,
        required this.message,
    });

    factory GetAllAnakPosyanduModel.fromJson(Map<String, dynamic> json) => _$GetAllAnakPosyanduModelFromJson(json);

    Map<String, dynamic> toJson() => _$GetAllAnakPosyanduModelToJson(this);
}

@JsonSerializable()
class Datum {
    @JsonKey(name: "id")
    final String id;
    @JsonKey(name: "nik")
    final String nik;
    @JsonKey(name: "nama_anak")
    final String namaAnak;
    @JsonKey(name: "kartu_keluarga")
    final KartuKeluarga kartuKeluarga;

    Datum({
        required this.id,
        required this.nik,
        required this.namaAnak,
        required this.kartuKeluarga,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

    Map<String, dynamic> toJson() => _$DatumToJson(this);
}

@JsonSerializable()
class KartuKeluarga {
    @JsonKey(name: "id")
    final String id;
    @JsonKey(name: "nomor_kartu_keluarga")
    final String nomorKartuKeluarga;
    @JsonKey(name: "ibu")
    final Ibu ibu;

    KartuKeluarga({
        required this.id,
        required this.nomorKartuKeluarga,
        required this.ibu,
    });

    factory KartuKeluarga.fromJson(Map<String, dynamic> json) => _$KartuKeluargaFromJson(json);

    Map<String, dynamic> toJson() => _$KartuKeluargaToJson(this);
}

@JsonSerializable()
class Ibu {
    @JsonKey(name: "nama_ibu")
    final String namaIbu;

    Ibu({
        required this.namaIbu,
    });

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
