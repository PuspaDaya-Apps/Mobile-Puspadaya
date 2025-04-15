import 'package:json_annotation/json_annotation.dart';

// part 'detail_kunjungan_anak_tidak_hadir_response_model.g.dart';

//@JsonSerializable()
class ErrorMessage {
  String message;

  ErrorMessage({
    required this.message,
  });

  factory ErrorMessage.fromJson(Map<String, dynamic> json) => _$ErrorMessageFromJson(json);

  Map<String, dynamic> toJson()=>_$ErrorMessageToJson(this);
}

//@JsonSerializable()
class DetailKunjunganAnakTidakHadirResponseModel {
  String id;
  @JsonKey(name: 'status_kunjungan')
  String statusKunjungan;
  @JsonKey(name: 'jenis_kunjungan')
  String jenisKunjungan;
  @JsonKey(name: 'tanggal_kunjungan')
  DateTime tanggalKunjungan;
  @JsonKey(name: 'mulai_pada')
  DateTime mulaiPada;
  @JsonKey(name: 'selesai_pada')
  DateTime selesaiPada;
  Anak? anak;
  @JsonKey(name: 'kunjungan_tugas_kader')
  List<KunjunganTugasKader> kunjunganTugasKader;
  @JsonKey(name: 'bukti_kunjungan')
  List<BuktiKunjungan> buktiKunjungan;

  DetailKunjunganAnakTidakHadirResponseModel({
    required this.id,
    required this.statusKunjungan,
    required this.jenisKunjungan,
    required this.tanggalKunjungan,
    required this.mulaiPada,
    required this.selesaiPada,
    this.anak,
    required this.kunjunganTugasKader,
    required this.buktiKunjungan,
  });

  factory DetailKunjunganAnakTidakHadirResponseModel.fromJson(Map<String, dynamic> json) => _$DetailKunjunganAnakTidakHadirResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$DetailKunjunganAnakTidakHadirResponseModelToJson(this);
}

//@JsonSerializable()
class Anak {
  String id;
  @JsonKey(name: 'nama_anak')
  String namaAnak;
  String nik;
  @JsonKey(name: 'jarak_posyandu')
  String jarakPosyandu;
  @JsonKey(name: 'kartu_keluarga')
  KartuKeluarga kartuKeluarga;

  Anak({
    required this.id,
    required this.namaAnak,
    required this.nik,
    required this.jarakPosyandu,
    required this.kartuKeluarga
  });

  factory Anak.fromJson(Map<String, dynamic> json) => _$AnakFromJson(json);

  Map<String, dynamic> toJson()=>_$AnakToJson(this);
}

//@JsonSerializable()
class KartuKeluarga {
  Ibu? ibu;

  KartuKeluarga({
    required this.ibu
  });

  factory KartuKeluarga.fromJson(Map<String, dynamic> json) => _$KartuKeluargaFromJson(json);

  Map<String, dynamic> toJson()=>_$KartuKeluargaToJson(this);
}

//@JsonSerializable()
class Ibu {
  String rt;
  String rw;
  @JsonKey(name: 'alamat') 
  String alamat;
  Dusun dusun;

  Ibu({
    required this.rt,
    required this.rw,
    required this.alamat,
    required this.dusun
  });

  factory Ibu.fromJson(Map<String, dynamic> json) => _$IbuFromJson(json);

  Map<String, dynamic> toJson()=>_$IbuToJson(this);
}


//@JsonSerializable()
class Dusun {
  String id;
  @JsonKey(name: 'nama_dusun')
  String namaDusun;
  @JsonKey(name: 'desa_kelurahan')
  DesaKelurahan desaKelurahan;

  Dusun({
    required this.id,
    required this.namaDusun,
    required this.desaKelurahan
  });

  factory Dusun.fromJson(Map<String, dynamic> json) => _$DusunFromJson(json);

  Map<String, dynamic> toJson()=>_$DusunToJson(this);
}

//@JsonSerializable()
class DesaKelurahan {
  String id;
  @JsonKey(name: 'nama_desa_kelurahan')
  String namaDesaKelurahan;
  Kecamatan kecamatan;

  DesaKelurahan({
    required this.id,
    required this.namaDesaKelurahan,
    required this.kecamatan
  });

  factory DesaKelurahan.fromJson(Map<String, dynamic> json) => _$DesaKelurahanFromJson(json);

  Map<String, dynamic> toJson()=>_$DesaKelurahanToJson(this);
}

