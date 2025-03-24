import 'dart:convert';

import '../../../../../utils/api_utils/api_utils.dart';
import '../../../../../utils/logger/logger.dart';
import '../../../../../utils/network_utils/network_utils.dart';
import '../../create/model/post_create_kehadiran_model.dart';

class UpdateKehadiranService {
  Future<dynamic> patchKehadiran(
      String id, String accessToken, PostCreateKehadiranModel data) async {
    final String link = ApiUtils().urlPatchDataKehadiranPosyandu(id);
    final String body = json.encode(data.toJson());

    return await NetworkUtils(token: accessToken)
        .patch(link, body)
        .then((response) {
      logger.d(response.toString());
      return response;
    });
  }
}