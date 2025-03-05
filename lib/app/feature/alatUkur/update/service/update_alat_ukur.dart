import 'dart:convert';

import 'package:puspadaya/app/feature/alatUkur/create/model/post_alat_ukur_alat_deteksi_dini_model.dart';

import '../../../../../utils/api_utils/api_utils.dart';
import '../../../../../utils/logger/logger.dart';
import '../../../../../utils/network_utils/network_utils.dart';
import '../../create/model/post_alat_ukur_model.dart';

class UpdateAlatUkur {
  // Alat Deteksi Dini
  Future<dynamic> patchAlatUkurDeteksiDini(
      String accessToken, PostAlatUkurAlatDeteksiDiniModel data) async {
    final String link = ApiUtils().urlPostDataAlatUkurKaderDeteksiDini();
    final String body = json.encode(data.toJson());

    return await NetworkUtils(token: accessToken)
        .patch(link, body)
        .then((response) {
      logger.d(response.toString());
      return response;
    });
  }

  // Non Alat Deteksi Dini
  Future<dynamic> patchAlatUkur(
      String idAlatUkur, String accessToken, PostAlatUkurModel data) async {
    final String link = ApiUtils().urlPatchDataAlatUkurKader(idAlatUkur);
    final String body = json.encode(data.toJson());

    return await NetworkUtils(token: accessToken)
        .patch(link, body)
        .then((response) {
      logger.d(response.toString());
      return response;
    });
  }
}