//@JsonSerializable()
class Kecamatan {
  String id;
  @JsonKey(name: 'nama_kecamatan')
  String namaKecamatan;
  @JsonKey(name : 'kabupaten_kota')
  KabupatenKota kabupatenKota;

  Kecamatan({
    required this.id,
    required this.namaKecamatan,
    required this.kabupatenKota
  });

  factory Kecamatan.fromJson(Map<String, dynamic> json) => _$KecamatanFromJson(json);

  Map<String, dynamic> toJson()=>_$KecamatanToJson(this);
}

//@JsonSerializable()
class KabupatenKota{
  String id;
  @JsonKey(name: 'nama_kabupaten_kota')
  String namaKabupatenKota;

  KabupatenKota({
    required this.id,
    required this.namaKabupatenKota
  });

  factory KabupatenKota.fromJson(Map<String, dynamic> json) => _$KabupatenKotaFromJson(json);

  Map<String, dynamic> toJson()=>_$KabupatenKotaToJson(this);
}

//@JsonSerializable()
class KunjunganTugasKader {
  String id;
  @JsonKey(name: 'tugas_kunjungan')
  TugasKunjungan tugasKunjungan;

  KunjunganTugasKader({
    required this.id,
    required this.tugasKunjungan
  });

  factory KunjunganTugasKader.fromJson(Map<String, dynamic> json) => _$KunjunganTugasKaderFromJson(json);

  Map<String, dynamic> toJson()=>_$KunjunganTugasKaderToJson(this);
}

//@JsonSerializable()
class TugasKunjungan {
  String id;
  @JsonKey(name: 'nama_tugas')
  String namaTugas;

  TugasKunjungan({
    required this.id,
    required this.namaTugas
  });

  factory TugasKunjungan.fromJson(Map<String, dynamic> json) => _$TugasKunjunganFromJson(json);

  Map<String, dynamic> toJson()=>_$TugasKunjunganToJson(this);
}

//@JsonSerializable()
class BuktiKunjungan {
  String id;
  @JsonKey(name: 'file_path')
  String filePath;

  BuktiKunjungan({
    required this.id,
    required this.filePath
  });

  factory BuktiKunjungan.fromJson(Map<String, dynamic> json) => _$BuktiKunjunganFromJson(json);

  Map<String, dynamic> toJson()=>_$BuktiKunjunganToJson(this);
}

ErrorMessage _$ErrorMessageFromJson(Map<String, dynamic> json) => ErrorMessage(
      message: json['message'] as String,
    );

Map<String, dynamic> _$ErrorMessageToJson(ErrorMessage instance) =>
    <String, dynamic>{
      'message': instance.message,
    };

