import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:puspadaya/app/feature/gantiProfile/model/patch_ganti_profile.dart';

import '../../../../utils/api_utils/api_utils.dart';
import '../../../../utils/logger/logger.dart';
import '../../../../utils/network_utils/network_utils.dart';

class GantiProfile {
  Future<dynamic> patchGantiProfile(
      String accessToken, PatchGantiProfileModel data) async {
    final String link = ApiUtils().urlPatchGantiProfile();
    // final String body = json.encode(data.toJson());
    final Map<String, dynamic> body = data.toJson();
    debugPrint("body ${body.toString()}");
    logger.d(body);

    return await NetworkUtils(token: accessToken)
        .patchFormBody(link, body)
        .then((response) {
      logger.d(response.toString());
      return response;
    });
  }

  Future<dynamic> getDetailUserById(
      String accessToken, String userId) async {
    final String link = ApiUtils().urlGetDetailCurrentUser(userId);
    final Map<String, dynamic> parameterQuery = {};
    logger.d('uri ${link}}');

    return await NetworkUtils(token: accessToken).get(link, parameterQuery).then((response) {
      logger.d(response.toString());
      return response;
    });
  }
}
