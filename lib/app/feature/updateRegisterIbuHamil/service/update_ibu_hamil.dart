import 'dart:convert';

import '../../../../utils/api_utils/api_utils.dart';
import '../../../../utils/logger/logger.dart';
import '../../../../utils/network_utils/network_utils.dart';
import '../model/update_ibu_hamil_model.dart';

class UpdateIbuHamil {
  Future<List<dynamic>> patchRegisterOrangTua(
      String token, UpdateIbuHamilModel data, String id) async {
    final String link = ApiUtils().urlPatchDataIbuHamil(id);
    final String body = json.encode(data.toJson());

    return await NetworkUtils(token: token).patch(link, body).then((response) {
      logger.d(response.toString());
      return response;
    });
  }
}