DetailKunjunganAnakTidakHadirResponseModel
    _$DetailKunjunganAnakTidakHadirResponseModelFromJson(
            Map<String, dynamic> json) =>
        DetailKunjunganAnakTidakHadirResponseModel(
          id: json['id'] as String,
          statusKunjungan: json['status_kunjungan'] as String,
          jenisKunjungan: json['jenis_kunjungan'] as String,
          tanggalKunjungan: DateTime.parse(json['tanggal_kunjungan'] as String),
          mulaiPada: DateTime.parse("${json['tanggal_kunjungan']} ${json['mulai_pada']}"),
          selesaiPada: DateTime.parse("${json['tanggal_kunjungan']} ${json['selesai_pada']}"),
          anak: json['anak'] == null
              ? null
              : Anak.fromJson(json['anak'] as Map<String, dynamic>),
          kunjunganTugasKader: (json['kunjungan_tugas_kader'] as List<dynamic>)
              .map((e) =>
                  KunjunganTugasKader.fromJson(e as Map<String, dynamic>))
              .toList(),
          buktiKunjungan: (json['bukti_kunjungan'] as List<dynamic>)
              .map((e) => BuktiKunjungan.fromJson(e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$DetailKunjunganAnakTidakHadirResponseModelToJson(
        DetailKunjunganAnakTidakHadirResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status_kunjungan': instance.statusKunjungan,
      'jenis_kunjungan': instance.jenisKunjungan,
      'tanggal_kunjungan': instance.tanggalKunjungan.toIso8601String(),
      'mulai_pada': instance.mulaiPada.toIso8601String(),
      'selesai_pada': instance.selesaiPada.toIso8601String(),
      'anak': instance.anak,
      'kunjungan_tugas_kader': instance.kunjunganTugasKader,
      'bukti_kunjungan': instance.buktiKunjungan,
    };

Anak _$AnakFromJson(Map<String, dynamic> json) => Anak(
      id: json['id'] as String,
      namaAnak: json['nama_anak'] as String,
      nik: json['nik'] as String,
      jarakPosyandu: json['jarak_posyandu'] as String,
      kartuKeluarga: KartuKeluarga.fromJson(
          json['kartu_keluarga'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnakToJson(Anak instance) => <String, dynamic>{
      'id': instance.id,
      'nama_anak': instance.namaAnak,
      'nik': instance.nik,
      'jarak_posyandu': instance.jarakPosyandu,
      'kartu_keluarga': instance.kartuKeluarga,
    };

KartuKeluarga _$KartuKeluargaFromJson(Map<String, dynamic> json) =>
    KartuKeluarga(
      ibu: json['ibu'] == null
          ? null
          : Ibu.fromJson(json['ibu'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$KartuKeluargaToJson(KartuKeluarga instance) =>
    <String, dynamic>{
      'ibu': instance.ibu,
    };

Ibu _$IbuFromJson(Map<String, dynamic> json) => Ibu(
      rt: json['rt'] as String,
      rw: json['rw'] as String,
      alamat: json['alamat'] as String,
      dusun: Dusun.fromJson(json['dusun'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IbuToJson(Ibu instance) => <String, dynamic>{
      'rt': instance.rt,
      'rw': instance.rw,
      'alamat': instance.alamat,
      'dusun': instance.dusun,
    };

Dusun _$DusunFromJson(Map<String, dynamic> json) => Dusun(
      id: json['id'] as String,
      namaDusun: json['nama_dusun'] as String,
      desaKelurahan: DesaKelurahan.fromJson(
          json['desa_kelurahan'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DusunToJson(Dusun instance) => <String, dynamic>{
      'id': instance.id,
      'nama_dusun': instance.namaDusun,
      'desa_kelurahan': instance.desaKelurahan,
    };

DesaKelurahan _$DesaKelurahanFromJson(Map<String, dynamic> json) =>
    DesaKelurahan(
      id: json['id'] as String,
      namaDesaKelurahan: json['nama_desa_kelurahan'] as String,
      kecamatan: Kecamatan.fromJson(json['kecamatan'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DesaKelurahanToJson(DesaKelurahan instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama_desa_kelurahan': instance.namaDesaKelurahan,
      'kecamatan': instance.kecamatan,
    };

Kecamatan _$KecamatanFromJson(Map<String, dynamic> json) => Kecamatan(
      id: json['id'] as String,
      namaKecamatan: json['nama_kecamatan'] as String,
      kabupatenKota: KabupatenKota.fromJson(
          json['kabupaten_kota'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$KecamatanToJson(Kecamatan instance) => <String, dynamic>{
      'id': instance.id,
      'nama_kecamatan': instance.namaKecamatan,
      'kabupaten_kota': instance.kabupatenKota,
    };

KabupatenKota _$KabupatenKotaFromJson(Map<String, dynamic> json) =>
    KabupatenKota(
      id: json['id'] as String,
      namaKabupatenKota: json['nama_kabupaten_kota'] as String,
    );

Map<String, dynamic> _$KabupatenKotaToJson(KabupatenKota instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama_kabupaten_kota': instance.namaKabupatenKota,
    };

KunjunganTugasKader _$KunjunganTugasKaderFromJson(Map<String, dynamic> json) =>
    KunjunganTugasKader(
      id: json['id'] as String,
      tugasKunjungan: TugasKunjungan.fromJson(
          json['tugas_kunjungan'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$KunjunganTugasKaderToJson(
        KunjunganTugasKader instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tugas_kunjungan': instance.tugasKunjungan,
    };

TugasKunjungan _$TugasKunjunganFromJson(Map<String, dynamic> json) =>
    TugasKunjungan(
      id: json['id'] as String,
      namaTugas: json['nama_tugas'] as String,
    );

Map<String, dynamic> _$TugasKunjunganToJson(TugasKunjungan instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama_tugas': instance.namaTugas,
    };

BuktiKunjungan _$BuktiKunjunganFromJson(Map<String, dynamic> json) =>
    BuktiKunjungan(
      id: json['id'] as String,
      filePath: json['file_path'] as String,
    );

Map<String, dynamic> _$BuktiKunjunganToJson(BuktiKunjungan instance) =>
    <String, dynamic>{
      'id': instance.id,
      'file_path': instance.filePath,
    };
