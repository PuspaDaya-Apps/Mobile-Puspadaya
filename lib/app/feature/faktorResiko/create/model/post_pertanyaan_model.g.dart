// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_pertanyaan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostPertanyaanModel _$PostPertanyaanModelFromJson(Map<String, dynamic> json) =>
    PostPertanyaanModel(
      tanggalPeriode: json['tanggal_periode'] as String,
      anakId: json['anak_id'] as String,
      faktorResiko: (json['faktor_resiko'] as List<dynamic>)
          .map((e) => FaktorResiko.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PostPertanyaanModelToJson(
        PostPertanyaanModel instance) =>
    <String, dynamic>{
      'tanggal_periode': instance.tanggalPeriode,
      'anak_id': instance.anakId,
      'faktor_resiko': instance.faktorResiko,
    };

FaktorResiko _$FaktorResikoFromJson(Map<String, dynamic> json) => FaktorResiko(
      pertanyaanId: json['pertanyaan_id'] as String,
      jawabanId: (json['jawaban_id'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      jawabanText: json['jawaban_text'] as String?,
    );

Map<String, dynamic> _$FaktorResikoToJson(FaktorResiko instance) =>
    <String, dynamic>{
      'pertanyaan_id': instance.pertanyaanId,
      'jawaban_id': instance.jawabanId,
      'jawaban_text': instance.jawabanText,
    };
