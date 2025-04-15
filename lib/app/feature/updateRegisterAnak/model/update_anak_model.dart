import 'package:json_annotation/json_annotation.dart';

// part 'update_anak_model.g.dart';

// @JsonSerializable()
class UpdateAnakModel {
  String nik;
  @JsonKey(name: 'nama_anak')
  String namaAnak;
  @JsonKey(name: 'tempat_lahir')
  String tempatLahir;
  @JsonKey(name: 'anak_ke')
  int anakKe;
  @JsonKey(name: 'tanggal_lahir')
  String tanggalLahir;
  @JsonKey(name: 'jenis_kelamin')
  String jenisKelamin;
  @JsonKey(name: 'berat_badan_lahir')
  double beratBadanLahir;
  @JsonKey(name: 'tinggi_badan_lahir')
  double tinggiBadanLahir;
  @JsonKey(name: 'lingkar_kepala_lahir')
  double lingkarKepalaLahir;
  @JsonKey(name: 'lingkar_lengan_atas_lahir')
  double lingkarLenganAtasLahir;
  @JsonKey(name: 'jarak_posyandu')
  double jarakPosyandu;
  @JsonKey(name: 'cara_lahir')
  String caraLahir;
  @JsonKey(name: 'status_kelahiran')
  String statusKelahiran;
  @JsonKey(name: 'status_orang_tua')
  String statusOrangTua;
  @JsonKey(name: 'disabilitas_anak')
  List<String> disabilitasAnak;
  Pengasuh? pengasuh; 

  UpdateAnakModel({
    required this.jarakPosyandu,
    required this.nik,
    required this.namaAnak,
    required this.anakKe,
    required this.tempatLahir,
    required this.tanggalLahir,
    required this.jenisKelamin,
    required this.beratBadanLahir,
    required this.tinggiBadanLahir,
    required this.lingkarKepalaLahir,
    required this.lingkarLenganAtasLahir,
    required this.caraLahir,
    required this.statusKelahiran,
    required this.statusOrangTua,
    required this.disabilitasAnak,
    this.pengasuh,
  });

  UpdateAnakModel copyWith({
    String? nik,
    String? namaAnak,
    String? tempatLahir,
    int? anakKe,
    String? tanggalLahir,
    String? jenisKelamin,
    double? beratBadanLahir,
    double? tinggiBadanLahir,
    double? lingkarKepalaLahir,
    double? lingkarLenganAtasLahir,
    double? jarakPosyandu,
    String? caraLahir,
    String? statusKelahiran,
    String? kartuKeluargaId,
    String? statusOrangTua,
    List<String>? disabilitasAnak,
    Pengasuh? pengasuh,
  }) =>
      UpdateAnakModel(
        jarakPosyandu: jarakPosyandu ?? this.jarakPosyandu,
        nik: nik?? this.nik,
        namaAnak: namaAnak ?? this.namaAnak,
        tempatLahir: tempatLahir ?? this.tempatLahir,
        anakKe: anakKe ?? this.anakKe,
        tanggalLahir: tanggalLahir ?? this.tanggalLahir,
        jenisKelamin: jenisKelamin ?? this.jenisKelamin,
        beratBadanLahir: beratBadanLahir ?? this.beratBadanLahir,
        tinggiBadanLahir: tinggiBadanLahir ?? this.tinggiBadanLahir,
        lingkarKepalaLahir: lingkarKepalaLahir ?? this.lingkarKepalaLahir,
        lingkarLenganAtasLahir: lingkarLenganAtasLahir ?? this.lingkarLenganAtasLahir,
        caraLahir: caraLahir ?? this.caraLahir,
        statusKelahiran: statusKelahiran ?? this.statusKelahiran,
        statusOrangTua: statusOrangTua ?? this.statusOrangTua,
        disabilitasAnak: disabilitasAnak ?? this.disabilitasAnak,
        pengasuh: pengasuh ?? this.pengasuh,
      );

  factory UpdateAnakModel.fromJson(Map<String, dynamic> json) => _$UpdateAnakModelFromJson(json);

  Map<String, dynamic> toJson()=>_$UpdateAnakModelToJson(this);
}

// @JsonSerializable()
class Pengasuh {
  @JsonKey(name: 'status_hubungan')
  String statusHubungan;
  String nik;
  @JsonKey(name: 'nama_pengasuh')
  String namaPengasuh;
  @JsonKey(name: 'tempat_lahir')
  String tempatLahir;
  @JsonKey(name: 'tanggal_lahir')
  String tanggalLahir;
  String rt;
  String rw;
  @JsonKey(name: 'alamat_lengkap')
  String alamatLengkap;
  @JsonKey(name: 'dusun_id')
  String dusunId;
  @JsonKey(name: 'no_telepon')
  String noTelepon;
  @JsonKey(name: 'gol_darah')
  String golDarah;
  @JsonKey(name: 'nomor_kartu_keluarga')
  String nomorKartuKeluarga;
  @JsonKey(name: 'disabilitas_pengasuh')
  List<String> disabilitasPengasuh;

