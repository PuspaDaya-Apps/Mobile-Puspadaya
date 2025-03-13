// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_detail_riwayat_faktor_resiko_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDetailRiwayatFaktorResikoModel _$GetDetailRiwayatFaktorResikoModelFromJson(
        Map<String, dynamic> json) =>
    GetDetailRiwayatFaktorResikoModel(
      message: json['message'] as String,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetDetailRiwayatFaktorResikoModelToJson(
        GetDetailRiwayatFaktorResikoModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as String,
      tanggalPeriode: DateTime.parse(json['tanggal_periode'] as String),
      anak: Anak.fromJson(json['anak'] as Map<String, dynamic>),
      faktorResiko: (json['faktor_resiko'] as List<dynamic>)
          .map((e) => FaktorResiko.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'tanggal_periode': instance.tanggalPeriode.toIso8601String(),
      'anak': instance.anak,
      'faktor_resiko': instance.faktorResiko,
    };

Anak _$AnakFromJson(Map<String, dynamic> json) => Anak(
      id: json['id'] as String,
      namaAnak: json['nama_anak'] as String,
      nik: json['nik'] as String,
    );

Map<String, dynamic> _$AnakToJson(Anak instance) => <String, dynamic>{
      'id': instance.id,
      'nama_anak': instance.namaAnak,
      'nik': instance.nik,
    };

FaktorResiko _$FaktorResikoFromJson(Map<String, dynamic> json) => FaktorResiko(
      id: json['id'] as String,
      namaFaktorResiko: json['nama_faktor_resiko'] as String,
      keterangan: json['keterangan'] as String,
      gambar: json['gambar'] as String,
      detail: json['detail'] as String?,
      periodeBulan: (json['periode_bulan'] as num?)?.toInt(),
      gangguanTumbuhKembang: json['gangguan_tumbuh_kembang'] == null
          ? null
          : GangguanTumbuhKembang.fromJson(
              json['gangguan_tumbuh_kembang'] as Map<String, dynamic>),
      lastCompleted: json['last_completed'] == null
          ? null
          : DateTime.parse(json['last_completed'] as String),
      pertanyaan: (json['pertanyaan'] as List<dynamic>)
          .map((e) => Pertanyaan.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FaktorResikoToJson(FaktorResiko instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama_faktor_resiko': instance.namaFaktorResiko,
      'keterangan': instance.keterangan,
      'gambar': instance.gambar,
      'detail': instance.detail,
      'periode_bulan': instance.periodeBulan,
      'gangguan_tumbuh_kembang': instance.gangguanTumbuhKembang,
      'last_completed': instance.lastCompleted?.toIso8601String(),
      'pertanyaan': instance.pertanyaan,
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

Pertanyaan _$PertanyaanFromJson(Map<String, dynamic> json) => Pertanyaan(
      id: json['id'] as String,
      namaPertanyaan: json['nama_pertanyaan'] as String,
      selectType: json['select_type'] as String,
      tipePilihan: json['tipe_pilihan'] as String,
      jawaban: (json['jawaban'] as List<dynamic>)
          .map((e) => Jawaban.fromJson(e as Map<String, dynamic>))
          .toList(),
      pilihanPertanyaan: (json['pilihan_pertanyaan'] as List<dynamic>)
          .map((e) => PilihanPertanyaan.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PertanyaanToJson(Pertanyaan instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama_pertanyaan': instance.namaPertanyaan,
      'select_type': instance.selectType,
      'tipe_pilihan': instance.tipePilihan,
      'jawaban': instance.jawaban,
      'pilihan_pertanyaan': instance.pilihanPertanyaan,
    };

Jawaban _$JawabanFromJson(Map<String, dynamic> json) => Jawaban(
      id: json['id'] as String,
      jawabanText: json['jawaban_text'] as String?,
      pilihanPertanyaan: PilihanPertanyaan.fromJson(
          json['pilihan_pertanyaan'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$JawabanToJson(Jawaban instance) => <String, dynamic>{
      'id': instance.id,
      'jawaban_text': instance.jawabanText,
      'pilihan_pertanyaan': instance.pilihanPertanyaan,
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
