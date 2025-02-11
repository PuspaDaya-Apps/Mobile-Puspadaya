import 'package:json_annotation/json_annotation.dart';

import '../../../../utils/helper/helper_core.dart';

// part 'index_anggota_kader_response_model.g.dart';

// @JsonSerializable()
class IndexAnggotaKaderResponseModel {
  String message;
  String? error;
  List<Data>? data = [];
  Meta? meta;

  IndexAnggotaKaderResponseModel({
    required this.message,
    this.error,
    this.data,
    this.meta
  });

  factory IndexAnggotaKaderResponseModel.fromJson(Map<String, dynamic> json) => _$IndexAnggotaKaderResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$IndexAnggotaKaderResponseModelToJson(this);
}

// @JsonSerializable()
class Data {
  String id;
  String avatar;
  @JsonKey(name: 'nama_lengkap')
  String namaLengkap;
  @JsonKey(name: 'nomor_telepon')
  String nomorTelepon;

  Data({
    required this.id,
    required this.avatar,
    required this.namaLengkap,
    required this.nomorTelepon,
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

IndexAnggotaKaderResponseModel _$IndexAnggotaKaderResponseModelFromJson(
        Map<String, dynamic> json) =>
    IndexAnggotaKaderResponseModel(
      message: json['message'] as String,
      error: json['error'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IndexAnggotaKaderResponseModelToJson(
        IndexAnggotaKaderResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'error': instance.error,
      'data': instance.data,
      'meta': instance.meta,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as String,
      avatar: HelperCore.convertNameToInitial(json['nama_lengkap']) ,
      namaLengkap: json['nama_lengkap'] as String,
      nomorTelepon: json['nomor_telepon'] as String,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'avatar': instance.avatar,
      'nama_lengkap': instance.namaLengkap,
      'nomor_telepon': instance.nomorTelepon,
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