  Pengasuh({
    required this.statusHubungan,
    required this.nik,
    required this.namaPengasuh,
    required this.tempatLahir,
    required this.tanggalLahir,
    required this.rt,
    required this.rw,
    required this.alamatLengkap,
    required this.dusunId,
    required this.noTelepon,
    required this.golDarah,
    required this.nomorKartuKeluarga,
    required this.disabilitasPengasuh,
  });

  factory Pengasuh.fromJson(Map<String, dynamic> json) => _$PengasuhFromJson(json);

  Map<String, dynamic> toJson()=>_$PengasuhToJson(this);
}

UpdateAnakModel _$UpdateAnakModelFromJson(Map<String, dynamic> json) =>
    UpdateAnakModel(
      jarakPosyandu: (json['jarak_posyandu'] as num).toDouble(),
      nik: json['nik'] as String,
      namaAnak: json['nama_anak'] as String,
      anakKe: (json['anak_ke'] as num).toInt(),
      tempatLahir: json['tempat_lahir'] as String,
      tanggalLahir: json['tanggal_lahir'] as String,
      jenisKelamin: json['jenis_kelamin'] as String,
      beratBadanLahir: (json['berat_badan_lahir'] as num).toDouble(),
      tinggiBadanLahir: (json['tinggi_badan_lahir'] as num).toDouble(),
      lingkarKepalaLahir: (json['lingkar_kepala_lahir'] as num).toDouble(),
      lingkarLenganAtasLahir:
          (json['lingkar_lengan_atas_lahir'] as num).toDouble(),
      caraLahir: json['cara_lahir'] as String,
      statusKelahiran: json['status_kelahiran'] as String,
      statusOrangTua: json['status_orang_tua'] as String,
      disabilitasAnak: (json['disabilitas_anak'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      pengasuh: json['pengasuh'] == null
          ? null
          : Pengasuh.fromJson(json['pengasuh'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateAnakModelToJson(UpdateAnakModel instance) =>
    <String, dynamic>{
      'nik': instance.nik,
      'nama_anak': instance.namaAnak,
      'tempat_lahir': instance.tempatLahir,
      'anak_ke': instance.anakKe,
      'tanggal_lahir': instance.tanggalLahir,
      'jenis_kelamin': instance.jenisKelamin,
      'berat_badan_lahir': instance.beratBadanLahir,
      'tinggi_badan_lahir': instance.tinggiBadanLahir,
      'lingkar_kepala_lahir': instance.lingkarKepalaLahir,
      'lingkar_lengan_atas_lahir': instance.lingkarLenganAtasLahir,
      'jarak_posyandu': instance.jarakPosyandu,
      'cara_lahir': instance.caraLahir,
      'status_kelahiran': instance.statusKelahiran,
      'status_orang_tua': instance.statusOrangTua,
      'disabilitas_anak': instance.disabilitasAnak,
      'pengasuh': instance.pengasuh,
    };

Pengasuh _$PengasuhFromJson(Map<String, dynamic> json) => Pengasuh(
      statusHubungan: json['status_hubungan'] as String,
      nik: json['nik'] as String,
      namaPengasuh: json['nama_pengasuh'] as String,
      tempatLahir: json['tempat_lahir'] as String,
      tanggalLahir: json['tanggal_lahir'] as String,
      rt: json['rt'] as String,
      rw: json['rw'] as String,
      alamatLengkap: json['alamat_lengkap'] as String,
      dusunId: json['dusun_id'] as String,
      noTelepon: json['no_telepon'] as String,
      golDarah: json['gol_darah'] as String,
      nomorKartuKeluarga: json['nomor_kartu_keluarga'] as String,
      disabilitasPengasuh: (json['disabilitas_pengasuh'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$PengasuhToJson(Pengasuh instance) => <String, dynamic>{
      'status_hubungan': instance.statusHubungan,
      'nik': instance.nik,
      'nama_pengasuh': instance.namaPengasuh,
      'tempat_lahir': instance.tempatLahir,
      'tanggal_lahir': instance.tanggalLahir,
      'rt': instance.rt,
      'rw': instance.rw,
      'alamat_lengkap': instance.alamatLengkap,
      'dusun_id': instance.dusunId,
      'no_telepon': instance.noTelepon,
      'gol_darah': instance.golDarah,
      'nomor_kartu_keluarga': instance.nomorKartuKeluarga,
      'disabilitas_pengasuh': instance.disabilitasPengasuh,
    };
