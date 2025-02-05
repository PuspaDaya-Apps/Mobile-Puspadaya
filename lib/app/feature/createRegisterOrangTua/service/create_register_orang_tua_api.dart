import 'dart:convert';

import '../../../../utils/api_utils/api_utils.dart';
import '../../../../utils/logger/logger.dart';
import '../../../../utils/network_utils/network_utils.dart';
import '../model/post_orang_tua_body.dart';

class CreateRegisterOrangTuaApi {
  Future<List<dynamic>> postRegisterOrangTua(
      String token, PostOrangTuaBody postOrangtuaBody) async {
    final Map<String, String> header = ApiUtils().headerWithToken(token);
    final Uri link = ApiUtils().urlPostDataOrangTua();
    final String body = json.encode(postOrangtuaBody.toJson());

    return await NetworkUtils().post(link, header, body).then((response) {
      logger.d(response.toString());
      return response;
    });
  }
}
