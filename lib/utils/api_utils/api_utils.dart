import 'package:flutter/material.dart';

part 'api_name.dart';

class ApiUtils {
  //!Base URL
  // final String _baseUrl = "http://now4kswkgo4owoks884o0wc0.103.109.210.102.sslip.io"; //! staging
  final String _baseUrl =
      "http://gsg4k8os8gwsc4ksk4kkgg48.103.109.210.102.sslip.io"; //! production
  // final String _baseUrl = "https://40vg7x7b-8080.asse.devtunnels.ms";
  // final String _baseUrlQuaryParameter = "now4kswkgo4owoks884o0wc0.103.109.210.102.sslip.io";
  final String _apiVersion = "/api/v1";

  //!Header
  // Map<String, String> header() =>
  //     {'Content-Type': 'application/json', 'Accept': 'application/json'};

  Map<String, String> headerWithToken(String token) => {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      };

  // Map<String, String> headerTokenForMultipart(String token) => {
  //       'Authorization': 'Bearer $token',
  //       'Content-Type': 'multipart/form-data',
  //     };

  //!Auth
  String urlLogin() {
    String urlLogin = LinkApi.LOGINURL;
    return _baseUrl + _apiVersion + urlLogin;
  }

  String urlRefreshToken() {
    String urlRefreshToken = LinkApi.REFRESHTOKENURL;
    return _baseUrl + _apiVersion + urlRefreshToken;
  }

  String urlLogout() {
    String urlLogout = LinkApi.LOGOUTURL;
    return _baseUrl + _apiVersion + urlLogout;
  }

  String urlForgotPassword() {
    String urlForgotPassword = LinkApi.FORGOTPASSWORDURL;
    return _baseUrl + _apiVersion + urlForgotPassword;
  }

  String urlResetPassword() {
    String urlResetPassword = LinkApi.RESETPASSWORDURL;
    return _baseUrl + _apiVersion + urlResetPassword;
  }

  String urlVerifyOTP() {
    String urlVerifyOTP = LinkApi.VERIFYOTPURL;
    return _baseUrl + _apiVersion + urlVerifyOTP;
  }

  String urlChangePassword() {
    String urlChangePassword = LinkApi.CHANGEPASSWORDURL;
    return _baseUrl + _apiVersion + urlChangePassword;
  }

  //!User
  String urlCurrentUser() {
    String urlCurrentUser = LinkApi.CURRENTUSRURL;
    return _baseUrl + _apiVersion + urlCurrentUser;
  }

  String urlGetDetailCurrentUser(String id) {
    String urlCurrentUser = LinkApi.USERURL;
    return '$_baseUrl$_apiVersion$urlCurrentUser/$id';
  }

  String urlPatchGantiProfile() {
    String urlPatchGantiProfile = LinkApi.GANTIPROFILE;
    return _baseUrl + _apiVersion + urlPatchGantiProfile;
    // return "http://now4kswkgo4owoks884o0wc0.103.109.210.102.sslip.io/api/v1/users/profile";
  }

  //!anggota kader
  String urlGetListAnggotaKader({String? search, int? page, int? limit}) {
    String urlGetlListAnggotaKader = LinkApi.USERURL;
    // Map<String, dynamic> parameterQuery = parameterQueryHelper(
    //   search, page, 1000
    // );
    return _baseUrl + _apiVersion + urlGetlListAnggotaKader;
  }

  String urlPostDataAnggotaKader() {
    String urlPostDataAnggotaKader = LinkApi.USERURL;
    return _baseUrl + _apiVersion + urlPostDataAnggotaKader;
  }

  String urlGetDetailAnggotaKader(String id) {
    String urlGetDetailAnggotaKader = LinkApi.USERURL;
    return "$_baseUrl$_apiVersion$urlGetDetailAnggotaKader/$id";
  }

  String urlPatchDataAnggotaKader(String id) {
    String urlPatchDataAnggotaKader = LinkApi.USERURL;
    debugPrint("link id = $id");
    debugPrint('$_baseUrl$_apiVersion$urlPatchDataAnggotaKader/$id');
    return '$_baseUrl$_apiVersion$urlPatchDataAnggotaKader/$id';
    // return "$_baseUrl$_apiVersion$urlPatchDataPengukuranAnak/$id";
  }

  String urlDeleteDataAnggotaKader(String id) {
    String urlDeleteDataAnggotaKader = LinkApi.USERURL;
    return "$_baseUrl$_apiVersion$urlDeleteDataAnggotaKader/$id";
  }

