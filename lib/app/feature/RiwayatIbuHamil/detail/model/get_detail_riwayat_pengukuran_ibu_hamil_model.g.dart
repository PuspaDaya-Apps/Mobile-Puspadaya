// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_detail_riwayat_pengukuran_ibu_hamil_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDetailRiwayatPengukuranIbuHamilModel
    _$GetDetailRiwayatPengukuranIbuHamilModelFromJson(
            Map<String, dynamic> json) =>
        GetDetailRiwayatPengukuranIbuHamilModel(
          data: Data.fromJson(json['data'] as Map<String, dynamic>),
          message: json['message'] as String,
        );

Map<String, dynamic> _$GetDetailRiwayatPengukuranIbuHamilModelToJson(
        GetDetailRiwayatPengukuranIbuHamilModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as String,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
      usiaKehamilan: (json['usia_kehamilan'] as num).toInt(),
      beratBadan: json['berat_badan'] as String,
      tinggiBadan: json['tinggi_badan'] as String,
      hemoglobin: json['hemoglobin'] as String?,
      namaBpjs: json['nama_bpjs'] as String?,
      jumlahTabletFe: (json['jumlah_tablet_fe'] as num).toInt(),
      tanggalPertamaHaid:
          DateTime.parse(json['tanggal_pertama_haid'] as String),
      tanggalTerakhirHaid:
          DateTime.parse(json['tanggal_terakhir_haid'] as String),
      lingkarLenganAtas: json['lingkar_lengan_atas'] as String,
      tinggiFundusUteri: json['tinggi_fundus_uteri'] as String?,
      terpaparAsapRokok: json['terpapar_asap_rokok'] as String,
      catatan: json['catatan'] as String,
      ibuAnak: IbuAnak.fromJson(json['ibu_anak'] as Map<String, dynamic>),
      pengukuranIbuHamil: (json['pengukuran_ibu_hamil'] as List<dynamic>?)
              ?.map(
                  (e) => PengukuranIbuHamil.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'usia_kehamilan': instance.usiaKehamilan,
      'berat_badan': instance.beratBadan,
      'tinggi_badan': instance.tinggiBadan,
      'hemoglobin': instance.hemoglobin,
      'nama_bpjs': instance.namaBpjs,
      'jumlah_tablet_fe': instance.jumlahTabletFe,
      'tanggal_pertama_haid': instance.tanggalPertamaHaid.toIso8601String(),
      'tanggal_terakhir_haid': instance.tanggalTerakhirHaid.toIso8601String(),
      'lingkar_lengan_atas': instance.lingkarLenganAtas,
      'tinggi_fundus_uteri': instance.tinggiFundusUteri,
      'terpapar_asap_rokok': instance.terpaparAsapRokok,
      'catatan': instance.catatan,
      'ibu_anak': instance.ibuAnak,
      'pengukuran_ibu_hamil': instance.pengukuranIbuHamil,
    };

IbuAnak _$IbuAnakFromJson(Map<String, dynamic> json) => IbuAnak(
      id: json['id'] as String,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
      nik: json['nik'] as String,
      namaIbu: json['nama_ibu'] as String,
      tempatLahir: json['tempat_lahir'] as String,
      tanggalLahir: DateTime.parse(json['tanggal_lahir'] as String),
      rt: json['rt'] as String,
      rw: json['rw'] as String,
      alamat: json['alamat'] as String,
      nomorTelepon: json['nomor_telepon'] as String,
      golDarah: json['gol_darah'] as String,
      jenisKb: json['jenis_kb'] as String,
      tanggalMelahirkanSebelumnya: json['tanggal_melahirkan_sebelumnya'] == null
          ? null
          : DateTime.parse(json['tanggal_melahirkan_sebelumnya'] as String),
      jumlahAnak: (json['jumlah_anak'] as num).toInt(),
      userId: json['user_id'] as String?,
      ayah: Ayah.fromJson(json['ayah'] as Map<String, dynamic>),
      kartuKeluarga: KartuKeluarga.fromJson(
          json['kartu_keluarga'] as Map<String, dynamic>),
      dusun: Dusun.fromJson(json['dusun'] as Map<String, dynamic>),
      posyandu: Posyandu.fromJson(json['posyandu'] as Map<String, dynamic>),
      jenisDisabilitas: (json['jenis_disabilitas'] as List<dynamic>?)
              ?.map((e) => JenisDisabilitas.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$IbuAnakToJson(IbuAnak instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'nik': instance.nik,
      'nama_ibu': instance.namaIbu,
      'tempat_lahir': instance.tempatLahir,
      'tanggal_lahir': instance.tanggalLahir.toIso8601String(),
      'rt': instance.rt,
      'rw': instance.rw,
      'alamat': instance.alamat,
      'nomor_telepon': instance.nomorTelepon,
      'gol_darah': instance.golDarah,
      'jenis_kb': instance.jenisKb,
      'tanggal_melahirkan_sebelumnya':
          instance.tanggalMelahirkanSebelumnya?.toIso8601String(),
      'jumlah_anak': instance.jumlahAnak,
      'user_id': instance.userId,
      'ayah': instance.ayah,
      'kartu_keluarga': instance.kartuKeluarga,
      'dusun': instance.dusun,
      'posyandu': instance.posyandu,
      'jenis_disabilitas': instance.jenisDisabilitas,
    };

Ayah _$AyahFromJson(Map<String, dynamic> json) => Ayah(
      id: json['id'] as String,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
      nik: json['nik'] as String,
      namaAyah: json['nama_ayah'] as String,
      tempatLahir: json['tempat_lahir'] as String,
      tanggalLahir: DateTime.parse(json['tanggal_lahir'] as String),
      nomorTelepon: json['nomor_telepon'] as String,
      rt: json['rt'] as String,
      rw: json['rw'] as String,
      alamat: json['alamat'] as String,
      golDarah: json['gol_darah'] as String,
      userId: json['user_id'] as String?,
      posyandu: Posyandu.fromJson(json['posyandu'] as Map<String, dynamic>),
      jenisDisabilitas: (json['jenis_disabilitas'] as List<dynamic>?)
          ?.map((e) => JenisDisabilitas.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AyahToJson(Ayah instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'nik': instance.nik,
      'nama_ayah': instance.namaAyah,
      'tempat_lahir': instance.tempatLahir,
      'tanggal_lahir': instance.tanggalLahir.toIso8601String(),
      'nomor_telepon': instance.nomorTelepon,
      'rt': instance.rt,
      'rw': instance.rw,
      'alamat': instance.alamat,
      'gol_darah': instance.golDarah,
      'user_id': instance.userId,
      'posyandu': instance.posyandu,
      'jenis_disabilitas': instance.jenisDisabilitas,
    };

Dusun _$DusunFromJson(Map<String, dynamic> json) => Dusun(
      id: json['id'] as String,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
      namaDusun: json['nama_dusun'] as String,
      desaKelurahan: DesaKelurahan.fromJson(
          json['desa_kelurahan'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DusunToJson(Dusun instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'nama_dusun': instance.namaDusun,
      'desa_kelurahan': instance.desaKelurahan,
    };

DesaKelurahan _$DesaKelurahanFromJson(Map<String, dynamic> json) =>
    DesaKelurahan(
      id: json['id'] as String,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
      namaDesaKelurahan: json['nama_desa_kelurahan'] as String,
      kecamatan: Kecamatan.fromJson(json['kecamatan'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DesaKelurahanToJson(DesaKelurahan instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'nama_desa_kelurahan': instance.namaDesaKelurahan,
      'kecamatan': instance.kecamatan,
    };

Kecamatan _$KecamatanFromJson(Map<String, dynamic> json) => Kecamatan(
      id: json['id'] as String,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
      namaKecamatan: json['nama_kecamatan'] as String,
      kodeKecamatan: json['kode_kecamatan'] as String,
      kabupatenKota: KabupatenKota.fromJson(
          json['kabupaten_kota'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$KecamatanToJson(Kecamatan instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'nama_kecamatan': instance.namaKecamatan,
      'kode_kecamatan': instance.kodeKecamatan,
      'kabupaten_kota': instance.kabupatenKota,
    };

KabupatenKota _$KabupatenKotaFromJson(Map<String, dynamic> json) =>
    KabupatenKota(
      id: json['id'] as String,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
      namaKabupatenKota: json['nama_kabupaten_kota'] as String,
      kodeKabupatenKota: json['kode_kabupaten_kota'] as String,
      provinsi: Provinsi.fromJson(json['provinsi'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$KabupatenKotaToJson(KabupatenKota instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'nama_kabupaten_kota': instance.namaKabupatenKota,
      'kode_kabupaten_kota': instance.kodeKabupatenKota,
      'provinsi': instance.provinsi,
    };

Provinsi _$ProvinsiFromJson(Map<String, dynamic> json) => Provinsi(
      id: json['id'] as String,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
      namaProvinsi: json['nama_provinsi'] as String,
      kodeProvinsi: json['kode_provinsi'] as String,
    );

Map<String, dynamic> _$ProvinsiToJson(Provinsi instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'nama_provinsi': instance.namaProvinsi,
      'kode_provinsi': instance.kodeProvinsi,
    };

KartuKeluarga _$KartuKeluargaFromJson(Map<String, dynamic> json) =>
    KartuKeluarga(
      id: json['id'] as String,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
      nomorKartuKeluarga: json['nomor_kartu_keluarga'] as String,
    );

Map<String, dynamic> _$KartuKeluargaToJson(KartuKeluarga instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'nomor_kartu_keluarga': instance.nomorKartuKeluarga,
    };

Posyandu _$PosyanduFromJson(Map<String, dynamic> json) => Posyandu(
      id: json['id'] as String,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
      namaPosyandu: json['nama_posyandu'] as String,
      alamat: json['alamat'] as String?,
    );

Map<String, dynamic> _$PosyanduToJson(Posyandu instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'nama_posyandu': instance.namaPosyandu,
      'alamat': instance.alamat,
    };

Kader _$KaderFromJson(Map<String, dynamic> json) => Kader(
      id: json['id'] as String,
      namaLengkap: json['nama_lengkap'] as String,
    );

Map<String, dynamic> _$KaderToJson(Kader instance) => <String, dynamic>{
      'id': instance.id,
      'nama_lengkap': instance.namaLengkap,
    };

JenisDisabilitas _$JenisDisabilitasFromJson(Map<String, dynamic> json) =>
    JenisDisabilitas(
      id: json['id'] as String,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'],
      namaDisabilitas: json['nama_disabilitas'] as String,
    );

Map<String, dynamic> _$JenisDisabilitasToJson(JenisDisabilitas instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt,
      'nama_disabilitas': instance.namaDisabilitas,
    };

PengukuranIbuHamil _$PengukuranIbuHamilFromJson(Map<String, dynamic> json) =>
    PengukuranIbuHamil(
      id: json['id'] as String,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
      usiaIbuHamil: (json['usia_ibu_hamil'] as num).toInt(),
      usiaKehamilan: (json['usia_kehamilan'] as num).toInt(),
      tempatPengukuran: json['tempat_pengukuran'] as String,
      tanggalPengukuran: DateTime.parse(json['tanggal_pengukuran'] as String),
      beratBadan: json['berat_badan'] as String,
      tinggiBadan: json['tinggi_badan'] as String,
      tinggiFundusUteri: json['tinggi_fundus_uteri'] as String,
      lingkarLenganAtas: json['lingkar_lengan_atas'] as String,
      hemoglobin: json['hemoglobin'] as String?,
      terpaparAsapRokok: json['terpapar_asap_rokok'] as String,
      jumlahTabletFe: (json['jumlah_tablet_fe'] as num).toInt(),
      catatan: json['catatan'] as String?,
      kader: Kader.fromJson(json['kader'] as Map<String, dynamic>),
      posyandu: Posyandu.fromJson(json['posyandu'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PengukuranIbuHamilToJson(PengukuranIbuHamil instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'usia_ibu_hamil': instance.usiaIbuHamil,
      'usia_kehamilan': instance.usiaKehamilan,
      'tempat_pengukuran': instance.tempatPengukuran,
      'tanggal_pengukuran': instance.tanggalPengukuran.toIso8601String(),
      'berat_badan': instance.beratBadan,
      'tinggi_badan': instance.tinggiBadan,
      'tinggi_fundus_uteri': instance.tinggiFundusUteri,
      'lingkar_lengan_atas': instance.lingkarLenganAtas,
      'hemoglobin': instance.hemoglobin,
      'terpapar_asap_rokok': instance.terpaparAsapRokok,
      'jumlah_tablet_fe': instance.jumlahTabletFe,
      'catatan': instance.catatan,
      'kader': instance.kader,
      'posyandu': instance.posyandu,
    };
