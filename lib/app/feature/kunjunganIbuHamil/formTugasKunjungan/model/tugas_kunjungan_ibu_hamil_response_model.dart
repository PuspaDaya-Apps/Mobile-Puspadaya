import 'package:json_annotation/json_annotation.dart';

// part 'tugas_kunjungan_ibu_hamil_response_model.g.dart';

//@JsonSerializable()
class TugasKunjunganIbuHamilResponseModel {
  String message;
  List<Data>? data = [];
  Meta? meta;

  TugasKunjunganIbuHamilResponseModel({
    required this.message,
    this.data,
    this.meta
  });

  factory TugasKunjunganIbuHamilResponseModel.fromJson(Map<String, dynamic> json) => _$TugasKunjunganIbuHamilResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$TugasKunjunganIbuHamilResponseModelToJson(this);
}

//@JsonSerializable()
class Data {
  String id;
  @JsonKey(name: 'nama_tugas')
  String namaTugas;

  Data({
    required this.id,
    required this.namaTugas
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson()=>_$DataToJson(this);
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

TugasKunjunganIbuHamilResponseModel
    _$TugasKunjunganIbuHamilResponseModelFromJson(
            Map<String, dynamic> json) =>
        TugasKunjunganIbuHamilResponseModel(
          message: json['message'] as String,
          data: (json['data'] as List<dynamic>?)
              ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
              .toList(),
          meta: json['meta'] == null
              ? null
              : Meta.fromJson(json['meta'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$TugasKunjunganIbuHamilResponseModelToJson(
        TugasKunjunganIbuHamilResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
      'meta': instance.meta,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as String,
      namaTugas: json['nama_tugas'] as String,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'nama_tugas': instance.namaTugas,
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
