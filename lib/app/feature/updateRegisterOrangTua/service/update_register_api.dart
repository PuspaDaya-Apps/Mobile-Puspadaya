import 'dart:convert';

import 'package:puspadaya/app/feature/updateRegisterOrangTua/model/patch_orang_tua_body.dart';

import '../../../../utils/api_utils/api_utils.dart';
import '../../../../utils/logger/logger.dart';
import '../../../../utils/network_utils/network_utils.dart';

class UpdateRegisterOrangTuaApi {
  Future<List<dynamic>> patchRegisterOrangTua(
      String token, PatchOrangTuaBody patchOrangtuaBody, String id) async {
    final String link = ApiUtils().urlPatchDataOrangTua(id);
    final String body = json.encode(patchOrangtuaBody.toJson());

    return await NetworkUtils(token: token).patch(link, body).then((response) {
      logger.d(response.toString());
      return response;
    });
  }
}
