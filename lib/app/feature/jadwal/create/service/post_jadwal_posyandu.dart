import 'dart:convert';

import '../../../../../utils/api_utils/api_utils.dart';
import '../../../../../utils/logger/logger.dart';
import '../../../../../utils/network_utils/network_utils.dart';
import '../model/post_jadwal_posyandu_model.dart';

class CreateJadwalPosyandu {
  Future<dynamic> createJadwalPosyandu(
      PostJadwalPosyanduModel postJadwalPosyanduModel,
      String accessToken) async {
    final Map<String, String> header = ApiUtils().headerWithToken(accessToken);
    final Uri link = ApiUtils().urlPostDataJadwalPosyandu();

    final String body = json.encode(postJadwalPosyanduModel.toJson());
    return await NetworkUtils().post(link, header, body).then((response) {
      logger.d(response.toString());
      return response;
    });
  }
}
