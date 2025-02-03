import '../../../../utils/api_utils/api_utils.dart';
import '../../../../utils/logger/logger.dart';
import '../../../../utils/network_utils/network_utils.dart';

class GetAlamat{
  // provinsi
  Future<List<dynamic>> getProvinsi(String token) async {
    final Map<String, String> header = ApiUtils().headerWithToken(token);
    final Uri url = ApiUtils().urlGetProvinsi();

    try {
      final response = await NetworkUtils().get(url, header);
      logger.d(response.toString());
      return response;
    } catch (e) {
      logger.e("Error fetching data: $e");
      return [];
    }
  }

  // kabupaten
  Future<List<dynamic>> getKabupaten(String token) async {
    final Map<String, String> header = ApiUtils().headerWithToken(token);
    final Uri url = ApiUtils().urlGetKabupaten();

    try {
      final response = await NetworkUtils().get(url, header);
      logger.d(response.toString());
      return response;
    } catch (e) {
      logger.e("Error fetching data: $e");
      return [];
    }
  }

  // kecamatan
  Future<List<dynamic>> getKecamatan(String token) async {
    final Map<String, String> header = ApiUtils().headerWithToken(token);
    final Uri url = ApiUtils().urlGetKecamatan();

    try {
      final response = await NetworkUtils().get(url, header);
      logger.d(response.toString());
      return response;
    } catch (e) {
      logger.e("Error fetching data: $e");
      return [];
    }
  }

  // desaKelurahan
  Future<List<dynamic>> getDesaKelurahan(String token) async {
    final Map<String, String> header = ApiUtils().headerWithToken(token);
    final Uri url = ApiUtils().urlGetDesaKelurahan();

    try {
      final response = await NetworkUtils().get(url, header);
      logger.d(response.toString());
      return response;
    } catch (e) {
      logger.e("Error fetching data: $e");
      return [];
    }
  }

  // dusun
  Future<List<dynamic>> getDusun(String token) async {
    final Map<String, String> header = ApiUtils().headerWithToken(token);
    final Uri url = ApiUtils().urlGetDusun();

    try {
      final response = await NetworkUtils().get(url, header);
      logger.d(response.toString());
      return response;
    } catch (e) {
      logger.e("Error fetching data: $e");
      return [];
    }
  }
}