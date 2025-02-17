import 'dart:convert';

import 'package:puspadaya/app/feature/jadwal/edit/model/patch_jadwal_posyandu_model.dart';

import '../../../../../utils/api_utils/api_utils.dart';
import '../../../../../utils/logger/logger.dart';
import '../../../../../utils/network_utils/network_utils.dart';

class PatchJadwalPosyandu {
  Future<dynamic> getDetailJadwalPosyandu(String idJadwal, String token) async {
    final Map<String, String> header = ApiUtils().headerWithToken(token);
    final Uri link = ApiUtils().urlGetDetailJadwalPosyandu(idJadwal);
    logger.d('uri ${link}}');
    return await NetworkUtils().get(link, header).then((response) {
      logger.d(response.toString());
      return response;
    });
  }

  Future<dynamic> patchJadwalPosyandu(String idJadwal, String accessToken,
      PatchJadwalPosyanduModel data) async {
    final Map<String, String> header = ApiUtils().headerWithToken(accessToken);
    final Uri link = ApiUtils().urlPatchDataJadwalPosyandu(idJadwal);
    final String body = json.encode(data.toJson());

    return await NetworkUtils().patch(link, header, body).then((response) {
      logger.d(response.toString());
      return response;
    });
  }
}
