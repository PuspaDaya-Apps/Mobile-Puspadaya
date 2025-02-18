import 'dart:convert';

import 'package:puspadaya/app/feature/jadwal/edit/model/patch_jadwal_posyandu_model.dart';

import '../../../../../utils/api_utils/api_utils.dart';
import '../../../../../utils/logger/logger.dart';
import '../../../../../utils/network_utils/network_utils.dart';

class PatchJadwalPosyandu {
  Future<dynamic> getDetailJadwalPosyandu(String idJadwal, String token) async {
    final String link = ApiUtils().urlGetDetailJadwalPosyandu(idJadwal);
    final Map<String, dynamic> parameterQuery = {};
    logger.d('uri ${link}}');

    return await NetworkUtils(token: token).get(link, parameterQuery).then((response) {
      logger.d(response.toString());
      return response;
    });
  }

  Future<dynamic> patchJadwalPosyandu(String idJadwal, String accessToken,
      PatchJadwalPosyanduModel data) async {
    final String link = ApiUtils().urlPatchDataJadwalPosyandu(idJadwal);
    final String body = json.encode(data.toJson());

    return await NetworkUtils(token: accessToken).patch(link, body).then((response) {
      logger.d(response.toString());
      return response;
    });
  }
}
