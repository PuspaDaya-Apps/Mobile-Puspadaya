import 'package:json_annotation/json_annotation.dart';

import '../../../../utils/helper/helper_core.dart';

// part 'get_list_orang_tua_response_model.g.dart';

// @JsonSerializable()
class GetListOrangTuaResponseModel {
  String message;
  String? error;
  List<Data>? data = [];
  Meta? meta;

  GetListOrangTuaResponseModel({
    required this.message,
    this.error,
    this.data,
    this.meta
  });

  factory GetListOrangTuaResponseModel.fromJson(Map<String, dynamic> json) => _$GetListOrangTuaResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$GetListOrangTuaResponseModelToJson(this);
}

// @JsonSerializable()
class Data {
  String avatarOrangTua;
  Ayah ayah;
  Ibu ibu;
  
  Data({
    required this.avatarOrangTua,
    required this.ayah,
    required this.ibu
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson()=>_$DataToJson(this);
}

// @JsonSerializable()
class Ayah {
  String id;
  @JsonKey(name: 'nama_ayah')
  String namaAyah;
  @JsonKey(name: 'kartu_keluarga')
  KartuKeluarga kartuKeluarga;

  Ayah({
    required this.id,
    required this.namaAyah,
    required this.kartuKeluarga
  });

  factory Ayah.fromJson(Map<String, dynamic> json) => _$AyahFromJson(json);

  Map<String, dynamic> toJson()=>_$AyahToJson(this);
}

// @JsonSerializable()
class Ibu {
  String id;
  @JsonKey(name: 'nama_ibu')
  String namaIbu;
  @JsonKey(name: 'kartu_keluarga')
  KartuKeluarga kartuKeluarga;

  Ibu({
   required this.id,
   required this.namaIbu,
   required this.kartuKeluarga
  });

  factory Ibu.fromJson(Map<String, dynamic> json) => _$IbuFromJson(json);

  Map<String, dynamic> toJson()=>_$IbuToJson(this);
}

// @JsonSerializable()
class KartuKeluarga {
  String id;
  @JsonKey(name: 'nomor_kartu_keluarga')
  String nomorKartuKeluarga;

  KartuKeluarga({
    required this.id,
    required this.nomorKartuKeluarga
  });

  factory KartuKeluarga.fromJson(Map<String, dynamic> json) => _$KartuKeluargaFromJson(json);

  Map<String, dynamic> toJson()=>_$KartuKeluargaToJson(this);
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

GetListOrangTuaResponseModel _$GetListOrangTuaResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetListOrangTuaResponseModel(
      message: json['message'] as String,
      error: json['error'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetListOrangTuaResponseModelToJson(
        GetListOrangTuaResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'error': instance.error,
      'data': instance.data,
      'meta': instance.meta,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      avatarOrangTua: HelperCore.convertNameToInitial(json['ayah']['nama_ayah'] as String),
      ayah: Ayah.fromJson(json['ayah'] as Map<String, dynamic>),
      ibu: Ibu.fromJson(json['ibu'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'avatarOrangTua': instance.avatarOrangTua,
      'ayah': instance.ayah,
      'ibu': instance.ibu,
    };

Ayah _$AyahFromJson(Map<String, dynamic> json) => Ayah(
      id: json['id'] as String,
      namaAyah: json['nama_ayah'] as String,
      kartuKeluarga: KartuKeluarga.fromJson(
          json['kartu_keluarga'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AyahToJson(Ayah instance) => <String, dynamic>{
      'id': instance.id,
      'nama_ayah': instance.namaAyah,
      'kartu_keluarga': instance.kartuKeluarga,
    };

Ibu _$IbuFromJson(Map<String, dynamic> json) => Ibu(
      id: json['id'] as String,
      namaIbu: json['nama_ibu'] as String,
      kartuKeluarga: KartuKeluarga.fromJson(
          json['kartu_keluarga'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IbuToJson(Ibu instance) => <String, dynamic>{
      'id': instance.id,
      'nama_ibu': instance.namaIbu,
      'kartu_keluarga': instance.kartuKeluarga,
    };

KartuKeluarga _$KartuKeluargaFromJson(Map<String, dynamic> json) =>
    KartuKeluarga(
      id: json['id'] as String,
      nomorKartuKeluarga: json['nomor_kartu_keluarga'] as String,
    );

Map<String, dynamic> _$KartuKeluargaToJson(KartuKeluarga instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nomor_kartu_keluarga': instance.nomorKartuKeluarga,
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
