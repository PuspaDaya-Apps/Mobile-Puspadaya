import 'package:json_annotation/json_annotation.dart';

// part 'get_beban_kerja_item_response_model.g.dart';

// @JsonSerializable()
class GetBebanKerjaItemResponseModel {
  String message;
  String? error;
  List<Data>? data = [];
  Meta? meta;

  GetBebanKerjaItemResponseModel({
    required this.message,
    this.error,
    this.data,
    this.meta
  });

  factory GetBebanKerjaItemResponseModel.fromJson(Map<String, dynamic> json) => _$GetBebanKerjaItemResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$GetBebanKerjaItemResponseModelToJson(this);
}

// @JsonSerializable()
class Data {
  String id;
  @JsonKey(name: 'nama_kompetensi')
  String namakompetensi;
  String kategori;
  @JsonKey(name: 'bobot_nilai')
  int bobotNilai;
  // @JsonKey(name: 'bobot_presentase_puspadaya')
  // double bobotPresentasePuspadaya;
  @JsonKey(name: 'jenis_kompetensi')
  String jenisKompetensi;

  Data({
    required this.id,
    required this.namakompetensi,
    required this.bobotNilai,
    // required this.bobotPresentasePuspadaya,
    required this.kategori,
    required this.jenisKompetensi
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson()=>_$DataToJson(this);
}

// @JsonSerializable()
class Meta {
  int itemsPerPage;
  int totalItems;
  int currentPage;
  int totalPages;

  Meta({
    required this.itemsPerPage,
    required this.totalItems,
    required this.currentPage,
    required this.totalPages
  });

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson()=>_$MetaToJson(this);
}


GetBebanKerjaItemResponseModel _$GetBebanKerjaItemResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetBebanKerjaItemResponseModel(
      message: json['message'] as String,
      error: json['error'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetBebanKerjaItemResponseModelToJson(
        GetBebanKerjaItemResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'error': instance.error,
      'data': instance.data,
      'meta': instance.meta,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as String,
      namakompetensi: json['nama_kompetensi'] as String,
      bobotNilai: (json['bobot_nilai'] as num).toInt(),
      // bobotPresentasePuspadaya:
      //     (json['bobot_presentase_puspadaya'] as num).toDouble(),
      kategori: json['kategori'] as String,
      jenisKompetensi: json['jenis_kompetensi'] as String,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'nama_kompetensi': instance.namakompetensi,
      'kategori': instance.kategori,
      'bobot_nilai': instance.bobotNilai,
      // 'bobot_presentase_puspadaya': instance.bobotPresentasePuspadaya,
      'jenis_kompetensi': instance.jenisKompetensi,
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
