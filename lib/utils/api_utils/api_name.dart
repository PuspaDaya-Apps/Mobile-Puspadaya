// ignore_for_file: constant_identifier_names

part of 'api_utils.dart';

abstract class LinkApi {
  LinkApi._();

  //!MasterData
  static const PROVINSIURL = "/provinsi";
  static const KABUPATENURL = "/kabupaten-kota";
  static const KECAMATANURL = "/kecamatan";
  static const DESAURL = "/desa-kelurahan";
  static const DUSUNURL = "/dusun";
  static const JUMLAHWILAYAHURL = "/total-wilayah";

  //!Auth
  static const LOGINURL = "/auth/login";
  static const REFRESHTOKENURL = "/auth/refresh-token";
  static const LOGOUTURL = "/auth/logout";
  static const FORGOTPASSWORDURL = "/auth/forgot-password";
  static const RESETPASSWORDURL = "/auth/reset-password";
  static const VERIFYOTPURL = "/auth/verify-otp";
  static const CHANGEPASSWORDURL = "/auth/change-password";

  //!Users
  static const CURRENTUSRURL = "/users/current";
  static const USERURL = "/users";
  static const GANTIPROFILE = "/users/profiles";

  //!Orang Tua
  static const ORANGTUAURL = "/register/orang-tua";
  static const DETAILORANGTUAURL = "/register/orang-tua";

  //!Ibu Hamil
  static const IBUHAMILURL = "/ibu-hamil";

  //!Anak
  static const ANAKURL = "/anak";
  static const ANAKPOSYANDUURL = "/anak-posyandu";

  //!Pengasuh
  static const PENGASUHURL = "/pengasuh";
  static const PENGASUHPOSYANDUURL = "/pengasuh-posyandu";

  //!AlatUkurKader
  static const ALATUKURKADERURL = "/alat-ukur-kader";

  //!AlatUkurAdmin
  static const ALATUKURADMINURL = "/alat-ukur";

  //!Jadwal Posyandu
  static const JADWALPOSYANDU = "/jadwal-posyandu";

  //!Kehadiran Posyandu
  static const KEHADIRANPOSYANDUURL = "/kehadiran-posyandu";

  //! posyandu
  static const POSYANDUURL = '/posyandu';
  static const ANAKBYPOSYANDUURL = '/anak/posyandu';

  //!Pengukuran Anak
  static const PENGUKURANANAKURL = "/pengukuran-anak";
  static const RIWAYATPENGUKURANANAKURL = "/pengukuran-anak/riwayat";

  //!Pengukuran Ibu Hamil
  static const PENGUKURANIBUHAMILURL = "/pengukuran-ibu-hamil";
  static const RIWAYATPENGUKURANIBUHAMILURL = "/pengukuran-ibu-hamil/riwayat";

  //!Beban Kerja
  static const TUGASKADERURL = "/tugas-kader";
  static const PENILAIANMANDIRIURL = "/penilaian-mandiri";

  //!Dashboard
  static const DASHBOARDKADER = "/dashboard/posyandu";

  //! monitoring
  static const MONITORINGANAKSTUNTING = '/monitoring/anak/stunting';
  static const MONITORINGANAKUNDERWEIGHT = '/monitoring/anak/gizi';
  static const MONITORINGANAKWASTING = '/monitoring/anak/wasting';
  static const MONITORINGIBUHAMIL = '/monitoring/ibu-hamil';
  static const MONITORINGANAK = '/monitoring/anak';

  //! Kunjungan
  static const KUNJUNGANURL = '/kunjungan-kader';
  static const TUGASBUKTIKUNJUNGANURL = '/kunjungan-kader/kunjungan-tugas';

  //! Tugas Kunjungan
  static const TUGASKUNJUNGANURL = '/tugas-kunjungan';

  //! File Upload
  static const FILEUPLOADURL = '/file-upload/upload';

  //!utils
  static const GENERATENIK = '/utils/generate-nik';
  static const GENERATEKK = '/utils/generate-nomor-kartu-keluarga';

  //! faktor resiko
  static const FAKTORRESIKO = '/faktor-resiko';
  static const FAKTORRESIKOPERTANYAAN = '/faktor-resiko/pertanyaan';
  static const RIWAYATFAKTORRESIKO = '/faktor-resiko/riwayat';

  //! donwload E-PPGBM
  static const DOWNLOADEPPGBM = "/export-data";

  //! storage
  static const STORAGEURL = "/storage/file";

  //! grafik KMS(Kader Monitoring System),
  static const GRAFIKKMSURL="/grafik-kms";

  //! Pengukuran Tamu
  static const LISTPOSYANDUURL = "/posyandu";
  static const GETANAKBYPOSYANDUURL = "/anak/posyandu";
  static const GETANAKTAMUBYPOSYANDUURL = "/anak-tamu/posyandu";
  static const PENGUKURANTAMUURL = "/pengukuran-anak-tamu";
}
