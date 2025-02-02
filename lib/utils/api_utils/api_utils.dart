part 'api_name.dart';

class ApiUtils {
  //!Base URL
  final String _baseUrl =
      "http://now4kswkgo4owoks884o0wc0.103.109.210.102.sslip.io";
  final String _baseUrlQuaryParameter =
      "now4kswkgo4owoks884o0wc0.103.109.210.102.sslip.io";
  final String _apiVersion = "/api/v1";

  //!Header
  Map<String, String> header() =>
      {'Content-Type': 'application/json', 'Accept': 'application/json'};

  Map<String, String> headerWithToken(String token) => {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      };

  Map<String, String> headerTokenForMultipart(String token) => {
        'Authorization': 'Bearer $token',
        'Content-Type': 'multipart/form-data',
      };

  //!Auth
  Uri urlLogin() {
    String urlLogin = LinkApi.LOGINURL;
    return Uri.parse(_baseUrl + _apiVersion + urlLogin);
  }

  Uri urlRefreshToken() {
    String urlRefreshToken = LinkApi.REFRESHTOKENURL;
    return Uri.parse(_baseUrl + _apiVersion + urlRefreshToken);
  }

  Uri urlLogout() {
    String urlLogout = LinkApi.LOGOUTURL;
    return Uri.parse(_baseUrl + _apiVersion + urlLogout);
  }

  Uri urlForgotPassword() {
    String urlForgotPassword = LinkApi.FORGOTPASSWORDURL;
    return Uri.parse(_baseUrl + _apiVersion + urlForgotPassword);
  }

  Uri urlResetPassword() {
    String urlResetPassword = LinkApi.RESETPASSWORDURL;
    return Uri.parse(_baseUrl + _apiVersion + urlResetPassword);
  }

  Uri urlVerifyOTP() {
    String urlVerifyOTP = LinkApi.VERIFYOTPURL;
    return Uri.parse(_baseUrl + _apiVersion + urlVerifyOTP);
  }

  Uri urlChangePassword() {
    String urlChangePassword = LinkApi.CHANGEPASSWORDURL;
    return Uri.parse(_baseUrl + _apiVersion + urlChangePassword);
  }

  //!User
  Uri urlCurrentUser() {
    String urlCurrentUser = LinkApi.CURRENTUSRURL;
    return Uri.parse(_baseUrl + _apiVersion + urlCurrentUser);
  }

  //!Orang Tua
  Uri urGetListOrangTua() {
    String urlGetListOrangTua = LinkApi.ORANGTUAURL;
    return Uri.parse(_baseUrl + _apiVersion + urlGetListOrangTua);
  }

  Uri urlPostDataOrangTua() {
    String urlPostDataOrangTua = LinkApi.ORANGTUAURL;
    return Uri.parse(_baseUrl + _apiVersion + urlPostDataOrangTua);
  }

  Uri urlPatchDataOrangTua() {
    String urlPatchDataOrangTua = LinkApi.ORANGTUAURL;
    return Uri.parse(_baseUrl + _apiVersion + urlPatchDataOrangTua);
  }

  Uri urlGetDetailOrangTua(String idAyah, String idIbu) {
    String urlGetDetailOrangTua = LinkApi.DETAILORANGTUAURL;
    Map<String, String> parameterQuery = {
      'ibu_id': idIbu,
      'ayah_id': idAyah,
    };
    return Uri.http(
      _baseUrlQuaryParameter,
      _apiVersion + urlGetDetailOrangTua,
      parameterQuery,
    );
  }

  //!Anak
  Uri urlGetListAnak() {
    String urlGetListAnak = LinkApi.ANAKURL;
    return Uri.parse(_baseUrl + _apiVersion + urlGetListAnak);
  }

  Uri urlPostDataAnak() {
    String urlPostDataAnak = LinkApi.ANAKURL;
    return Uri.parse(_baseUrl + _apiVersion + urlPostDataAnak);
  }

  Uri urlGetAnakPosyandu() {
    String urlGetAnakPosyandu = LinkApi.ANAKPOSYANDUURL;
    return Uri.parse(_baseUrl + _apiVersion + urlGetAnakPosyandu);
  }

  Uri urlGetDetailAnak(String id) {
    String urlGetDetailAnak = LinkApi.ANAKURL;
    return Uri.parse("$_baseUrl$_apiVersion$urlGetDetailAnak/$id");
  }

  Uri urlPatchDataAnak(String id) {
    String urlPatchDataAnak = LinkApi.ANAKURL;
    return Uri.parse("$_baseUrl$_apiVersion$urlPatchDataAnak/$id");
  }

