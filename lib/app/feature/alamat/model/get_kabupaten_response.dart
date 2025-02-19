import 'package:json_annotation/json_annotation.dart';

// part 'get_kabupaten_response.g.dart';

//@JsonSerializable()
class GetKabupatenResponse {
  final List<Data>? data;
  final Meta? meta;
  final String message;

  GetKabupatenResponse({
    this.data,
    this.meta,
    required this.message,
  });

  GetKabupatenResponse copyWith({
    List<Data>? data,
    Meta? meta,
    String? message,
  }) =>
      GetKabupatenResponse(
        data: data ?? this.data,
        meta: meta ?? this.meta,
        message: message ?? this.message,
      );

  factory GetKabupatenResponse.fromJson(Map<String, dynamic> json) => _$GetKabupatenResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetKabupatenResponseToJson(this);
}

//@JsonSerializable()
class Data {
  final String id;
  @JsonKey(name: "nama_kabupaten_kota")
  final String namaKabupatenKota;
  @JsonKey(name: "kode_kabupaten_kota")
  final String kodeKabupatenKota;
  final Provinsi provinsi;

  Data({
    required this.id,
    required this.namaKabupatenKota,
    required this.kodeKabupatenKota,
    required this.provinsi,
  });

  Data copyWith({
    String? id,
    String? namaKabupatenKota,
    String? kodeKabupatenKota,
    Provinsi? provinsi,
  }) =>
      Data(
        id: id ?? this.id,
        namaKabupatenKota: namaKabupatenKota ?? this.namaKabupatenKota,
        kodeKabupatenKota: kodeKabupatenKota ?? this.kodeKabupatenKota,
        provinsi: provinsi ?? this.provinsi,
      );

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

//@JsonSerializable()
class Provinsi {
  final String id;
  @JsonKey(name: "nama_provinsi")
  final String namaProvinsi;

  Provinsi({
    required this.id,
    required this.namaProvinsi,
  });

  Provinsi copyWith({
    String? id,
    String? namaProvinsi,
  }) =>
      Provinsi(
        id: id ?? this.id,
        namaProvinsi: namaProvinsi ?? this.namaProvinsi,
      );

  factory Provinsi.fromJson(Map<String, dynamic> json) => _$ProvinsiFromJson(json);

  Map<String, dynamic> toJson() => _$ProvinsiToJson(this);
}

//@JsonSerializable()
class Meta {
  final int itemsPerPage;
  final int totalItems;
  final int currentPage;
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


GetKabupatenResponse _$GetKabupatenResponseFromJson(
        Map<String, dynamic> json) =>
    GetKabupatenResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      message: json['message'] as String,
    );

Map<String, dynamic> _$GetKabupatenResponseToJson(
        GetKabupatenResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'meta': instance.meta,
      'message': instance.message,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as String,
      namaKabupatenKota: json['nama_kabupaten_kota'] as String,
      kodeKabupatenKota: json['kode_kabupaten_kota'] as String,
      provinsi: Provinsi.fromJson(json['provinsi'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'nama_kabupaten_kota': instance.namaKabupatenKota,
      'kode_kabupaten_kota': instance.kodeKabupatenKota,
      'provinsi': instance.provinsi,
    };

Provinsi _$ProvinsiFromJson(Map<String, dynamic> json) => Provinsi(
      id: json['id'] as String,
      namaProvinsi: json['nama_provinsi'] as String,
    );

Map<String, dynamic> _$ProvinsiToJson(Provinsi instance) => <String, dynamic>{
      'id': instance.id,
      'nama_provinsi': instance.namaProvinsi,
    };

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
      itemsPerPage: (json['itemsPerPage'] as num).toInt(),
      totalItems: (json['totalItems'] as num).toInt(),
      currentPage: (json['currentPage'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
    );

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'itemsPerPage': instance.itemsPerPage,
      'totalItems': instance.totalItems,
      'currentPage': instance.currentPage,
      'totalPages': instance.totalPages,
    };
