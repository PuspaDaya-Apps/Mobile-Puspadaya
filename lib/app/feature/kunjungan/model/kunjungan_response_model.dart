import 'package:json_annotation/json_annotation.dart';

// part 'kunjungan_response_model.g.dart';

//@JsonSerializable()
class KunjunganResponseModel {
  String message;
  String? error;
  List<Data>? data = [];
  Meta? meta;

  KunjunganResponseModel({
    required this.message,
    this.error,
    this.data,
    this.meta
  });

  factory KunjunganResponseModel.fromJson(Map<String, dynamic> json) => _$KunjunganResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$KunjunganResponseModelToJson(this);
}

//@JsonSerializable()
class Data {
  String id;
  @JsonKey(name: 'status_kunjungan')
  String statusKunjungan;
  @JsonKey(name: 'jenis_kunjungan')
  String jenisKunjungan;
  @JsonKey(name: 'tanggal_kunjungan')
  DateTime tanggalKunjungan;
  Anak? anak;
  @JsonKey(name: 'ibu_hamil')
  IbuHamil? ibuHamil;

  Data({
    required this.id,
    required this.statusKunjungan,
    required this.jenisKunjungan,
    required this.tanggalKunjungan,
    this.anak,
    this.ibuHamil
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson()=>_$DataToJson(this);
}

//@JsonSerializable()
class Anak {
  String id;
  @JsonKey(name: 'nama_anak')
  String namaAnak;

  Anak({
    required this.id,
    required this.namaAnak
  });

  factory Anak.fromJson(Map<String, dynamic> json) => _$AnakFromJson(json);

  Map<String, dynamic> toJson()=>_$AnakToJson(this);
}

//@JsonSerializable()
class IbuHamil {
  String id;
  @JsonKey(name: 'nama_ibu_hamil')
  String namaIbuHamil;

  IbuHamil({
    required this.id,
    required this.namaIbuHamil
  });

  factory IbuHamil.fromJson(Map<String, dynamic> json) => _$IbuHamilFromJson(json);

  Map<String, dynamic> toJson()=>_$IbuHamilToJson(this);
}

//@JsonSerializable()
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

KunjunganResponseModel _$KunjunganResponseModelFromJson(
        Map<String, dynamic> json) =>
    KunjunganResponseModel(
      message: json['message'] as String,
      error: json['error'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$KunjunganResponseModelToJson(
        KunjunganResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'error': instance.error,
      'data': instance.data,
      'meta': instance.meta,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as String,
      statusKunjungan: json['status_kunjungan'] as String,
      jenisKunjungan: json['jenis_kunjungan'] as String,
      tanggalKunjungan: DateTime.parse(json['tanggal_kunjungan'] as String),
      anak: json['anak'] == null
          ? null
          : Anak.fromJson(json['anak'] as Map<String, dynamic>),
      ibuHamil: json['ibu_hamil'] == null
          ? null
          : IbuHamil.fromJson(json['ibu_hamil'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'status_kunjungan': instance.statusKunjungan,
      'jenis_kunjungan': instance.jenisKunjungan,
      'tanggal_kunjungan': instance.tanggalKunjungan.toIso8601String(),
      'anak': instance.anak,
      'ibu_hamil': instance.ibuHamil,
    };

Anak _$AnakFromJson(Map<String, dynamic> json) => Anak(
      id: json['id'] as String,
      namaAnak: json['nama_anak'] as String,
    );

Map<String, dynamic> _$AnakToJson(Anak instance) => <String, dynamic>{
      'id': instance.id,
      'nama_anak': instance.namaAnak,
    };

IbuHamil _$IbuHamilFromJson(Map<String, dynamic> json) => IbuHamil(
      id: json['id'] as String,
      namaIbuHamil: json['nama_ibu_hamil'] as String,
    );

Map<String, dynamic> _$IbuHamilToJson(IbuHamil instance) => <String, dynamic>{
      'id': instance.id,
      'nama_ibu_hamil': instance.namaIbuHamil,
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
