import '../../../../../utils/api_utils/api_utils.dart';
import '../../../../../utils/logger/logger.dart';
import '../../../../../utils/network_utils/network_utils.dart';
import '../model/get_all_posyandu_model.dart';

class PosyanduService {
  Future<dynamic> getAllPosyandu(String token) async {
    final String link = ApiUtils().urlGetPosyandu();
    final Map<String, dynamic> parameterQuery = {
      'limit': 5000
    };
    logger.d('uri $link}');

    return await NetworkUtils(token: token)
        .get(link, parameterQuery)
        .then((response) {
      logger.d(response.toString());
      return response;
    });
  }

  Future<int?> getTotalItemPosyandu(String token) async {
    final String link = ApiUtils().urlGetAnakPosyandu();
    final Map<String, dynamic> parameterQuery = {
      'limit': 5000
    };

    logger.d('URI: $link');

    try {
      final response =
          await NetworkUtils(token: token).get(link, parameterQuery);
      logger.d('Response: $response');

      // Parsing response ke model
      GetAllPosyandu dataAnak =
          GetAllPosyandu.fromJson(response[1]);

      // Mengembalikan total jumlah anak
      return dataAnak.meta
          .totalItems; // Pastikan 'total' adalah atribut yang benar dalam model
    } catch (e) {
      logger.e('Error fetching data: $e');
      return 0; // Mengembalikan 0 jika terjadi error
    }
  }
}