  Uri urlDeleteDataAnak(String id) {
    String urlDeleteDataAnak = LinkApi.ANAKURL;
    return Uri.parse("$_baseUrl$_apiVersion$urlDeleteDataAnak/$id");
  }

  //!Ibu Hamil
  Uri urlGetListIbuHamil() {
    String urlGetListIbuHamil = LinkApi.IBUHAMILURL;
    return Uri.parse(_baseUrl + _apiVersion + urlGetListIbuHamil);
  }

  Uri urlPostDataIbuHamil() {
    String urlPostDataIbuHamil = LinkApi.IBUHAMILURL;
    return Uri.parse(_baseUrl + _apiVersion + urlPostDataIbuHamil);
  }

  Uri urlGetDetailIbuHamil(String id) {
    String urlGetDetailIbuHamil = LinkApi.IBUHAMILURL;
    return Uri.parse("$_baseUrl$_apiVersion$urlGetDetailIbuHamil/$id");
  }

  Uri urlPatchDataIbuHamil(String id) {
    String urlPatchDataIbuHamil = LinkApi.IBUHAMILURL;
    return Uri.parse("$_baseUrl$_apiVersion$urlPatchDataIbuHamil/$id");
  }

  //!Pengasuh
  Uri urlGetListPengasuh() {
    String urlGetListIbuHamil = LinkApi.IBUHAMILURL;
    return Uri.parse(_baseUrl + _apiVersion + urlGetListIbuHamil);
  }

  Uri urlGetPengasuhPosyandu() {
    String urlGetPengasuhPosyandu = LinkApi.PENGASUHPOSYANDUURL;
    return Uri.parse(_baseUrl + _apiVersion + urlGetPengasuhPosyandu);
  }

  Uri urlGetDetailPengasuh(String id) {
    String urlGetDetailPengasuh = LinkApi.PENGASUHURL;
    return Uri.parse("$_baseUrl$_apiVersion$urlGetDetailPengasuh/$id");
  }

  Uri urlPatchDataPengasuh(String id) {
    String urlPatchDataPengasuh = LinkApi.PENGASUHURL;
    return Uri.parse("$_baseUrl$_apiVersion$urlPatchDataPengasuh/$id");
  }

  //!Alat Ukur Kader
  Uri urlGetListAlatUkurKader() {
    String urlGetListAlatUkurKader = LinkApi.ALATUKURKADERURL;
    return Uri.parse(_baseUrl + _apiVersion + urlGetListAlatUkurKader);
  }

  Uri urlPostDataAlatUkurKader() {
    String urlPostDataAlatUkurKader = LinkApi.ALATUKURKADERURL;
    return Uri.parse(_baseUrl + _apiVersion + urlPostDataAlatUkurKader);
  }

  Uri urlGetDetailAlatUkurKader(String id) {
    String urlGetDetailAlatUkurKader = LinkApi.ALATUKURKADERURL;
    return Uri.parse("$_baseUrl$_apiVersion$urlGetDetailAlatUkurKader/$id");
  }

  Uri urlPatchDataAlatUkurKader(String id) {
    String urlPatchDataAlatUkurKader = LinkApi.ALATUKURKADERURL;
    return Uri.parse("$_baseUrl$_apiVersion$urlPatchDataAlatUkurKader/$id");
  }

  Uri urlDeleteDataAlatUkurKader(String id) {
    String urlDeleteDataAlatUkurKader = LinkApi.ALATUKURKADERURL;
    return Uri.parse("$_baseUrl$_apiVersion$urlDeleteDataAlatUkurKader/$id");
  }

  //!Jadwal Posyandu
  Uri urlGetListJadwalPosyandu() {
    String urlGetListJadwalPosyandu = LinkApi.JADWALPOSYANDU;
    return Uri.parse(_baseUrl + _apiVersion + urlGetListJadwalPosyandu);
  }

  Uri urlPostDataJadwalPosyandu() {
    String urlPostDataJadwalPosyandu = LinkApi.JADWALPOSYANDU;
    return Uri.parse(_baseUrl + _apiVersion + urlPostDataJadwalPosyandu);
  }

  Uri urlPatchDataJadwalPosyandu(String id) {
    String urlPatchDataJadwalPosyandu = LinkApi.JADWALPOSYANDU;
    return Uri.parse("$_baseUrl$_apiVersion$urlPatchDataJadwalPosyandu/$id");
  }

  Uri urlGetDetailJadwalPosyandu(String id) {
    String urlGetDetailJadwalPosyandu = LinkApi.JADWALPOSYANDU;
    return Uri.parse("$_baseUrl$_apiVersion$urlGetDetailJadwalPosyandu/$id");
  }

