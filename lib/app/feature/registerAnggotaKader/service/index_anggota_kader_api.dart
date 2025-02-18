import 'package:flutter/material.dart';

import '../../../../utils/api_utils/api_utils.dart';
import '../../../../utils/network_utils/network_utils.dart';

class IndexAnggotaKaderApi {
  Future<List<dynamic>> getListAnggotaKaderService (String token) async {
    final String link = ApiUtils().urlGetListAnggotaKader();
    final Map<String, dynamic> parameterQuery = {};

    return await NetworkUtils(token: token).get(link, parameterQuery).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }
}