  //!Orang Tua
  String urlGetListOrangTua({String? search, int? page, int? limit}) {
    String urlGetListOrangTua = LinkApi.ORANGTUAURL;
    // Map<String, dynamic> parameterQuery = parameterQueryHelper(
    //   search, page, limit
    // );
    return _baseUrl + _apiVersion + urlGetListOrangTua;
  }

  String urlPostDataOrangTua() {
    String urlPostDataOrangTua = LinkApi.ORANGTUAURL;
    return _baseUrl + _apiVersion + urlPostDataOrangTua;
  }

  String urlPatchDataOrangTua(String id) {
    String urlPatchDataOrangTua = LinkApi.ORANGTUAURL;
    return "$_baseUrl$_apiVersion$urlPatchDataOrangTua/$id";
  }

  String urlGetDetailOrangTua(String idAyah) {
    String urlGetDetailOrangTua = LinkApi.ORANGTUAURL;
    return '$_baseUrl$_apiVersion$urlGetDetailOrangTua/$idAyah';
  }

  //!Anak
  String urlGetListAnak({String? search, int? page, int? limit}) {
    String urlGetListAnak = LinkApi.ANAKURL;
    // Map<String, dynamic> parameterQuery = parameterQueryHelper(
    //   search, page, 1000
    // );
    return _baseUrl + _apiVersion + urlGetListAnak;
  }

  String urlPostDataAnak() {
    String urlPostDataAnak = LinkApi.ANAKURL;
    return _baseUrl + _apiVersion + urlPostDataAnak;
  }

  String urlGetPosyandu({String? search, int? page, int? limit}) {
    String urlGetPosyandu = LinkApi.POSYANDUURL;
    if (limit != null)
      return _baseUrl + _apiVersion + urlGetPosyandu + '?limit=$limit';
    return _baseUrl + _apiVersion + urlGetPosyandu;
  }

  String urlGetAllAnakByPosyandu(String id) {
    String urlGetDetailAnak = LinkApi.ANAKBYPOSYANDUURL;
    return "$_baseUrl$_apiVersion$urlGetDetailAnak/$id";
  }

  String urlGetAnakPosyandu({String? search, int? page, int? limit}) {
    String urlGetAnakPosyandu = LinkApi.ANAKPOSYANDUURL;
    // Map<String, dynamic> parameterQuery = parameterQueryHelper(
    //   search, page, 1000
    // );
    if (limit != null)
      return _baseUrl + _apiVersion + urlGetAnakPosyandu + '?limit=$limit';
    return _baseUrl + _apiVersion + urlGetAnakPosyandu;
  }

  String urlGetDetailAnak(String id) {
    String urlGetDetailAnak = LinkApi.ANAKURL;
    return "$_baseUrl$_apiVersion$urlGetDetailAnak/$id";
  }

  String urlPatchDataAnak(String id) {
    String urlPatchDataAnak = LinkApi.ANAKURL;
    return "$_baseUrl$_apiVersion$urlPatchDataAnak/$id";
  }

  String urlDeleteDataAnak(String id) {
    String urlDeleteDataAnak = LinkApi.ANAKURL;
    return "$_baseUrl$_apiVersion$urlDeleteDataAnak/$id";
  }

  //!Ibu Hamil
  String urlGetListIbuHamil({String? search, int? page, int? limit}) {
    String urlGetListIbuHamil = LinkApi.IBUHAMILURL;
    // Map<String, dynamic> parameterQuery = parameterQueryHelper(
    //   search, page, 1000
    // );
    if (limit != null)
      return '$_baseUrl$_apiVersion$urlGetListIbuHamil?limit=$limit';
    return _baseUrl + _apiVersion + urlGetListIbuHamil;
  }

  String urlPostDataIbuHamil() {
    String urlPostDataIbuHamil = LinkApi.IBUHAMILURL;
    return _baseUrl + _apiVersion + urlPostDataIbuHamil;
  }

  String urlGetDetailIbuHamil(String id) {
    String urlGetDetailIbuHamil = LinkApi.IBUHAMILURL;
    return "$_baseUrl$_apiVersion$urlGetDetailIbuHamil/$id";
  }

  String urlPatchDataIbuHamil(String id) {
    String urlPatchDataIbuHamil = LinkApi.IBUHAMILURL;
    return "$_baseUrl$_apiVersion$urlPatchDataIbuHamil/$id";
  }

