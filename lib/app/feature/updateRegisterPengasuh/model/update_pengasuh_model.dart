import 'package:json_annotation/json_annotation.dart';

// part 'update_pengasuh_mobile.g.dart';

// @JsonSerializable()
class UpdatePengasuhModel {
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
  String? noTelepon;
  @JsonKey(name: 'gol_darah')
  String golDarah;
  @JsonKey(name: 'nomor_kartu_keluarga')
  String nomorKartuKeluarga;
  @JsonKey(name: 'disabilitas_pengasuh')
  List<String> disabilitasPengasuh;

  UpdatePengasuhModel({
    required this.statusHubungan,
    required this.nik,
    required this.namaPengasuh,
    required this.tempatLahir,
    required this.tanggalLahir,
    required this.rt,
    required this.rw,
    required this.alamatLengkap,
    required this.dusunId,
    this.noTelepon,
    required this.golDarah,
    required this.nomorKartuKeluarga,
    required this.disabilitasPengasuh,
  });

  factory UpdatePengasuhModel.fromJson(Map<String, dynamic> json) => _$UpdatePengasuhModelFromJson(json);

  Map<String, dynamic> toJson()=>_$UpdatePengasuhModelToJson(this);
}

UpdatePengasuhModel _$UpdatePengasuhModelFromJson(Map<String, dynamic> json) => UpdatePengasuhModel(
      statusHubungan: json['status_hubungan'] as String,
      nik: json['nik'] as String,
      namaPengasuh: json['nama_pengasuh'] as String,
      tempatLahir: json['tempat_lahir'] as String,
      tanggalLahir: json['tanggal_lahir'] as String,
      rt: json['rt'] as String,
      rw: json['rw'] as String,
      alamatLengkap: json['alamat_lengkap'] as String,
      dusunId: json['dusun_id'] as String,
      noTelepon: json['no_telepon'] as String?,
      golDarah: json['gol_darah'] as String,
      nomorKartuKeluarga: json['nomor_kartu_keluarga'] as String,
      disabilitasPengasuh: (json['disabilitas_pengasuh'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$UpdatePengasuhModelToJson(UpdatePengasuhModel instance) => <String, dynamic>{
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
