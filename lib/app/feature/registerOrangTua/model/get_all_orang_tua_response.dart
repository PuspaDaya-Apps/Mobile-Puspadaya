import 'package:json_annotation/json_annotation.dart';
part 'get_all_orang_tua_response.g.dart';

@JsonSerializable()
class GetAllOrangTuaResponse {
  @JsonKey(name: "message")
  final String message;
  @JsonKey(name: "data")
  final List<Datum> data;
  @JsonKey(name: "meta")
  final Meta meta;
  @JsonKey(name: "links")
  final Links links;

  GetAllOrangTuaResponse({
    required this.message,
    required this.data,
    required this.meta,
    required this.links,
  });

  GetAllOrangTuaResponse copyWith({
    String? message,
    List<Datum>? data,
    Meta? meta,
    Links? links,
  }) =>
      GetAllOrangTuaResponse(
        message: message ?? this.message,
        data: data ?? this.data,
        meta: meta ?? this.meta,
        links: links ?? this.links,
      );

  factory GetAllOrangTuaResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllOrangTuaResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllOrangTuaResponseToJson(this);
}

@JsonSerializable()
class Datum {
  @JsonKey(name: "ayah")
  final Ayah ayah;
  @JsonKey(name: "ibu")
  final Ibu ibu;

  Datum({
    required this.ayah,
    required this.ibu,
  });

  Datum copyWith({
    Ayah? ayah,
    Ibu? ibu,
  }) =>
      Datum(
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
  @JsonKey(name: "kartu_keluarga")
  final KartuKeluarga kartuKeluarga;
  @JsonKey(name: "dusun")
  final Dusun dusun;

  Ayah({
    required this.dusun,
    required this.id,
    required this.namaAyah,
    required this.kartuKeluarga,
  });

  Ayah copyWith({
    String? id,
    String? namaAyah,
    KartuKeluarga? kartuKeluarga,
    Dusun? dusun,
  }) =>
      Ayah(
        dusun: dusun ?? this.dusun,
        id: id ?? this.id,
        namaAyah: namaAyah ?? this.namaAyah,
        kartuKeluarga: kartuKeluarga ?? this.kartuKeluarga,
      );

  factory Ayah.fromJson(Map<String, dynamic> json) => _$AyahFromJson(json);

  Map<String, dynamic> toJson() => _$AyahToJson(this);
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

  KartuKeluarga copyWith({
    String? nomorKartuKeluarga,
  }) =>
      KartuKeluarga(
        id: id,
        nomorKartuKeluarga: nomorKartuKeluarga ?? this.nomorKartuKeluarga,
      );

  factory KartuKeluarga.fromJson(Map<String, dynamic> json) =>
      _$KartuKeluargaFromJson(json);

  Map<String, dynamic> toJson() => _$KartuKeluargaToJson(this);
}

@JsonSerializable()
class Ibu {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "nama_ibu")
  final String namaIbu;
  @JsonKey(name: "kartu_keluarga")
  final KartuKeluarga kartuKeluarga;
  @JsonKey(name: "dusun")
  final Dusun dusun;

  Ibu({
    required this.dusun,
    required this.id,
    required this.namaIbu,
    required this.kartuKeluarga,
  });

  Ibu copyWith({
    String? id,
    String? namaIbu,
    Dusun? dusun,
    KartuKeluarga? kartuKeluarga,
  }) =>
      Ibu(
        dusun: dusun ?? this.dusun,
        id: id ?? this.id,
        namaIbu: namaIbu ?? this.namaIbu,
        kartuKeluarga: kartuKeluarga ?? this.kartuKeluarga,
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

  factory DesaKelurahan.fromJson(Map<String, dynamic> json) =>
      _$DesaKelurahanFromJson(json);

  Map<String, dynamic> toJson() => _$DesaKelurahanToJson(this);
}

@JsonSerializable()
class Kecamatan {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "nama_kecamatan")
  final String namaKecamatan;
  @JsonKey(name: "kabupaten_kota")
  final KabupatenKota kabupatenKota;

  Kecamatan({
    required this.id,
    required this.namaKecamatan,
    required this.kabupatenKota,
  });

  factory Kecamatan.fromJson(Map<String, dynamic> json) =>
      _$KecamatanFromJson(json);

  Map<String, dynamic> toJson() => _$KecamatanToJson(this);
}

@JsonSerializable()
class KabupatenKota {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "nama_kabupaten_kota")
  final String namaKabupatenKota;
  @JsonKey(name: "provinsi")
  final Provinsi provinsi;

  KabupatenKota({
    required this.id,
    required this.namaKabupatenKota,
    required this.provinsi,
  });

  factory KabupatenKota.fromJson(Map<String, dynamic> json) =>
      _$KabupatenKotaFromJson(json);

  Map<String, dynamic> toJson() => _$KabupatenKotaToJson(this);
}

@JsonSerializable()
class Provinsi {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "nama_provinsi")
  final String namaProvinsi;

  Provinsi({
    required this.id,
    required this.namaProvinsi,
  });

  factory Provinsi.fromJson(Map<String, dynamic> json) =>
      _$ProvinsiFromJson(json);

  Map<String, dynamic> toJson() => _$ProvinsiToJson(this);
}
