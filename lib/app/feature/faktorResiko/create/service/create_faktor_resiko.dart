import 'dart:convert';

import '../../../../../utils/api_utils/api_utils.dart';
import '../../../../../utils/logger/logger.dart';
import '../../../../../utils/network_utils/network_utils.dart';
import '../model/post_pertanyaan_model.dart';

class CreateFaktorResiko {
  Future<dynamic> getFaktorResikoByBalita(String token, String id) async {
    final String link = ApiUtils().urlGetFaktorResikoPertanyaan(id);
    final Map<String, dynamic> parameterQuery = {};

    return await NetworkUtils(token: token)
        .get(link, parameterQuery)
        .then((response) {
      logger.d(response.toString());
      return response;
    });
  }

  Future<dynamic> postFaktorResiko(
      PostPertanyaanModel postPertanyaanModel, String accessToken) async {
    final String link = ApiUtils().urlPostFaktorResikoPertanyaann();
    logger.d(json.encode(postPertanyaanModel.toJson()));
    final String body = json.encode(postPertanyaanModel.toJson());

    return await NetworkUtils(token: accessToken)
        .post(link, body)
        .then((response) {
      logger.d(response.toString());
      return response;
    });
  }
}
