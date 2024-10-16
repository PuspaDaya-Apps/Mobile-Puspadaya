part 'api_name.dart';

class ApiUtils {
  final String _baseUrl = "https://Example.com";
  final String _baseUrlQuaryParameter = "Example.com";
  final String _apiVersion = "/mobile/api/v1";

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
}