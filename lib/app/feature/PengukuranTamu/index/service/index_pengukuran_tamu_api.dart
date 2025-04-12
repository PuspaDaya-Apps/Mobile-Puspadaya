import 'package:flutter/material.dart';

import '../../../../../utils/api_utils/api_utils.dart';
import '../../../../../utils/logger/logger.dart';
import '../../../../../utils/network_utils/network_utils.dart';

class IndexPengukuranTamuApi {
  Future<List<dynamic>> getpengukuranTamuService (String token) async {
    final String link = ApiUtils().urlGetListPengukuranTamu();
    final Map<String, dynamic> parameterQuery = {
      'limit': 5000
    };

    logger.i(link);

    return await NetworkUtils(token: token).get(link, parameterQuery).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }
}