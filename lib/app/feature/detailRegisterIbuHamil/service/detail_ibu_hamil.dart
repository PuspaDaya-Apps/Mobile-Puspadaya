import '../../../../utils/api_utils/api_utils.dart';
import '../../../../utils/logger/logger.dart';
import '../../../../utils/network_utils/network_utils.dart';

class DetailIbuHamil {
  Future<List<dynamic>> getDetailIbuHamil(String token, String id) async {
    final String link = ApiUtils().urlGetDetailIbuHamil(id);
    final Map<String, dynamic> parameterQuery = {};

    return await NetworkUtils(token: token)
        .get(link, parameterQuery)
        .then((response) {
      logger.d(response.toString());
      return response;
    });
  }
}
