import '../../../../utils/api_utils/api_utils.dart';
import '../../../../utils/network_utils/network_utils.dart';

class GetAlamatApi{
  // provinsi
  Future<List<dynamic>> getProvinsi(String token, int jumlah) async {
    final String url = ApiUtils().urlGetProvinsi();
    final Map<String, dynamic> parameterQuery = {
      'limit': jumlah.toString()
    };

    return await NetworkUtils(token: token).get(url, parameterQuery).then((response) {
      return response;
    });
  }

  // kabupaten
  Future<List<dynamic>> getKabupaten(String token, int jumlah) async {
    final String url = ApiUtils().urlGetKabupaten();
    final Map<String, dynamic> parameterQuery = {
      'limit': jumlah.toString()
    };

    return await NetworkUtils(token: token).get(url, parameterQuery).then((response) {
      return response;
    });
  }

  // kecamatan
  Future<List<dynamic>> getKecamatan(String token, int jumlah) async {
    final String url = ApiUtils().urlGetKecamatan();
    final Map<String, dynamic> parameterQuery = {
      'limit': jumlah.toString()
    };

    return await NetworkUtils(token: token).get(url, parameterQuery).then((response) {
      return response;
    });
  }

  // desaKelurahan
  Future<List<dynamic>> getDesaKelurahan(String token, int jumlah) async {
    final String url = ApiUtils().urlGetDesaKelurahan();
    final Map<String, dynamic> parameterQuery = {
      'limit': jumlah.toString()
    };

    return await NetworkUtils(token: token).get(url, parameterQuery).then((response) {
      return response;
    });
  }

  // dusun
  Future<List<dynamic>> getDusun(String token, int jumlah) async {
    final String url = ApiUtils().urlGetDusun();
    final Map<String, dynamic> parameterQuery = {
      'limit': jumlah.toString()
    };

    return await NetworkUtils(token: token).get(url, parameterQuery).then((response) {
      return response;
    });
  }

  // jumlah wilayah
  Future<List<dynamic>> getJumlahWilayah(String token) async {
    final String url = ApiUtils().urlGetJumlahWilayah();
    final Map<String, dynamic> parameterQuery = {};

    return await NetworkUtils(token: token).get(url, parameterQuery).then((response) {
      return response;
    });
  }
}