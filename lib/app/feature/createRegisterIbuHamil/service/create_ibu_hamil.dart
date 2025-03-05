import 'dart:convert';

import '../../../../utils/api_utils/api_utils.dart';
import '../../../../utils/logger/logger.dart';
import '../../../../utils/network_utils/network_utils.dart';
import '../model/post_ibu_hamil_model.dart';

class CreateIbuHamil {
  Future<List<dynamic>> getSearchIbuHamil(String token) async {
    final String link = ApiUtils().urlGetListOrangTua();
    final Map<String, dynamic> parameterQuery = {};

    return await NetworkUtils(token: token)
        .get(link, parameterQuery)
        .then((response) {
      logger.d(response.toString());
      return response;
    });
  }

  Future<List<dynamic>> postCreateIbuHamil(
      String token, PostIbuHamilModel data) async {
    final String link = ApiUtils().urlPostDataIbuHamil();
    final String body = json.encode(data.toJson());

    return await NetworkUtils(token: token).post(link, body).then((response) {
      logger.d(response.toString());
      return response;
    });
  }
}