  // ! detail monitoring ibu hamil
  String urlGetDetailMonitoringIbuHamil(String id) {
    String urlGetDetailMonitoringIbuHamil = LinkApi.MONITORINGIBUHAMIL;
    return '$_baseUrl$_apiVersion$urlGetDetailMonitoringIbuHamil/$id';
  }

  // ! detail monitoring anak
  String urlGetDetailMonitoringAnak(String id) {
    String urlGetDetailMonitoringAnak = LinkApi.MONITORINGANAK;
    return '$_baseUrl$_apiVersion$urlGetDetailMonitoringAnak/$id';
  }

  //!Pengasuh
  String urlGetListPengasuh({String? search, int? page, int? limit}) {
    String urlGetListPengasuh = LinkApi.PENGASUHURL;
    // Map<String, dynamic> parameterQuery = parameterQueryHelper(
    //   search, page, 1000
    // );
    return _baseUrl + _apiVersion + urlGetListPengasuh;
    // return _baseUrl + _apiVersion + urlGetListPengasuh);
  }

  String urlGetPengasuhPosyandu({String? search, int? page, int? limit}) {
    String urlGetPengasuhPosyandu = LinkApi.PENGASUHPOSYANDUURL;
    // Map<String, dynamic> parameterQuery = parameterQueryHelper(
    //   search, page, 1000
    // );
    return _baseUrl + _apiVersion + urlGetPengasuhPosyandu;
    // return _baseUrl + _apiVersion + urlGetPengasuhPosyandu);
  }

  String urlGetDetailPengasuh(String id) {
    String urlGetDetailPengasuh = LinkApi.PENGASUHURL;
    return "$_baseUrl$_apiVersion$urlGetDetailPengasuh/$id";
  }

  String urlPatchDataPengasuh(String id) {
    String urlPatchDataPengasuh = LinkApi.PENGASUHURL;
    return "$_baseUrl$_apiVersion$urlPatchDataPengasuh/$id";
  }

  //!Alat Ukur Kader
  String urlGetListAlatUkurKader({String? search, int? page, int? limit}) {
    String urlGetListAlatUkurKader = LinkApi.ALATUKURKADERURL;
    // Map<String, dynamic> parameterQuery = parameterQueryHelper(
    //   search, page, 1000
    // );
    return _baseUrl + _apiVersion + urlGetListAlatUkurKader;
  }

  String urlPostDataAlatUkurKader() {
    String urlPostDataAlatUkurKader = LinkApi.ALATUKURKADERURL;
    return _baseUrl + _apiVersion + urlPostDataAlatUkurKader;
  }

  //! alat ukur kader deteksi dini
  String urlPostDataAlatUkurKaderDeteksiDini() {
    String urlPostDataAlatUkurKaderDeteksiDini = LinkApi.ALATUKURKADERURL;
    return "$_baseUrl$_apiVersion$urlPostDataAlatUkurKaderDeteksiDini/deteksi-dini";
  }

  String urlGetDetailAlatUkurKader(String id) {
    String urlGetDetailAlatUkurKader = LinkApi.ALATUKURKADERURL;
    return "$_baseUrl$_apiVersion$urlGetDetailAlatUkurKader/$id";
  }

  String urlPatchDataAlatUkurKader(String id) {
    String urlPatchDataAlatUkurKader = LinkApi.ALATUKURKADERURL;
    return "$_baseUrl$_apiVersion$urlPatchDataAlatUkurKader/$id";
  }

  String urlDeleteDataAlatUkurKader(String id) {
    String urlDeleteDataAlatUkurKader = LinkApi.ALATUKURKADERURL;
    return "$_baseUrl$_apiVersion$urlDeleteDataAlatUkurKader/$id";
  }

  // !Alat Ukur Admin
  String urlGetListAlatUkurAdmin({String? search, int? page, int? limit}) {
    String urlGetListAlatUkurAdmin = LinkApi.ALATUKURADMINURL;
    // Map<String, dynamic> parameterQuery = parameterQueryHelper(
    //   search, page, 1000
    // );
    return _baseUrl + _apiVersion + urlGetListAlatUkurAdmin;
  }

  //!Jadwal Posyandu
  String urlGetListJadwalPosyandu({String? search, int? page, int? limit}) {
    String urlGetListJadwalPosyandu = LinkApi.JADWALPOSYANDU;
    // Map<String, dynamic> parameterQuery = parameterQueryHelper(
    //   search, page, 1000
    // );
    return _baseUrl + _apiVersion + urlGetListJadwalPosyandu;
  }

