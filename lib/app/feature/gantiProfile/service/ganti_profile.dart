import 'dart:convert';

import 'package:puspadaya/app/feature/gantiProfile/model/patch_ganti_profile.dart';

import '../../../../utils/api_utils/api_utils.dart';
import '../../../../utils/logger/logger.dart';
import '../../../../utils/network_utils/network_utils.dart';

class GantiProfile {
  Future<dynamic> patchGantiProfile(
      String accessToken, PatchGantiProfileModel data) async {
    final String link = ApiUtils().urlPatchGantiProfile();
    final String body = json.encode(data.toJson());

    return await NetworkUtils(token: accessToken)
        .patch(link, body)
        .then((response) {
      logger.d(response.toString());
      return response;
    });
  }
}
