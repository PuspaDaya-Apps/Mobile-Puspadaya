import '../../../../../utils/api_utils/api_utils.dart';
import '../../../../../utils/logger/logger.dart';
import '../../../../../utils/network_utils/network_utils.dart';

class GetIndexIbuHamil {
  Future<List<dynamic>> getAllIndexIbuHamil(String token) async {
    final String link = ApiUtils().urlGetListIbuHamil();
    final Map<String, dynamic> parameterQuery = {};

    return await NetworkUtils(token: token)
        .get(link, parameterQuery)
        .then((response) {
      logger.d(response.toString());
      return response;
    });
  }
}