  //!Kehadiran Posyandu
  Uri urlGetListKehadiranPosyandu() {
    String urlGetListKehadiranPosyandu = LinkApi.KEHADIRANPOSYANDUURL;
    return Uri.parse(_baseUrl + _apiVersion + urlGetListKehadiranPosyandu);
  }

  Uri urlPostDataKehadiranPosyandu() {
    String urlPostDataKehadiranPosyandu = LinkApi.KEHADIRANPOSYANDUURL;
    return Uri.parse(_baseUrl + _apiVersion + urlPostDataKehadiranPosyandu);
  }

  Uri urlGetDetailKehadiranPosyandu(String id) {
    String urlGetDetailKehadiranPosyandu = LinkApi.KEHADIRANPOSYANDUURL;
    return Uri.parse("$_baseUrl$_apiVersion$urlGetDetailKehadiranPosyandu/$id");
  }

  Uri urlPatchDataKehadiranPosyandu(String id) {
    String urlPatchDataKehadiranPosyandu = LinkApi.KEHADIRANPOSYANDUURL;
    return Uri.parse("$_baseUrl$_apiVersion$urlPatchDataKehadiranPosyandu/$id");
  }

  Uri urlDeleteDataKehadiranPosyandu(String id) {
    String urlDeleteDataKehadiranPosyandu = LinkApi.KEHADIRANPOSYANDUURL;
    return Uri.parse(
        "$_baseUrl$_apiVersion$urlDeleteDataKehadiranPosyandu/$id");
  }

  //!Pengukuran Anak
  Uri urlGetListPengukuranAnak() {
    String urlGetListPengukuranAnak = LinkApi.PENGUKURANANAKURL;
    return Uri.parse(_baseUrl + _apiVersion + urlGetListPengukuranAnak);
  }

  Uri urlPostDataPengukuranAnak() {
    String urlPostDataPengukuranAnak = LinkApi.PENGUKURANANAKURL;
    return Uri.parse(_baseUrl + _apiVersion + urlPostDataPengukuranAnak);
  }

  Uri urlGetDetailPengukuranAnak(String id) {
    String urlGetDetailPengukuranAnak = LinkApi.PENGUKURANANAKURL;
    return Uri.parse("$_baseUrl$_apiVersion$urlGetDetailPengukuranAnak/$id");
  }

  Uri urlPatchDataPengukuranAnak(String id) {
    String urlPatchDataPengukuranAnak = LinkApi.PENGUKURANANAKURL;
    return Uri.parse("$_baseUrl$_apiVersion$urlPatchDataPengukuranAnak/$id");
  }

  Uri urlDeleteDataPengukuranAnak(String id) {
    String urlDeleteDataPengukuranAnak = LinkApi.PENGUKURANANAKURL;
    return Uri.parse("$_baseUrl$_apiVersion$urlDeleteDataPengukuranAnak/$id");
  }

  //!Pengukuran Ibu Hamil
  Uri urlGetListPengukuranIbuHamil() {
    String urlGetListPengukuranIbuHamil = LinkApi.PENGUKURANIBUHAMILURL;
    return Uri.parse(_baseUrl + _apiVersion + urlGetListPengukuranIbuHamil);
  }

  Uri urlPostDataPengukuranIbuHamil() {
    String urlPostDataPengukuranIbuHamil = LinkApi.PENGUKURANIBUHAMILURL;
    return Uri.parse(_baseUrl + _apiVersion + urlPostDataPengukuranIbuHamil);
  }

  Uri urlGetDetailPengukuranIbuHamil(String id) {
    String urlGetDetailPengukuranIbuHamil = LinkApi.PENGUKURANIBUHAMILURL;
    return Uri.parse(
        "$_baseUrl$_apiVersion$urlGetDetailPengukuranIbuHamil/$id");
  }

  Uri urlPatchDataPengukuranIbuHamil(String id) {
    String urlPatchDataPengukuranIbuHamil = LinkApi.PENGUKURANIBUHAMILURL;
    return Uri.parse(
        "$_baseUrl$_apiVersion$urlPatchDataPengukuranIbuHamil/$id");
  }

  Uri urlDeleteDataPengukuranIbuHamil(String id) {
    String urlDeleteDataPengukuranIbuHamil = LinkApi.PENGUKURANIBUHAMILURL;
    return Uri.parse(
        "$_baseUrl$_apiVersion$urlDeleteDataPengukuranIbuHamil/$id");
  }
}
