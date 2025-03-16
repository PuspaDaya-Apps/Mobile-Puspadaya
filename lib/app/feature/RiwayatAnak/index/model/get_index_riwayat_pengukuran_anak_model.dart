import 'package:json_annotation/json_annotation.dart';
part 'get_index_riwayat_pengukuran_anak_model.g.dart';
@JsonSerializable()
class GetIndexRiwayatPengukuranAnakModel {
    @JsonKey(name: "data")
    final List<Datum> data;
    @JsonKey(name: "meta")
    final Meta meta;
    @JsonKey(name: "links")
    final Links links;
    @JsonKey(name: "message")
    final String message;

    GetIndexRiwayatPengukuranAnakModel({
        required this.data,
        required this.meta,
        required this.links,
        required this.message,
    });

    factory GetIndexRiwayatPengukuranAnakModel.fromJson(Map<String, dynamic> json) => _$GetIndexRiwayatPengukuranAnakModelFromJson(json);

    Map<String, dynamic> toJson() => _$GetIndexRiwayatPengukuranAnakModelToJson(this);
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
    final JenisKelamin jenisKelamin;
    @JsonKey(name: "kartu_keluarga")
    final KartuKeluarga kartuKeluarga;
    @JsonKey(name: "posyandu")
    final Posyandu posyandu;
    @JsonKey(name: "pengukuran")
    final List<Pengukuran> pengukuran;

    Datum({
        required this.id,
        required this.nik,
        required this.namaAnak,
        required this.tanggalLahir,
        required this.jenisKelamin,
        required this.kartuKeluarga,
        required this.posyandu,
        required this.pengukuran,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

    Map<String, dynamic> toJson() => _$DatumToJson(this);
}

enum JenisKelamin {
    @JsonValue("Laki-laki")
    LAKI_LAKI,
    @JsonValue("Perempuan")
    PEREMPUAN
}

@JsonSerializable()
class KartuKeluarga {
    @JsonKey(name: "id")
    final String id;
    @JsonKey(name: "nomor_kartu_keluarga")
    final String nomorKartuKeluarga;

    KartuKeluarga({
        required this.id,
        required this.nomorKartuKeluarga,
    });

    factory KartuKeluarga.fromJson(Map<String, dynamic> json) => _$KartuKeluargaFromJson(json);

    Map<String, dynamic> toJson() => _$KartuKeluargaToJson(this);
}

@JsonSerializable()
class Pengukuran {
    @JsonKey(name: "tempat_pengukuran")
    final TempatPengukuran tempatPengukuran;
    @JsonKey(name: "tanggal_pengukuran")
    final DateTime tanggalPengukuran;

    Pengukuran({
        required this.tempatPengukuran,
        required this.tanggalPengukuran,
    });

    factory Pengukuran.fromJson(Map<String, dynamic> json) => _$PengukuranFromJson(json);

    Map<String, dynamic> toJson() => _$PengukuranToJson(this);
}

enum TempatPengukuran {
    @JsonValue("Posyandu")
    POSYANDU
}

@JsonSerializable()
class Posyandu {
    @JsonKey(name: "nama_posyandu")
    final NamaPosyandu namaPosyandu;

    Posyandu({
        required this.namaPosyandu,
    });

    factory Posyandu.fromJson(Map<String, dynamic> json) => _$PosyanduFromJson(json);

    Map<String, dynamic> toJson() => _$PosyanduToJson(this);
}

enum NamaPosyandu {
    @JsonValue("Melati 3")
    MELATI_3
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
