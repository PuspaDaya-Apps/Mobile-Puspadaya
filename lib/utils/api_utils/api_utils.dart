part 'api_name.dart';

class ApiUtils {
  final String _baseUrl = "http://now4kswkgo4owoks884o0wc0.103.109.210.102.sslip.io";
  final String _baseUrlQuaryParameter = "now4kswkgo4owoks884o0wc0.103.109.210.102.sslip.io";
  final String _apiVersion = "/api/v1";

  Map<String, String> header() => {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  };

  Map<String, String> headerWithToken(String token) => {
    'Authorization': 'Bearer $token',
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  };

  Map<String, String> headerTokenForMultipart(String token) => {
    'Authorization': 'Bearer $token',
    'Content-Type': 'multipart/form-data',
  };

  Uri urlLogin(){
    String urlLogin = LinkApi.LOGINURL;
    return Uri.parse(_baseUrl + _apiVersion + urlLogin);
  }

  Uri urlRefreshToken(){
    String urlRefreshToken = LinkApi.REFRESHTOKENURL;
    return Uri.parse(_baseUrl + _apiVersion + urlRefreshToken);
  }

  Uri urlLogout(){
    String urlLogout = LinkApi.LOGOUTURL;
    return Uri.parse(_baseUrl + _apiVersion + urlLogout);
  }
}