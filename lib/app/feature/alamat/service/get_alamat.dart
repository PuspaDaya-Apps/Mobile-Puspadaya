import '../../../../utils/api_utils/api_utils.dart';
import '../../../../utils/logger/logger.dart';
import '../../../../utils/network_utils/network_utils.dart';

class GetAlamat{
  // provinsi
  Future<List<dynamic>> getProvinsi(String token) async {
    final String url = ApiUtils().urlGetProvinsi();
    final Map<String, dynamic> parameterQuery = {};

    try {
      final response = await NetworkUtils(token: token).get(url, parameterQuery);
      logger.d(response.toString());
      return response;
    } catch (e) {
      logger.e("Error fetching data: $e");
      return [];
    }
  }

  // kabupaten
  Future<List<dynamic>> getKabupaten(String token) async {
    final String url = ApiUtils().urlGetKabupaten();
    final Map<String, dynamic> parameterQuery = {};

    try {
      final response = await NetworkUtils(token: token).get(url, parameterQuery);
      logger.d(response.toString());
      return response;
    } catch (e) {
      logger.e("Error fetching data: $e");
      return [];
    }
  }

  // kecamatan
  Future<List<dynamic>> getKecamatan(String token) async {
    final String url = ApiUtils().urlGetKecamatan();
    final Map<String, dynamic> parameterQuery = {};

    try {
      final response = await NetworkUtils(token: token).get(url, parameterQuery);
      logger.d(response.toString());
      return response;
    } catch (e) {
      logger.e("Error fetching data: $e");
      return [];
    }
  }

  // desaKelurahan
  Future<List<dynamic>> getDesaKelurahan(String token) async {
    final String url = ApiUtils().urlGetDesaKelurahan();
    final Map<String, dynamic> parameterQuery = {};

    try {
      final response = await NetworkUtils(token: token).get(url, parameterQuery);
      logger.d(response.toString());
      return response;
    } catch (e) {
      logger.e("Error fetching data: $e");
      return [];
    }
  }

  // dusun
  Future<List<dynamic>> getDusun(String token) async {
    final String url = ApiUtils().urlGetDusun();
    final Map<String, dynamic> parameterQuery = {};

    try {
      final response = await NetworkUtils(token: token).get(url, parameterQuery);
      logger.d(response.toString());
      return response;
    } catch (e) {
      logger.e("Error fetching data: $e");
      return [];
    }
  }
}