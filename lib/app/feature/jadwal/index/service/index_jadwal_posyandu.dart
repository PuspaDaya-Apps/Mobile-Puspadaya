import 'dart:convert';

import '../../../../../utils/api_utils/api_utils.dart';
import '../../../../../utils/logger/logger.dart';
import '../../../../../utils/network_utils/network_utils.dart';

class IndexJadwalPosyandu {
  Future<List<dynamic>> getAllJadwalPosyandu(String token) async {
    final String link = ApiUtils().urlGetListJadwalPosyandu();
    final Map<String, dynamic> parameterQuery = {};

    return await NetworkUtils(token: token).get(link, parameterQuery).then((response) {
      logger.d(response.toString());
      return response;
    });
  }
  Future<List<dynamic>> deleteJadwalPosyandu(String token, String id ) async {
    final String link = ApiUtils().urlDeleteJadwalPosyandu(id);
    final String body = json.encode({});

    return await NetworkUtils(token: token).delete(link, body).then((response) {
      logger.d(response.toString());
      return response;
    });
  }
}
