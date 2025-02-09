import 'package:json_annotation/json_annotation.dart';

// part 'index_beban_kerja_response_model.g.dart';

// @JsonSerializable()
class IndexBebanKerjaResponseModel {
  String message;
  String? error;
  List<Data>? data = [];
  Meta? meta;

  IndexBebanKerjaResponseModel({
    required this.message,
    this.error,
    this.data,
    this.meta
  });

  factory IndexBebanKerjaResponseModel.fromJson(Map<String, dynamic> json) => _$IndexBebanKerjaResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$IndexBebanKerjaResponseModelToJson(this);
}

// @JsonSerializable()
class Data {
  String id;
  DateTime bulan;
  @JsonKey(name: 'total_skor')
  int totalSkor;
  @JsonKey(name: 'penugasan_kader')
  List<PenugasanKader>? penugasanKader;

  Data({
    required this.id,
    required this.bulan,
    required this.totalSkor,
    this.penugasanKader
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson()=>_$DataToJson(this);
}

// @JsonSerializable()
class PenugasanKader {
  String id;
  DateTime bulan;
  @JsonKey(name: 'tugas_kader')

  PenugasanKader({
    required this.id,
    required this.bulan,
  });

  factory PenugasanKader.fromJson(Map<String, dynamic> json) => _$PenugasanKaderFromJson(json);

  Map<String, dynamic> toJson()=>_$PenugasanKaderToJson(this);
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

IndexBebanKerjaResponseModel _$IndexBebanKerjaResponseModelFromJson(
        Map<String, dynamic> json) =>
    IndexBebanKerjaResponseModel(
      message: json['message'] as String,
      error: json['error'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IndexBebanKerjaResponseModelToJson(
        IndexBebanKerjaResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'error': instance.error,
      'data': instance.data,
      'meta': instance.meta,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as String,
      bulan: DateTime.parse(json['bulan'] as String),
      totalSkor: (json['total_skor'] as num).toInt(),
      penugasanKader: (json['penugasan_kader'] as List<dynamic>?)
          ?.map((e) => PenugasanKader.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'bulan': instance.bulan.toIso8601String(),
      'total_skor': instance.totalSkor,
      'penugasan_kader': instance.penugasanKader,
    };

PenugasanKader _$PenugasanKaderFromJson(Map<String, dynamic> json) =>
    PenugasanKader(
      id: json['id'] as String,
      bulan: DateTime.parse(json['bulan'] as String),
    );

Map<String, dynamic> _$PenugasanKaderToJson(PenugasanKader instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bulan': instance.bulan.toIso8601String(),
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
