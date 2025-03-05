import 'dart:convert';

import 'package:puspadaya/utils/api_utils/api_utils.dart';

import '../../../../../utils/logger/logger.dart';
import '../../../../../utils/network_utils/network_utils.dart';
import '../model/post_alat_ukur_model.dart';
import '../model/post_alat_ukur_alat_deteksi_dini_model.dart';

class CreateAlatUkur {
  Future<List<dynamic>> getAllAlatUkurAdmin(String token) async {
    final String link = ApiUtils().urlGetListAlatUkurAdmin();
    final Map<String, dynamic> parameterQuery = {};

    return await NetworkUtils(token: token).get(link, parameterQuery).then((response) {
      logger.d(response.toString());
      return response;
    });
  }
  Future<dynamic> createAlatUkurKader(
      PostAlatUkurModel postAlatUkur,
      String accessToken) async {
    final String link = ApiUtils().urlPostDataAlatUkurKader();
    final String body = json.encode(postAlatUkur.toJson());

    return await NetworkUtils(token: accessToken).post(link, body).then((response) {
      logger.d(response.toString());
      return response;
    });
  }

  Future<List<dynamic>> createAlatUkurKaderDeteksiDini(
      PostAlatUkurAlatDeteksiDiniModel postAlatUkur,
      String accessToken) async {
    final String link = ApiUtils().urlPostDataAlatUkurKaderDeteksiDini();
    final String body = json.encode(postAlatUkur.toJson());

    return await NetworkUtils(token: accessToken).post(link, body).then((response) {
      logger.d(response.toString());
      return response;
    });
  }
}
