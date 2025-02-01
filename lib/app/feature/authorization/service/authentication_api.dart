import 'dart:convert';

import '../../../../utils/api_utils/api_utils.dart';
import '../../../../utils/network_utils/network_utils.dart';
import '../model/accesstoken_model.dart';

class AuthenticationApi {

  Future<List<dynamic>> getAccesTokenService (AccessTokenModel accestokenmodel) async {
    final Map<String, String> header = ApiUtils().header();
    final Uri link = ApiUtils().urlRefreshToken();
    final String body = json.encode(accestokenmodel.toJson());

    return await NetworkUtils().post(link, header, body).then((response) {
      return response;
    });
  }

  Future<List<dynamic>> logoutService (String token) async {
    final Map<String, String> header = ApiUtils().headerWithToken(token);
    final Uri link = ApiUtils().urlLogout();
    final String body = json.encode({});

    return await NetworkUtils().post(link, header, body).then((response) {
      return response;
    });
  }
}