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
      gangguanTumbuhKembang: json['gangguan_tumbuh_kembang'] == null
          ? null
          : GangguanTumbuhKembang.fromJson(
              json['gangguan_tumbuh_kembang'] as Map<String, dynamic>),
      id: json['id'] as String,
      namaFaktorResiko: json['nama_faktor_resiko'] as String,
      keterangan: json['keterangan'] as String,
      gambar: json['gambar'] as String,
      detail: json['detail'] as String?,
      isCompleted: json['is_completed'] as bool,
      lastCompleted: json['last_completed'] == null
          ? null
          : DateTime.parse(json['last_completed'] as String),
      pertanyaan: (json['pertanyaan'] as List<dynamic>?)
              ?.map((e) => Pertanyaan.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'id': instance.id,
      'nama_faktor_resiko': instance.namaFaktorResiko,
      'keterangan': instance.keterangan,
      'gambar': instance.gambar,
      'detail': instance.detail,
      'gangguan_tumbuh_kembang': instance.gangguanTumbuhKembang,
      'is_completed': instance.isCompleted,
      'last_completed': instance.lastCompleted?.toIso8601String(),
      'pertanyaan': instance.pertanyaan,
    };

Pertanyaan _$PertanyaanFromJson(Map<String, dynamic> json) => Pertanyaan(
      id: json['id'] as String,
      namaPertanyaan: json['nama_pertanyaan'] as String,
      selectType: $enumDecode(_$SelectTypeEnumMap, json['select_type']),
      pilihanPertanyaan: (json['pilihan_pertanyaan'] as List<dynamic>)
          .map((e) => PilihanPertanyaan.fromJson(e as Map<String, dynamic>))
          .toList(),
      jawabanSistem: json['jawaban_sistem'] as String?,
    );

Map<String, dynamic> _$PertanyaanToJson(Pertanyaan instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama_pertanyaan': instance.namaPertanyaan,
      'select_type': _$SelectTypeEnumMap[instance.selectType]!,
      'pilihan_pertanyaan': instance.pilihanPertanyaan,
      'jawaban_sistem': instance.jawabanSistem,
    };

const _$SelectTypeEnumMap = {
  SelectType.checkbox: 'checkbox',
  SelectType.radio: 'radio',
};

PilihanPertanyaan _$PilihanPertanyaanFromJson(Map<String, dynamic> json) =>
    PilihanPertanyaan(
      id: json['id'] as String,
      namaPilihan: json['nama_pilihan'] as String,
      isText: json['is_text'] as bool,
    );

Map<String, dynamic> _$PilihanPertanyaanToJson(PilihanPertanyaan instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama_pilihan': instance.namaPilihan,
      'is_text': instance.isText,
    };

GangguanTumbuhKembang _$GangguanTumbuhKembangFromJson(
        Map<String, dynamic> json) =>
    GangguanTumbuhKembang(
      statusStunting: json['statusStunting'] as String,
      statusWasting: json['statusWasting'] as String,
      statusUnderweight: json['statusUnderweight'] as String,
    );

Map<String, dynamic> _$GangguanTumbuhKembangToJson(
        GangguanTumbuhKembang instance) =>
    <String, dynamic>{
      'statusStunting': instance.statusStunting,
      'statusWasting': instance.statusWasting,
      'statusUnderweight': instance.statusUnderweight,
    };
