import 'package:json_annotation/json_annotation.dart';
part 'get_index_kehadiran_model.g.dart';
@JsonSerializable()
class GetIndexKehadiranModel {
    @JsonKey(name: "message")
    final String message;
    @JsonKey(name: "data")
    final List<Datum> data;
    @JsonKey(name: "meta")
    final Meta meta;
    @JsonKey(name: "links")
    final Links links;

    GetIndexKehadiranModel({
        required this.message,
        required this.data,
        required this.meta,
        required this.links,
    });

    factory GetIndexKehadiranModel.fromJson(Map<String, dynamic> json) => _$GetIndexKehadiranModelFromJson(json);

    Map<String, dynamic> toJson() => _$GetIndexKehadiranModelToJson(this);
}

@JsonSerializable()
class Datum {
    @JsonKey(name: "id")
    final String id;
    @JsonKey(name: "tanggal_pelaksanaan")
    final DateTime tanggalPelaksanaan;
    @JsonKey(name: "waktu_mulai")
    final String waktuMulai;
    @JsonKey(name: "waktu_selesai")
    final String waktuSelesai;
    @JsonKey(name: "durasi")
    final String durasi;
    @JsonKey(name: "status_kegiatan")
    final String statusKegiatan;
    @JsonKey(name: "posyandu")
    final Posyandu posyandu;

    Datum({
        required this.id,
        required this.tanggalPelaksanaan,
        required this.waktuMulai,
        required this.waktuSelesai,
        required this.durasi,
        required this.statusKegiatan,
        required this.posyandu,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

    Map<String, dynamic> toJson() => _$DatumToJson(this);
}

@JsonSerializable()
class Posyandu {
    @JsonKey(name: "id")
    final String id;
    @JsonKey(name: "nama_posyandu")
    final String namaPosyandu;

    Posyandu({
        required this.id,
        required this.namaPosyandu,
    });

    factory Posyandu.fromJson(Map<String, dynamic> json) => _$PosyanduFromJson(json);

    Map<String, dynamic> toJson() => _$PosyanduToJson(this);
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
