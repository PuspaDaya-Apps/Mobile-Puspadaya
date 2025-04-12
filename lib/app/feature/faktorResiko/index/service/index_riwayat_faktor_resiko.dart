import '../../../../../utils/api_utils/api_utils.dart';
import '../../../../../utils/logger/logger.dart';
import '../../../../../utils/network_utils/network_utils.dart';

class IndexRiwayatFaktorResiko {
  Future<List<dynamic>> getAllRiwayatFaktorResiko(
      String token, String id) async {
    final String link = ApiUtils().urlGetRiwayatFaktorResiko(id);
    final Map<String, dynamic> parameterQuery = {
      'limit': 5000
    };

    return await NetworkUtils(token: token)
        .get(link, parameterQuery)
        .then((response) {
      logger.d(response.toString());
      return response;
    });
  }
}