  String urlPostDataJadwalPosyandu() {
    String urlPostDataJadwalPosyandu = LinkApi.JADWALPOSYANDU;
    return _baseUrl + _apiVersion + urlPostDataJadwalPosyandu;
  }

  String urlPatchDataJadwalPosyandu(String id) {
    String urlPatchDataJadwalPosyandu = LinkApi.JADWALPOSYANDU;
    return "$_baseUrl$_apiVersion$urlPatchDataJadwalPosyandu/$id";
  }

  String urlGetDetailJadwalPosyandu(String id) {
    String urlGetDetailJadwalPosyandu = LinkApi.JADWALPOSYANDU;
    return "$_baseUrl$_apiVersion$urlGetDetailJadwalPosyandu/$id";
  }

  String urlDeleteJadwalPosyandu(String id) {
    String urlDeleteJadwalPosyandu = LinkApi.JADWALPOSYANDU;
    return "$_baseUrl$_apiVersion$urlDeleteJadwalPosyandu/$id";
  }

  //!Kehadiran Posyandu
  String urlGetListKehadiranPosyandu({String? search, int? page, int? limit}) {
    String urlGetListKehadiranPosyandu = LinkApi.KEHADIRANPOSYANDUURL;
    // Map<String, dynamic> parameterQuery = parameterQueryHelper(
    //   search, page, 1000
    // );
    return _baseUrl + _apiVersion + urlGetListKehadiranPosyandu;
  }

  String urlPostDataKehadiranPosyandu() {
    String urlPostDataKehadiranPosyandu = LinkApi.KEHADIRANPOSYANDUURL;
    return _baseUrl + _apiVersion + urlPostDataKehadiranPosyandu;
  }

  String urlGetDetailKehadiranPosyandu(String id) {
    String urlGetDetailKehadiranPosyandu = LinkApi.KEHADIRANPOSYANDUURL;
    return "$_baseUrl$_apiVersion$urlGetDetailKehadiranPosyandu/$id";
  }

  String urlPatchDataKehadiranPosyandu(String id) {
    String urlPatchDataKehadiranPosyandu = LinkApi.KEHADIRANPOSYANDUURL;
    return "$_baseUrl$_apiVersion$urlPatchDataKehadiranPosyandu/$id";
  }

  String urlDeleteDataKehadiranPosyandu(String id) {
    String urlDeleteDataKehadiranPosyandu = LinkApi.KEHADIRANPOSYANDUURL;
    return "$_baseUrl$_apiVersion$urlDeleteDataKehadiranPosyandu/$id";
  }

  //!Pengukuran Anak
  String urlGetListPengukuranAnak({String? search, int? page, int? limit}) {
    String urlGetListPengukuranAnak = LinkApi.PENGUKURANANAKURL;
    // Map<String, dynamic> parameterQuery = parameterQueryHelper(
    //   search, page, 1000
    // );
    return _baseUrl + _apiVersion + urlGetListPengukuranAnak;
  }

  String urlPostDataPengukuranAnak() {
    String urlPostDataPengukuranAnak = LinkApi.PENGUKURANANAKURL;
    return _baseUrl + _apiVersion + urlPostDataPengukuranAnak;
  }

  String urlGetDetailPengukuranAnak(String id) {
    String urlGetDetailPengukuranAnak = LinkApi.PENGUKURANANAKURL;
    return "$_baseUrl$_apiVersion$urlGetDetailPengukuranAnak/$id";
  }

  String urlPatchDataPengukuranAnak(String id) {
    String urlPatchDataPengukuranAnak = LinkApi.PENGUKURANANAKURL;
    return "$_baseUrl$_apiVersion$urlPatchDataPengukuranAnak/$id";
  }

  String urlDeleteDataPengukuranAnak(String id) {
    String urlDeleteDataPengukuranAnak = LinkApi.PENGUKURANANAKURL;
    return "$_baseUrl$_apiVersion$urlDeleteDataPengukuranAnak/$id";
  }

  String urlGetListRiwayatPengukuranAnak() {
    String urlGetListDataRiwayatPengukuranAnak =
        LinkApi.RIWAYATPENGUKURANANAKURL;
    return _baseUrl + _apiVersion + urlGetListDataRiwayatPengukuranAnak;
  }

