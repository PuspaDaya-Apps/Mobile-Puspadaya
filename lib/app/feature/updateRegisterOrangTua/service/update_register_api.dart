import 'dart:convert';

import 'package:puspadaya/app/feature/updateRegisterOrangTua/model/patch_orang_tua_body.dart';

import '../../../../utils/api_utils/api_utils.dart';
import '../../../../utils/logger/logger.dart';
import '../../../../utils/network_utils/network_utils.dart';

class UpdateRegisterOrangTuaApi {
  Future<List<dynamic>> postRegisterOrangTua(
      String token, PatchOrangTuaBody postOrangtuaBody) async {
    final Map<String, String> header = ApiUtils().headerWithToken(token);
    final Uri link = ApiUtils().urlPatchDataOrangTua();
    final String body = json.encode(postOrangtuaBody.toJson());

    return await NetworkUtils().patch(link, header, body).then((response) {
      logger.d(response.toString());
      return response;
    });
  }
}
