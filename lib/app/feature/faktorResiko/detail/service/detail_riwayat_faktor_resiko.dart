import '../../../../../utils/api_utils/api_utils.dart';
import '../../../../../utils/logger/logger.dart';
import '../../../../../utils/network_utils/network_utils.dart';

class DetailRiwayatFaktorResiko {
  Future<dynamic> getRiwayatFaktorResikoByBalita(
      String token, String id) async {
    final String link = ApiUtils().urlGetDetailRiwayatFaktorResiko(id);
    final Map<String, dynamic> parameterQuery = {};

    return await NetworkUtils(token: token)
        .get(link, parameterQuery)
        .then((response) {
      logger.d(response.toString());
      return response;
    });
  }
}