  String urlGetDetailRiwayatPengukuranAnak(String id) {
    String urlGetDetailDataRiwayatPengukuranAnak =
        LinkApi.RIWAYATPENGUKURANANAKURL;
    return "$_baseUrl$_apiVersion$urlGetDetailDataRiwayatPengukuranAnak/$id";
  }

  //!Pengukuran Ibu Hamil
  String urlGetListPengukuranIbuHamil({String? search, int? page, int? limit}) {
    String urlGetListPengukuranIbuHamil = LinkApi.PENGUKURANIBUHAMILURL;
    // Map<String, dynamic> parameterQuery = parameterQueryHelper(
    //   search, page, 1000
    // );
    return _baseUrl + _apiVersion + urlGetListPengukuranIbuHamil;
  }

  String urlPostDataPengukuranIbuHamil() {
    String urlPostDataPengukuranIbuHamil = LinkApi.PENGUKURANIBUHAMILURL;
    return _baseUrl + _apiVersion + urlPostDataPengukuranIbuHamil;
  }

  String urlGetDetailPengukuranIbuHamil(String id) {
    String urlGetDetailPengukuranIbuHamil = LinkApi.PENGUKURANIBUHAMILURL;
    return "$_baseUrl$_apiVersion$urlGetDetailPengukuranIbuHamil/$id";
  }

  String urlPatchDataPengukuranIbuHamil(String id) {
    String urlPatchDataPengukuranIbuHamil = LinkApi.PENGUKURANIBUHAMILURL;
    return "$_baseUrl$_apiVersion$urlPatchDataPengukuranIbuHamil/$id";
  }

  String urlDeleteDataPengukuranIbuHamil(String id) {
    String urlDeleteDataPengukuranIbuHamil = LinkApi.PENGUKURANIBUHAMILURL;
    return "$_baseUrl$_apiVersion$urlDeleteDataPengukuranIbuHamil/$id";
  }

  String urlGetListRiwayatPengukuranIbuHamil() {
    String urlGetListDataRiwayatPengukuranIbuHamil =
        LinkApi.RIWAYATPENGUKURANIBUHAMILURL;
    return _baseUrl + _apiVersion + urlGetListDataRiwayatPengukuranIbuHamil;
  }

  String urlGetDetailRiwayatPengukuranIbuHamil(String id) {
    String urlGetDetailDataRiwayatPengukuranIbuHamil =
        LinkApi.RIWAYATPENGUKURANIBUHAMILURL;
    return "$_baseUrl$_apiVersion$urlGetDetailDataRiwayatPengukuranIbuHamil/$id";
  }

  //! Master Data
  // provinsi
  String urlGetProvinsi({String? search, int? page, int? limit}) {
    String urlGetProvinsi = LinkApi.PROVINSIURL;
    // Map<String, dynamic> parameterQuery = parameterQueryHelper(
    //   search, page, 1000
    // );
    return _baseUrl + _apiVersion + urlGetProvinsi;
  }

  // kabupaten
  String urlGetKabupaten({String? search, int? page, int? limit}) {
    String urlGetKabupaten = LinkApi.KABUPATENURL;
    // Map<String, dynamic> parameterQuery = parameterQueryHelper(
    //   search, page, 1000
    // );
    return _baseUrl + _apiVersion + urlGetKabupaten;
  }

  // kecamatan
  String urlGetKecamatan({String? search, int? page, int? limit}) {
    String urlGetKecamatan = LinkApi.KECAMATANURL;
    // Map<String, dynamic> parameterQuery = parameterQueryHelper(
    //   search, page, 1000
    // );
    return _baseUrl + _apiVersion + urlGetKecamatan;
  }

  // desa kelurahan
  String urlGetDesaKelurahan({String? search, int? page, int? limit}) {
    String urlGetDesaKelurahan = LinkApi.DESAURL;
    // Map<String, dynamic> parameterQuery = parameterQueryHelper(
    //   search, page, 1000
    // );
    return _baseUrl + _apiVersion + urlGetDesaKelurahan;
  }

  // dusun
  String urlGetDusun({String? search, int? page, int? limit}) {
    String urlGetDusun = LinkApi.DUSUNURL;
    // Map<String, dynamic> parameterQuery = parameterQueryHelper(
    //   search, page, 1000
    // );
    return _baseUrl + _apiVersion + urlGetDusun;
  }

