import '../../../../../utils/api_utils/api_utils.dart';
import '../../../../../utils/logger/logger.dart';
import '../../../../../utils/network_utils/network_utils.dart';

class GetIndexAnak {
  // !stunting
  Future<List<dynamic>> getAllIndexAnakStunting(String token) async {
    final String link = ApiUtils().urlGetAllMonitoringAnakStunting();
    final Map<String, dynamic> parameterQuery = {};

    return await NetworkUtils(token: token)
        .get(link, parameterQuery)
        .then((response) {
      logger.d(response.toString());
      return response;
    });
  }

  //! underWeight
  Future<List<dynamic>> getAllIndexAnakUnderWeight(String token) async {
    final String link = ApiUtils().urlGetAllMonitoringAnakUnderWeight();
    final Map<String, dynamic> parameterQuery = {};

    return await NetworkUtils(token: token)
        .get(link, parameterQuery)
        .then((response) {
      logger.d(response.toString());
      return response;
    });
  }

  //! wasting
  Future<List<dynamic>> getAllIndexAnakWasting(String token) async {
    final String link = ApiUtils().urlGetAllMonitoringAnakWasting();
    final Map<String, dynamic> parameterQuery = {};

    return await NetworkUtils(token: token)
        .get(link, parameterQuery)
        .then((response) {
      logger.d(response.toString());
      return response;
    });
  }
}
