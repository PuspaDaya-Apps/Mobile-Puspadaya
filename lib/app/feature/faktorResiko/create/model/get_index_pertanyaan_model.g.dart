// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_index_pertanyaan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetIndexPertanyaanModel _$GetIndexPertanyaanModelFromJson(
        Map<String, dynamic> json) =>
    GetIndexPertanyaanModel(
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetIndexPertanyaanModelToJson(
        GetIndexPertanyaanModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      id: json['id'] as String,
      namaFaktorResiko: json['nama_faktor_resiko'] as String,
      keterangan: json['keterangan'] as String,
      gambar: json['gambar'] as String,
      detail: json['detail'] as String?,
      isCompleted: json['is_completed'] as bool,
      lastCompleted: json['last_completed'] == null
          ? null
          : DateTime.parse(json['last_completed'] as String),
      pertanyaan: (json['pertanyaan'] as List<dynamic>)
          .map((e) => Pertanyaan.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'id': instance.id,
      'nama_faktor_resiko': instance.namaFaktorResiko,
      'keterangan': instance.keterangan,
      'gambar': instance.gambar,
      'detail': instance.detail,
      'is_completed': instance.isCompleted,
      'last_completed': instance.lastCompleted?.toIso8601String(),
      'pertanyaan': instance.pertanyaan,
    };

Pertanyaan _$PertanyaanFromJson(Map<String, dynamic> json) => Pertanyaan(
      id: json['id'] as String,
      selectType: $enumDecode(_$SelectTypeEnumMap, json['select_type']),
      namaPertanyaan: json['nama_pertanyaan'] as String,
      pilihanPertanyaan: (json['pilihan_pertanyaan'] as List<dynamic>)
          .map((e) => PilihanPertanyaan.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PertanyaanToJson(Pertanyaan instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama_pertanyaan': instance.namaPertanyaan,
      'select_type': _$SelectTypeEnumMap[instance.selectType]!,
      'pilihan_pertanyaan': instance.pilihanPertanyaan,
    };

const _$SelectTypeEnumMap = {
  SelectType.radio: 'radio',
  SelectType.checkbox: 'checkbox',
};

PilihanPertanyaan _$PilihanPertanyaanFromJson(Map<String, dynamic> json) =>
    PilihanPertanyaan(
      id: json['id'] as String,
      namaPilihan: json['nama_pilihan'] as String,
    );

Map<String, dynamic> _$PilihanPertanyaanToJson(PilihanPertanyaan instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama_pilihan': instance.namaPilihan,
    };
