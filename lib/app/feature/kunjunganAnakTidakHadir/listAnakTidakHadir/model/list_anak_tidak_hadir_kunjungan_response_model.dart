import 'package:json_annotation/json_annotation.dart';

// part 'list_anak_tidak_hadir_kunjungan_response_model.g.dart';

//@JsonSerializable()
class ListAnakTidakHadirKunjunganResponseModel {
  String message;
  String? error;
  List<Data>? data = [];
  Meta? meta;

  ListAnakTidakHadirKunjunganResponseModel({
    required this.message,
    this.error,
    this.data,
    this.meta
  });

  factory ListAnakTidakHadirKunjunganResponseModel.fromJson(Map<String, dynamic> json) => _$ListAnakTidakHadirKunjunganResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$ListAnakTidakHadirKunjunganResponseModelToJson(this);
}

//@JsonSerializable()
class Data {
  String id;
  String nik;
  @JsonKey(name: "nama_anak")
  String namaAnak;
  Ibu? ibu;

  Data({
    required this.id,
    required this.nik,
    required this.namaAnak,
    this.ibu
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson()=>_$DataToJson(this);
}

//@JsonSerializable()
class Ibu {
  @JsonKey(name: 'nama_ibu')
  String namaIbu;

  Ibu({
    required this.namaIbu
  });

  factory Ibu.fromJson(Map<String, dynamic> json) => _$IbuFromJson(json);

  Map<String, dynamic> toJson()=>_$IbuToJson(this);
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

ListAnakTidakHadirKunjunganResponseModel
    _$ListAnakTidakHadirKunjunganResponseModelFromJson(
            Map<String, dynamic> json) =>
        ListAnakTidakHadirKunjunganResponseModel(
          message: json['message'] as String,
          error: json['error'] as String?,
          data: (json['data'] as List<dynamic>?)
              ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
              .toList(),
          meta: json['meta'] == null
              ? null
              : Meta.fromJson(json['meta'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$ListAnakTidakHadirKunjunganResponseModelToJson(
        ListAnakTidakHadirKunjunganResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'error': instance.error,
      'data': instance.data,
      'meta': instance.meta,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as String,
      nik: json['nik'] as String,
      namaAnak: json['nama_anak'] as String,
      ibu: json['ibu'] == null
          ? null
          : Ibu.fromJson(json['ibu'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'nik': instance.nik,
      'nama_anak': instance.namaAnak,
      'ibu': instance.ibu,
    };

Ibu _$IbuFromJson(Map<String, dynamic> json) => Ibu(
      namaIbu: json['nama_ibu'] as String,
    );

Map<String, dynamic> _$IbuToJson(Ibu instance) => <String, dynamic>{
      'nama_ibu': instance.namaIbu,
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