  // Jumlah Wilayah
  String urlGetJumlahWilayah({String? search, int? page, int? limit}) {
    String urlGetJumlahWilayah = LinkApi.JUMLAHWILAYAHURL;
    // Map<String, dynamic> parameterQuery = parameterQueryHelper(
    //   search, page, 1000
    // );
    return _baseUrl + _apiVersion + urlGetJumlahWilayah;
  }

  //!Beban Kerja
  String urlGetBebanKerjaItem() {
    String urlGetBebanKerjaKader = LinkApi.TUGASKADERURL;
    return _baseUrl + _apiVersion + urlGetBebanKerjaKader;
  }

  String urlGetListBebanKerja({String? search, int? page, int? limit}) {
    String urlGetListBebanKerja = LinkApi.PENILAIANMANDIRIURL;
    // Map<String, dynamic> parameterQuery = parameterQueryHelper(
    //   search, page, 1000
    // );
    return _baseUrl + _apiVersion + urlGetListBebanKerja;
  }

  String urlPostDataBebanKerja() {
    String urlPostDataBebanKerja = LinkApi.PENILAIANMANDIRIURL;
    return _baseUrl + _apiVersion + urlPostDataBebanKerja;
  }

  String urlGetDetailBebanKerja(String id) {
    String urlGetDetailBebanKerja = LinkApi.PENILAIANMANDIRIURL;
    return "$_baseUrl$_apiVersion$urlGetDetailBebanKerja/$id";
  }

  String urlDeleteDataBebanKerja(String id) {
    String urlDeleteDataBebanKerja = LinkApi.PENILAIANMANDIRIURL;
    return "$_baseUrl$_apiVersion$urlDeleteDataBebanKerja/$id";
  }

  //!Dashboard
  String urlGetDashboardKader() {
    String urlGetDashboardKader = LinkApi.DASHBOARDKADER;
    return _baseUrl + _apiVersion + urlGetDashboardKader;
  }

  //! monitoring
  //* index
  //? stunting
  String urlGetAllMonitoringAnakStunting() {
    String urlGetAllMonitoringAnakStunting = LinkApi.MONITORINGANAKSTUNTING;
    return _baseUrl + _apiVersion + urlGetAllMonitoringAnakStunting;
  }

  //? underWeight

  String urlGetAllMonitoringAnakUnderWeight() {
    String urlGetAllMonitoringAnakStunting = LinkApi.MONITORINGANAKUNDERWEIGHT;
    return _baseUrl + _apiVersion + urlGetAllMonitoringAnakStunting;
  }

  //? wasting
  String urlGetAllMonitoringAnakWasting() {
    String urlGetAllMonitoringAnakStunting = LinkApi.MONITORINGANAKWASTING;
    return _baseUrl + _apiVersion + urlGetAllMonitoringAnakStunting;
  }

  //
  String urlGetGenerateNIK() {
    String urlGetGenerateNIK = LinkApi.GENERATENIK;
    return _baseUrl + _apiVersion + urlGetGenerateNIK;
  }

  String urlGetGenerateKK() {
    String urlGetGenerateNIK = LinkApi.GENERATEKK;
    return _baseUrl + _apiVersion + urlGetGenerateNIK;
  }

  //! faktor resiko
  String urlGetFaktorResiko() {
    String urlGetFaktorResiko = LinkApi.FAKTORRESIKO;
    return _baseUrl + _apiVersion + urlGetFaktorResiko;
  }

  String urlPostFaktorResikoPertanyaann() {
    String urlGetFaktorResiko = LinkApi.FAKTORRESIKO;
    return _baseUrl + _apiVersion + urlGetFaktorResiko;
  }

  String urlGetFaktorResikoPertanyaan(String id) {
    String urlGetFaktorResiko = LinkApi.FAKTORRESIKOPERTANYAAN;
    return _baseUrl + _apiVersion + urlGetFaktorResiko + '/${id}';
  }

  String urlGetRiwayatFaktorResiko(String id) {
    String urlGetFaktorResiko = LinkApi.RIWAYATFAKTORRESIKO;
    return _baseUrl + _apiVersion + urlGetFaktorResiko + '/${id}';
  }

  String urlGetDetailRiwayatFaktorResiko(String id) {
    String urlGetFaktorResiko = LinkApi.RIWAYATFAKTORRESIKO;
    return _baseUrl + _apiVersion + urlGetFaktorResiko + '/${id}/detail';
  }

