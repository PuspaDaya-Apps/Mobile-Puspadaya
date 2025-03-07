import 'dart:convert';

import 'package:puspadaya/app/feature/gantiKataSandi/model/post_ganti_kata_sandi_model.dart';

import '../../../../utils/api_utils/api_utils.dart';
import '../../../../utils/logger/logger.dart';
import '../../../../utils/network_utils/network_utils.dart';

class GantiKataSandiService {
  Future<dynamic> gantiKataSandi(
      String accessToken, PostGantiKataSandiModel data) async {
    final String link = ApiUtils().urlChangePassword();
    final String body = json.encode(data.toJson());

    return await NetworkUtils(token: accessToken)
        .post(link, body)
        .then((response) {
      logger.d(response.toString());
      return response;
    });
  }
}