  //! tugas kunjungan
  String urlGetDataTugasKunjugan() {
    String urlGetDataTugasKunjugan = LinkApi.TUGASKUNJUNGANURL;
    return _baseUrl + _apiVersion + urlGetDataTugasKunjugan;
  }

  //! file upload
  String urlPostDataFileUpload() {
    String urlPostDataFileUpload = LinkApi.FILEUPLOADURL;
    return _baseUrl + _apiVersion + urlPostDataFileUpload;
  }

  //! kunjungan
  String urlGetListKunjungan() {
    String urlGetListKunjungan = LinkApi.KUNJUNGANURL;
    return _baseUrl + _apiVersion + urlGetListKunjungan;
  }

  String urlPostKunjungan() {
    String urlPostKunjungan = LinkApi.KUNJUNGANURL;
    return _baseUrl + _apiVersion + urlPostKunjungan;
  }

  String urlGetDataAnakStuntingKunjungan() {
    String urlGetDataAnakStuntingKunjungan = LinkApi.KUNJUNGANURL;
    return "$_baseUrl$_apiVersion$urlGetDataAnakStuntingKunjungan/anak-stunting";
  }

  String urlGetDataAnakTidakHadirKunjungan() {
    String urlGetDataAnakTidakHadirKunjungan = LinkApi.KUNJUNGANURL;
    return "$_baseUrl$_apiVersion$urlGetDataAnakTidakHadirKunjungan/anak-tidak-hadir";
  }

  String urlGetDataIbuHamilKunjungan() {
    String urlGetDataIbuHamilKunjungan = LinkApi.KUNJUNGANURL;
    return "$_baseUrl$_apiVersion$urlGetDataIbuHamilKunjungan/ibu-hamil-tidak-hadir";
  }

  String urlGetGrafikKunjunganKader() {
    String urlGetGrafikKunjungan = LinkApi.KUNJUNGANURL;
    return "$_baseUrl$_apiVersion$urlGetGrafikKunjungan/grafik-kunjungan";
  }

  String urlGetGrafikKunjunganKetuaKader() {
    String urlGetGrafikKunjungan = LinkApi.KUNJUNGANURL;
    return "$_baseUrl$_apiVersion$urlGetGrafikKunjungan/ketua-kader-count";
  }

  String urlGetDetailKunjunganAnak(String id) {
    String urlGetDetailKunjunganAnak = LinkApi.KUNJUNGANURL;
    return "$_baseUrl$_apiVersion$urlGetDetailKunjunganAnak/$id/anak";
  }

  String urlGetDetailKunjunganIbuHamil(String id) {
    String urlGetDetailKunjunganIbuHamil = LinkApi.KUNJUNGANURL;
    return "$_baseUrl$_apiVersion$urlGetDetailKunjunganIbuHamil/$id/ibu-hamil";
  }

  String urlPostTugasBuktiKunjungan() {
    String urlPostTugasBuktiKunjungan = LinkApi.TUGASBUKTIKUNJUNGANURL;
    return "$_baseUrl$_apiVersion$urlPostTugasBuktiKunjungan";
  }

  String urlPatchDataKunjungan(String id) {
    String urlPatchDataKunjungan = LinkApi.KUNJUNGANURL;
    return "$_baseUrl$_apiVersion$urlPatchDataKunjungan/$id";
  }

  String urlDeleteDataKunjungan(String id) {
    String urlDeleteDataKunjungan = LinkApi.KUNJUNGANURL;
    return "$_baseUrl$_apiVersion$urlDeleteDataKunjungan/$id";
  }

  //! download E-PPGBM
  String urlDonwloadEPPGBM() {
    String urlDonwloadEPPGBM = LinkApi.DOWNLOADEPPGBM;
    return _baseUrl + _apiVersion + urlDonwloadEPPGBM;
  }

  String urlDownloadLogActivity() {
    String urlDonwloadLogActivity = LinkApi.LOGAKTIVITAS;
    debugPrint('$_baseUrl$_apiVersion$urlDonwloadLogActivity');
    return _baseUrl + _apiVersion + urlDonwloadLogActivity;
  }

  // ! storage
  String urlGetImageFromStorage(String path) {
    String urlGetStorage = LinkApi.STORAGEURL;
    return "$_baseUrl$urlGetStorage/$path";
  }

  String urlGetPublicImage(String path) {
    return '$_baseUrl/storage/public/$path';
  }

  //! parameter gizi
  //! laki laki tinggi badan
  String urlGetParameterGiziLakiLakiTinggiBadan() {
    String urlGetParameterGiziLakiLakiTinggiBadan =
        "/storage/public/antropometri/Length-for-Age-lhfa-boys-zscore-expanded-tables.xlsx";
    return "$_baseUrl$urlGetParameterGiziLakiLakiTinggiBadan";
  }

  //! laki laki berat badan
  String urlGetParameterGiziLakiLakiBeratBadan() {
    String urlGetParameterGiziLakiLakiBeratBadan =
        "/storage/public/antropometri/Weight-for-Age-wfa-boys-zscore-expanded-tables.xlsx";
    return "$_baseUrl$urlGetParameterGiziLakiLakiBeratBadan";
  }

  //! perempuan tinggi badan
  String urlGetParameterGiziPerempuanTinggiBadan() {
    String urlGetParameterGiziPerempuanTinggiBadan =
        "/storage/public/antropometri/Length-for-Age-lhfa-girls-zscore-expanded-tables.xlsx";
    return "$_baseUrl$urlGetParameterGiziPerempuanTinggiBadan";
  }

  //! perempuan berat badan
  String urlGetParameterGiziPerempuanBeratBadan() {
    String urlGetParameterGiziPerempuanBeratBadan =
        "/storage/public/antropometri/Weight-for-Age-wfa-girls-zscore-expanded-tables.xlsx";
    return "$_baseUrl$urlGetParameterGiziPerempuanBeratBadan";
  }

  //! grafik KMS
  String urlGetGrafikKMS(String id) {
    String urlGetGrafikKms = LinkApi.GRAFIKKMSURL;
    return "$_baseUrl$urlGetGrafikKms/$id";
  }

  //!Pengukuran Tamu
  String urlGetListPosyandu({String? search, int? page, int? limit}) {
    String urlGetListPosyandu = LinkApi.LISTPOSYANDUURL;
    return _baseUrl + _apiVersion + urlGetListPosyandu;
  }

  String urlGetListAnakByPosyandu(
      {String? search, int? page, int? limit, required String id}) {
    String urlGetListAnakByPosyandu = LinkApi.GETANAKBYPOSYANDUURL;
    return "$_baseUrl$_apiVersion$urlGetListAnakByPosyandu/$id";
  }

  String urlGetListAnakTamuByPosyandu(
      {String? search, int? page, int? limit, required String id}) {
    String urlGetListAnakTamuByPosyandu = LinkApi.GETANAKTAMUBYPOSYANDUURL;
    return "$_baseUrl$_apiVersion$urlGetListAnakTamuByPosyandu/$id";
  }

  String urlGetListPengukuranTamu({String? search, int? page, int? limit}) {
    String urlGetListPengukuranTamu = LinkApi.PENGUKURANTAMUURL;
    return _baseUrl + _apiVersion + urlGetListPengukuranTamu;
  }

  String urlPostDataPengukuranTamu() {
    String urlGetListPengukuranTamu = LinkApi.PENGUKURANTAMUURL;
    return _baseUrl + _apiVersion + urlGetListPengukuranTamu;
  }

  String urlGetDetailPengukuranTamu(String id) {
    String urlGetListPengukuranTamu = LinkApi.PENGUKURANTAMUURL;
    return "$_baseUrl$_apiVersion$urlGetListPengukuranTamu/$id";
  }

  String urlPatchDataPengukuranTamu(String id) {
    String urlGetListPengukuranTamu = LinkApi.PENGUKURANTAMUURL;
    return "$_baseUrl$_apiVersion$urlGetListPengukuranTamu/$id";
  }

  String urlDeleteDataPengukuranTamu(String id) {
    String urlGetListPengukuranTamu = LinkApi.PENGUKURANTAMUURL;
    return "$_baseUrl$_apiVersion$urlGetListPengukuranTamu/$id";
  }

  String urlGetPoint() {
    String urlGetTotalPoint = LinkApi.TOTALPOINT;
    return '$_baseUrl$_apiVersion$urlGetTotalPoint';
  }

  //! notification
  String urlGetNotification() {
    String urlGetNotification = LinkApi.NOTIFICATIONURL;
    return '$_baseUrl$_apiVersion$urlGetNotification';
  }

  //! kunjungan count
  String urlGetTotalKunjungan() {
    String urlGetTotalKunjungan = LinkApi.TOTALKUNJUNGANURL;
    return '$_baseUrl$_apiVersion$urlGetTotalKunjungan';
  }
}
